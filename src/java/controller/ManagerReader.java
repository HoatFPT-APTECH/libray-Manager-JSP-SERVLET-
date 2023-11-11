/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
             request.setAttribute("identity_card", "");
        request.setAttribute("role_id", 0);
        request.setAttribute("start_day",0);
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
        ArrayList<String> constraint= new ArrayList<>();
        String errorString="Kết quả tìm kiếm ";
        int role= Integer.parseInt(request.getParameter("role_id"));
        int time= Integer.parseInt(request.getParameter("start_day"));
        String identity_card= request.getParameter("identity_card");
        if(identity_card.trim().length()>0) constraint.add("identity_card like '%"+ identity_card+"%'");
    
        if(role!=0)constraint.add ("role_id="+String.valueOf(role));
            if(time!=0){
            if(time==1) constraint.add("true order by start_day asc");
            else constraint.add("true order by start_day desc");
        }
        ArrayList<Reader> list = new ArrayList<>();
        try {
            list = readerService.GetAll(constraint);
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
           request.setAttribute("errorString", "Kết quả tìm kiếm /lọc .");
    
        request.setAttribute("readerList", list);
        request.setAttribute("identity_card", identity_card);
        request.setAttribute("role_id", role);
        request.setAttribute("start_day", time);
        request.getSession().setAttribute("Check", "ManageReader");
        request.setAttribute("page", "manager_reader.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
