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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
@WebServlet(name = "EditBorrowTracking", urlPatterns = {"/EditBorrowTracking"})
public class EditBorrowTracking extends HttpServlet {
     protected BorrowTrackingBO serviceBorrowTracking = new BorrowTrackingBO();
      protected BorrowRequestBO serviceBorrowRequest= new BorrowRequestBO();
      protected BookBO serviceBook= new BookBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int id= Integer.parseInt(request.getParameter("id"));
         BorrowTracking bt= this.serviceBorrowTracking.GetDetail(id);
         
         BorrowRequest br= this.serviceBorrowRequest.GetDetail(bt.request_id);
         
          try {
              Book book= this.serviceBook.findBook(br.book_id);
               request.setAttribute("bookPrice", book.price);
          } catch (ClassNotFoundException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          }
             request.setAttribute("due_date", br.due_date);
             request.setAttribute("borrow_tracking", bt);
              request.setAttribute("JsPage", "add_borrow_tracking.js");
             request.setAttribute("request_id", bt.request_id);
        request.setAttribute("page", "edit_borrow_tracking.jsp");
        request.getRequestDispatcher("./index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
              request.setCharacterEncoding("UTF-8");
              int request_id = Integer.parseInt(request.getParameter("request_id"));
              BorrowRequest br= this.serviceBorrowRequest.GetDetail(request_id);
              Date due_date = (Date) br.due_date;
              Book book= this.serviceBook.findBook(br.book_id);
              double bookPrice= book.price;
              int return_status = Integer.parseInt(request.getParameter("return_status"));
              
              Date return_date = Date.valueOf(request.getParameter("return_date"));
              long overDay= this.calculateDaysBetweenDates(due_date.toString(), return_date.toString());
            double fineAmount= overDay*0.1* book.price;
              if(return_status==3)fineAmount=book.price;
              
              BorrowTracking bt= new BorrowTracking();
              bt.id= Integer.parseInt(request.getParameter("id"));
              bt.request_id= request_id;
        bt.fine_amound=fineAmount>0?fineAmount:0;
              bt.return_date= return_date;
              bt.return_status= return_status;
             boolean success=  this.serviceBorrowTracking.Update(bt.id,bt);


        if (success) {
            br.status=1;
            this.serviceBorrowRequest.Update(request_id, br);
         
            response.sendRedirect(request.getContextPath() + "/ManageBorrowTracking");
        } else {
            
            response.sendRedirect(request.getContextPath() + "/EditBorrowRequest");
        }
          } catch (ClassNotFoundException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(AddBorrowTracking.class.getName()).log(Level.SEVERE, null, ex);
          }
    }
      public  long calculateDaysBetweenDates(String dateStr1, String dateStr2) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date1 = LocalDate.parse(dateStr1, formatter);
        LocalDate date2 = LocalDate.parse(dateStr2, formatter);

        long daysBetween = ChronoUnit.DAYS.between(date1, date2);

        return daysBetween;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
