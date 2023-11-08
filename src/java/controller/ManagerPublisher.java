/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Publisher;
import service.PublisherBO;
/**
 *
 * @author NguyenTienDat
 */
@WebServlet("/ManagerPublisher")
public class ManagerPublisher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublisherBO publisherBO = new PublisherBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerPublisher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String errorString = null;
			ArrayList<Publisher> list = null;

			try {
				list = publisherBO.listPublisher();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
			if (request.getAttribute("errorString") != null) {
				errorString = (String) request.getAttribute("errorString");
			}
			// Lưu thông tin vào request attribute trước khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("publisherList", list);
			request.getSession().setAttribute("Check", "ManagerPublisher");
			// Forward sang /WEB-INF/views/productListView.jsp
                        request.setAttribute("page", "manager_publisher.jsp");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

