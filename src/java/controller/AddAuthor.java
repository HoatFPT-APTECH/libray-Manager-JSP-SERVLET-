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
import model.Author;
import service.AuthorBO;

/**
 *
 * @author NguyenTienDat
 */
@WebServlet("/AddAuthor")
public class AddAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthorBO authorBO = new AuthorBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAuthor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
                    request.setAttribute("page", "add_author.jsp");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name_author = request.getParameter("name_author");
		Author author = new Author();
		System.out.println(name_author);
		author.setName(name_author);
		try {
			int result = authorBO.insertAuthor(author);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ManagerAuthor");
//		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ManageCategory");
//		dispatcher.forward(request, response);
	}

}
