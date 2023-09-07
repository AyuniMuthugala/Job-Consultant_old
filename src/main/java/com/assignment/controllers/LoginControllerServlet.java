package com.assignment.controllers;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.assignment.entities.Employee;
import com.assignment.services.Employee_Service;
import com.assignment.util.SessionManager;


@WebServlet("/LoginControllerServlet")
public class LoginControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name = "jdbc/appointment")
	private DataSource dataSource;
	
    public LoginControllerServlet() {
        super();
  
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginAuthentication(request,response);
		
	}
	private void LoginAuthentication(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		try {
			if (Employee_Service.VerifyLogin(dataSource, email, password)) {
				Employee employee = Employee_Service.GetByEmail(dataSource, email);
				
				 // Get the SessionManager instance
	            SessionManager sessionManager = SessionManager.getInstance();
	            
	            // Set session attributes
	            sessionManager.setEmployeeSessionAttributes(session, employee);
	            
				
				response.sendRedirect("index.jsp");
				
			 
				
			} else {
				request.setAttribute("exceptionerror","User login and password incorrect");
				request.setAttribute("exceptionerrorshow", "");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("exceptionerror", e.toString());
			request.setAttribute("exceptionerrorshow", "");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	
	}

}
