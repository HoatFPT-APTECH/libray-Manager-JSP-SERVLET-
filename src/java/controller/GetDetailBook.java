/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;
import model.Category;
import model.Publisher;
import service.AuthorBO;
import service.BookBO;
import service.CategoryBO;
import service.PublisherBO;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "GetDetailBook", urlPatterns = {"/GetDetailBook"})
public class GetDetailBook extends HttpServlet {

  private BookBO bookService = new BookBO();
        private CategoryBO serviceCategory= new CategoryBO();
    private PublisherBO servicePublisher= new PublisherBO();
    private AuthorBO serviceAuthorBO= new AuthorBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            
             ArrayList<Publisher> listPublisher= new ArrayList<Publisher>();
            ArrayList<Category> listCategory= new ArrayList<Category>();
            ArrayList<Author> listAuthor= new ArrayList<Author>();
            listPublisher= this.servicePublisher.listPublisher();
            listAuthor= this.serviceAuthorBO.listAuthor();
            listCategory= this.serviceCategory.listCategory();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listAuthor", listAuthor);
            request.setAttribute("listPublisher", listPublisher);
            
            
            Book book = this.bookService.findBook(id);
            request.setAttribute("book", book);
            request.setAttribute("page", "detail_book.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
        }
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
