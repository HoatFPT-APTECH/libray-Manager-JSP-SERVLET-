package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BorrowTracking;
import service.BorrowTrackingBO;

@WebServlet("/ManageBorrowTracking")
public class ManagerBorrowTracking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BorrowTrackingBO borrowTrackingService = new BorrowTrackingBO();

    public ManagerBorrowTracking() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorString = null;
        ArrayList<BorrowTracking> list = null;
        try {
            list = borrowTrackingService.GetAll();
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("borrowTrackingList", list);
        request.getSession().setAttribute("Check", "ManageBorrowTracking");
        request.setAttribute("page", "manager_borrow_tracking.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
