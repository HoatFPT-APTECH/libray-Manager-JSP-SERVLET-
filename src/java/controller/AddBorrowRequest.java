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
import model.Reader;
import service.BookBO;
import service.BorrowRequestBO;
import service.ReaderBO;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "AddBorrowRequest", urlPatterns = {"/AddBorrowRequest"})
public class AddBorrowRequest extends HttpServlet {
    protected ReaderBO serviceReader= new ReaderBO();
    protected BorrowRequestBO serviceBorrowRequest= new BorrowRequestBO();
    protected BookBO serviceBook= new BookBO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBorrowRequest</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBorrowRequest at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            request.setAttribute("page", "add_borrow_request.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int book_id= Integer.parseInt(request.getParameter("book_id"));
        String identityCard= request.getParameter("identity_card");
        Date due_date= Date.valueOf(request.getParameter("due_date"));
        Reader reader= null;
        Book book=null;
        try {
            reader=this.serviceReader.findReaderByIndentityCard(identityCard).get(0);
            book = this.serviceBook.findBook(book_id);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddBorrowRequest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddBorrowRequest.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(reader==null || book==null){
            request.setAttribute("errorString", "Lỗi! Không tìm thấy Sách hoặc độc giả.");
           request.setAttribute("page", "add_borrow_request.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        }
        else if(book.getAmount()-1<0){
              request.setAttribute("errorString", "Sách này trong thư viện không còn .");
           request.setAttribute("page", "add_borrow_request.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        }
        else{
            BorrowRequest model= new BorrowRequest(-1, reader.id, book_id, 0, due_date);
            book.setAmount(book.getAmount()-1);
            boolean rs= this.serviceBorrowRequest.Add(model);
            if(rs){
                          response.sendRedirect(request.getContextPath()+"/ManageBorrowRequest");  
            }else{
                request.setAttribute("errorString", "Lỗi! Không thêm được yêu cầu mượn sách.");
           request.setAttribute("page", "add_borrow_request.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
            }
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
