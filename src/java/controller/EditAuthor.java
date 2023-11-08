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
@WebServlet("/EditAuthor")
public class EditAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthorBO authorBO = new AuthorBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAuthor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String id = (String) request.getParameter("id");

			Author author = null;

			String errorString = null;

			try {
				author = authorBO.findAuthor(id);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Không có lỗi.
			// Sản phẩm không tồn tại để edit.
			// Redirect sang trang danh sách sản phẩm.
			if (errorString != null && author == null) {
				response.sendRedirect(request.getServletPath() + "/ManagerAuthor");
				return;
			}

			// Lưu thông tin vào request attribute trước khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("author", author);
                         request.setAttribute("page", "edit_author.jsp");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String name = (String) request.getParameter("name_author");
		Author author = new Author(id, name);
		String errorString = null;
		int result = 0;
		try {
			result = authorBO.updateAuthor(author);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result == 0 && errorString == null) {
			errorString = "Chỉnh sửa thất bại";
		}
		if (result == 1)
			errorString = "Chỉnh sửa thành công";
		// Lưu thông tin vào request attribute trước khi forward sang views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("author", author);
		// Nếu có lỗi forward sang trang edit.
		if (errorString != null) {
			response.sendRedirect(request.getContextPath() + "/ManagerAuthor");
		}
		// Nếu mọi thứ tốt đẹp.
		// Redirect sang trang danh sách sản phẩm.
		else {
			response.sendRedirect(request.getContextPath() + "/ManagerAuthor");
		}
	}

}
