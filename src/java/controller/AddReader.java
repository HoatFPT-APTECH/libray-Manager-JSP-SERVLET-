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
import model.Reader;
import service.ReaderBO;

@WebServlet(name = "AddReader", urlPatterns = {"/AddReader"})
public class AddReader extends HttpServlet {
    protected ReaderBO serviceReader = new ReaderBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("page", "add_reader.jsp");
        request.getRequestDispatcher("./index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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
        boolean rs = this.serviceReader.Add(model);

        if (rs) {
            response.sendRedirect(request.getContextPath() + "/ManagerReader");
        } else {
            response.sendRedirect(request.getContextPath() + "/AddReader");
        }
    }
}
