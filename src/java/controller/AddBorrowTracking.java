/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;
import model.BorrowRequest;
import model.BorrowTracking;
import service.BookBO;
import service.BorrowRequestBO;
import service.BorrowTrackingBO;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "AddBorrowTracking", urlPatterns = {"/AddBorrowTracking"})
public class AddBorrowTracking extends HttpServlet {

      protected BorrowTrackingBO serviceBorrowTracking = new BorrowTrackingBO();
      protected BorrowRequestBO serviceBorrowRequest= new BorrowRequestBO();
      protected BookBO serviceBook= new BookBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int id_request= Integer.parseInt(request.getParameter("id"));
         BorrowRequest br= this.serviceBorrowRequest.GetDetail(id_request);
          try {
              Book book= this.serviceBook.findBook(br.book_id);
               request.setAttribute("bookPrice", book.price);
          } catch (ClassNotFoundException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          }
             request.setAttribute("due_date", br.due_date);
              request.setAttribute("JsPage", "add_borrow_tracking.js");
             request.setAttribute("request_id", id_request);
        request.setAttribute("page", "add_borrow_tracking.jsp");
        request.getRequestDispatcher("./index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int request_id = Integer.parseInt(request.getParameter("request_id"));
        BorrowRequest br= this.serviceBorrowRequest.GetDetail(request_id);
        Date due_date = (Date) br.due_date;
        int return_status = Integer.parseInt(request.getParameter("return_status"));
        
        Date return_date = Date.valueOf(request.getParameter("return_date"));

//        BorrowTracking model = new BorrowTracking(-1, request_id, return_status, 0, return_date);

//        boolean success = this.serviceBorrowTracking.Add(model);

//        if (success) {
//            response.sendRedirect(request.getContextPath() + "/ManageBorrowTracking");
//        } else {
//            response.sendRedirect(request.getContextPath() + "/AddBorrowTracking");
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
