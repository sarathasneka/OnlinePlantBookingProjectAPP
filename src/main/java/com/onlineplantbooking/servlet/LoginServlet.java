package com.onlineplantbooking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineplantbooking.daoImpl.AdminDaoImpl;
import com.onlineplantbooking.daoImpl.UserDaoImpl;
import com.onlineplantbooking.model.User;
import com.onlineplantbooking.util.ConnectionUtil;

@WebServlet("/login")
/**
 * Servlet implementation class Login
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String emailId=request.getParameter("loginemail");
		System.out.println(emailId);
		String password=request.getParameter("loginpassword");
		System.out.println(password);
	    UserDaoImpl userDao=new UserDaoImpl();
		User user=userDao.validateUser(emailId, password);
		String role=user.getRole();
		System.out.println(user.getUserId());
		HttpSession session1=request.getSession();
		session.setAttribute("userId", user.getUserId());
		session1.setAttribute("currentUser",user);
		String name=null;
		int userId=0;
		
		
		if(role.equals("user")) {
             RequestDispatcher req=request.getRequestDispatcher("buyProduct.jsp");
             req.forward(request, response);
			
		}
		else if(role.equals("admin")) {
		    AdminDaoImpl adminDao=new AdminDaoImpl();
		
			response.sendRedirect("admin.jsp?userId=0");
		

		
		}}}

