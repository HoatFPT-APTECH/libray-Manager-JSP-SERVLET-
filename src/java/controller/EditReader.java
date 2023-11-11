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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Author;
import model.Category;
import model.Publisher;
import model.Reader;
import repository.AuthorDAO;
import repository.PublisherDAO;
import service.AuthorBO;
import service.CategoryBO;
import service.PublisherBO;
import service.ReaderBO;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "EditReader", urlPatterns = {"/EditReader"})
public class EditReader extends HttpServlet {
    private ReaderBO serviceReader= new ReaderBO();
 
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
            out.println("<title>Servlet EditReader</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditReader at " + request.getContextPath() + "</h1>");
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
        
            int id= Integer.parseInt(request.getParameter("id"));
            Reader reader= this.serviceReader.GetDetail(id);
           
            request.setAttribute("reader", reader);
            request.setAttribute("page", "edit_reader.jsp");
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
         int id= Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String identityCard = request.getParameter("identity_card");
        int book_borrowed= Integer.parseInt(request.getParameter("book_borrowed"));
        int borrowed_time=  Integer.parseInt(request.getParameter("borrowed_time"));
        String readerAddress = request.getParameter("reader_address");
        Date dateOfBirth = Date.valueOf(request.getParameter("date_of_birth"));
        int role_id = Integer.parseInt(request.getParameter("role_id"));
        Date startDay = Date.valueOf(request.getParameter("start_day"));
        Date endDay = Date.valueOf(request.getParameter("end_day"));
        double deposit = Double.parseDouble(request.getParameter("deposit"));

        Reader model = new Reader();
        model.id=id;
        model.books_borrowed=book_borrowed;
        model.borrowed_time=borrowed_time;
        model.date_of_birth= dateOfBirth;
        model.deleted=0;
        model.deposit= deposit;
        model.end_day= endDay;
        model.identity_card= identityCard;
        model.name= name;
        model.reader_address= readerAddress;
        model.role_id= role_id;
        model.start_day= startDay;
        boolean rs = this.serviceReader.Update(model.id,model);

        if (rs) {
            response.sendRedirect(request.getContextPath() + "/ManagerReader");
        } else {
            response.sendRedirect(request.getContextPath() + "/AddReader");
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
