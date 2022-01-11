package com.onlineplantbooking.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.onlineplantbooking.model.Orders;
import com.onlineplantbooking.model.Product;
import com.onlineplantbooking.model.User;
import com.onlineplantbooking.util.ConnectionUtil;

public class OrdersDaoImpl {

	public int insertOrder(Orders order) throws SQLException {
		ProductDaoImpl proDao = new ProductDaoImpl();
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		int userId = userDaoImpl.findUserId(order.getUser());
		ResultSet plant_id = proDao.findProductId(order.getProduct());
		ConnectionUtil conUtil = new ConnectionUtil();
		Connection con = conUtil.getDbConnection();
		int i = 0;
		String query2 = "select wallet from user_details where user_id='" + userId + "'";
		Statement st = con.createStatement();
		ResultSet rs1 = st.executeQuery(query2);
		double wallet = 0;
		if (rs1.next()) {
			wallet = rs1.getDouble(1);
		}

		if (wallet > order.getTotalPrice()) {

			String query = "update user_details set wallet=wallet-'" + order.getTotalPrice() + "' where user_id='"
					+ userId + "'";
			Statement st1 = con.createStatement();
			st1.executeUpdate(query);
			String insertQuery = "insert into order_details(user_id,plant_id,quantity,totalprice,address,order_date) values(?,?,?,?,?,?)";

			PreparedStatement pst = null;

			try {
				pst = con.prepareStatement(insertQuery);
				pst.setInt(1, userId);
				if (plant_id.next()) {
					pst.setInt(2, plant_id.getInt(1));
				}
				pst.setInt(3, order.getQuantity());
				pst.setDouble(4, order.getTotalPrice());
				pst.setString(5, order.getAddress());
				pst.setDate(6, new java.sql.Date(new Date().getTime()));
				i = pst.executeUpdate();
				System.out.println("value inserted successfully");

			} catch (SQLException e) {

				e.printStackTrace();
				System.out.println("value not inserted in the table");
			}
		} else {
			System.out.println("low balance");
		}
		return i;
	}

//	public List<Orders> viewOrders(User currentUser) {
//		List<Orders> userOrdersList = new ArrayList<Orders>();
//		String query = "select * from plant_orders where user_id=?";
//		Connection con = ConnectionUtil.getDbConnection();
//		ProductDaoImpl productDaoImpl = new ProductDaoImpl();
//
//		UserDaoImpl userDaoImpl = new UserDaoImpl();
//		int userId = 0;
//		userId = userDaoImpl.findUserId(currentUser);
//
//		try {
//			PreparedStatement pst = con.prepareStatement(query);
//			pst.setInt(1, userId);
//			ResultSet rs = pst.executeQuery();
//			while (rs.next()) {
//				Product products = productDaoImpl.findProduct(rs.getInt(3));
//				System.out.println(products);
//				UserDaoImpl userDao = new UserDaoImpl();
//				User user = userDao.findUser(userId);
//				// User user=userDao.findUser(rs.getInt(2));
//				// System.out.println(products);
//				// Orders orders=new Orders(products,currentUser,rs.getInt(4),rs.getDouble(5));
//
//				// userOrdersList.add(new
//				// Orders(rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getDouble(5)));
//
//				int userId1 = rs.getInt(2);
//				// userOrdersList.add(orders);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return userOrdersList;
//	}

	public void update(int quantity, int order_id) throws SQLException {
		String updateQuery = "update plant_orders set quantity =? where order_id= ?";
		Connection con = ConnectionUtil.getDbConnection();
		PreparedStatement pstmt = con.prepareStatement(updateQuery);
		pstmt.setInt(1, quantity);
		pstmt.setInt(2, order_id);
		int i = pstmt.executeUpdate();
		System.out.println(i + "row updated");
		pstmt.close();
		con.close();

	}

	public void delete(int orderId) throws SQLException {
		String deleteQuery = "delete from plant_orders where order_id=?";
		Connection con = ConnectionUtil.getDbConnection();
		PreparedStatement pstmt1 = con.prepareStatement(deleteQuery);
		pstmt1.setInt(1, orderId);
		int i = pstmt1.executeUpdate();
		System.out.println(i + "row deleted");
		pstmt1.close();
		con.close();

	}

	public List<Orders> ShowOrder(User user) {
		ConnectionUtil con = new ConnectionUtil();
		List<Orders> orderList = new ArrayList<Orders>();
		String query = "select * from order_details where user_id=" + user.getUserId();
		Connection conn = con.getDbConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				ProductDaoImpl productDao = new ProductDaoImpl();
				Product product = productDao.findProduct(rs.getInt(3));
				Orders order = new Orders(product, user, rs.getInt(4), rs.getInt(5), rs.getString(6),rs.getDate(7));
				orderList.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderList;

	}

}
