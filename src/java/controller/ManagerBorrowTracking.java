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
import service.BookBO;
import service.BorrowRequestBO;
import service.BorrowTrackingBO;
import service.ReaderBO;

@WebServlet("/ManageBorrowTracking")
public class ManagerBorrowTracking extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BorrowTrackingBO borrowTrackingService = new BorrowTrackingBO();
    private ReaderBO readerService= new ReaderBO();
    private BookBO bookService= new BookBO();
    private BorrowRequestBO borrowRequestService= new BorrowRequestBO();

    public ManagerBorrowTracking() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorString = null;
        
        ArrayList<BorrowTracking> list = null;
        try {
            list = borrowTrackingService.GetAll();
            for(BorrowTracking bt : list){
                bt.borrow_request= this.borrowRequestService.GetDetail(bt.request_id);
                bt.book= this.bookService.findBook(bt.borrow_request.book_id);
                bt.reader= this.readerService.GetDetail(bt.borrow_request.reader_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("borrowTrackingList", list);
        request.setAttribute("identity_card", "");
        request.getSession().setAttribute("Check", "ManageBorrowTracking");
        request.setAttribute("page", "manager_borrow_tracking.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              ArrayList<BorrowTracking> list = new ArrayList<>();
        ArrayList<String> constraint= new ArrayList<String> ();
        String identity_card= request.getParameter("identity_card");
        System.out.println("identity "+identity_card);
        if(identity_card.trim().length()>0)  constraint.add("r.identity_card like '%"+identity_card+"%'");
        try {
            list = borrowTrackingService.GetAllWithConstraint(constraint);
            for(BorrowTracking bt : list){
                bt.borrow_request= this.borrowRequestService.GetDetail(bt.request_id);
                bt.book= this.bookService.findBook(bt.borrow_request.book_id);
                bt.reader= this.readerService.GetDetail(bt.borrow_request.reader_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
          
        }

        request.setAttribute("identity_card", identity_card);
        request.setAttribute("errorString", "Kết quả tìm kiểm theo chứng minh thư");
             request.setAttribute("page", "manager_borrow_tracking.jsp");
               request.setAttribute("borrowTrackingList", list);
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
