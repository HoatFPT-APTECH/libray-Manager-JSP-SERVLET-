/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reader;
import service.ReaderBO;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "ManagerReader", urlPatterns = {"/ManagerReader"})
public class ManagerReader extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReaderBO readerService = new ReaderBO();

    public ManagerReader() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorString = null;
        ArrayList<Reader> list = null;
        try {
            list = readerService.GetAll();
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("readerList", list);
        request.getSession().setAttribute("Check", "ManageReader");
        request.setAttribute("page", "manager_reader.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String errorString="Kết quả tìm kiếm ";
        String identity_card= request.getParameter("identity_card");
        ArrayList<Reader> list = new ArrayList<>();
        try {
            list = readerService.findReaderByIndentityCard(identity_card);
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
           request.setAttribute("errorString", errorString);
    
        request.setAttribute("readerList", list);
        request.getSession().setAttribute("Check", "ManageReader");
        request.setAttribute("page", "manager_reader.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
