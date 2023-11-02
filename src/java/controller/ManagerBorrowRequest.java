/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BorrowRequest;
import service.BorrowRequestBO;

@WebServlet("/ManageBorrowRequest")
public class ManagerBorrowRequest extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected BorrowRequestBO borrowRequestService ;

    public ManagerBorrowRequest() {
        super();
        try {
              this.borrowRequestService= new BorrowRequestBO();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        ArrayList<BorrowRequest> list = new ArrayList<BorrowRequest>();
        try {
            list = borrowRequestService.GetAll();
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        request.setAttribute("borrowRequestList", list);
    

        request.setAttribute("page", "manager_borrow_request.jsp");
        
 request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
