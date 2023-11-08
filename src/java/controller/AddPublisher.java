/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import java.sql.SQLException;

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
@WebServlet("/AddPublisher")
public class AddPublisher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublisherBO publisherBO = new PublisherBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPublisher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
                    request.setAttribute("page", "add_publisher.jsp");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name_publisher = request.getParameter("name_publisher");
		Publisher publisher = new Publisher();
		System.out.println(name_publisher);
		publisher.setName(name_publisher);
		try {
			int result = publisherBO.insertPublisher(publisher);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ManagerPublisher");
//		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ManageCategory");
//		dispatcher.forward(request, response);
	}

}
