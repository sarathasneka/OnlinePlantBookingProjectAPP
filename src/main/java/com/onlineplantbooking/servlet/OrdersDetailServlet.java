package com.onlineplantbooking.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineplantbooking.daoImpl.OrdersDaoImpl;
import com.onlineplantbooking.daoImpl.UserDaoImpl;
import com.onlineplantbooking.model.Orders;
import com.onlineplantbooking.model.Product;
import com.onlineplantbooking.model.User;

@WebServlet("/ordersDetailServlet")

public class OrdersDetailServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		User rs = (User) session.getAttribute("currentUser");
	
			
			Product product = (Product) session.getAttribute("currentPlant");
			System.out.println(product);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(quantity);
			int plantPrice = Integer.parseInt(request.getParameter("total"));
			System.out.println(plantPrice);
			String address = request.getParameter("addresss");
			System.out.println(address);

			Orders order = new Orders(product, rs, quantity, plantPrice, address);

			OrdersDaoImpl orderDao = new OrdersDaoImpl();
			int i=0;
			try {
				i = orderDao.insertOrder(order);
				if (i> 0) {
					response.sendRedirect("ShowOrder.jsp");
					
				} else {
					response.sendRedirect("orderDetails.jsp");	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			


		}

	}

