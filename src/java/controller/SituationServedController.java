/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.spi.DirStateFactory;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookStatistics;
import model.modelExport;
import repository.ConnectDatabase;
import repository.GenerateLibraryDAO;
import service.ExcelExporter;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "SituationServedController", urlPatterns = {"/SituationServed"})
public class SituationServedController extends HttpServlet {

    private ExcelExporter excelExporter = new ExcelExporter();
    private Connection conn = null;
    private GenerateLibraryDAO library = new GenerateLibraryDAO();

    public SituationServedController() throws ClassNotFoundException, SQLException {

        this.conn = ConnectDatabase.getMySQLConnection();

    }

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
            out.println("<title>Servlet SituationServedController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SituationServedController at " + request.getContextPath() + "</h1>");
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
    public List<BookStatistics> getBookStatistics() {
        List<BookStatistics> bookStatisticsList = new ArrayList<>();
        String sql = "SELECT b.id as 'id', "
                + "b.image as 'image', "
                + "b.name as 'name_book', "
                + "b.amount as 'amount_book', "
                + "COUNT(br.id) as 'count_served', "
                + "SUM(CASE WHEN bt.return_status = 1 THEN 1 ELSE 0 END) as 'return_good', "
                + "SUM(CASE WHEN bt.return_status = 2 THEN 1 ELSE 0 END) as 'return_bard', "
                + "SUM(CASE WHEN bt.return_status = 3 THEN 1 ELSE 0 END) as 'return_verybard', "
                + "SUM(bt.fine_amound) as 'total_fine_amound' "
                + "FROM book b "
                + "LEFT JOIN borrow_request br ON b.id = br.book_id "
                + "LEFT JOIN borrow_tracking bt ON br.id = bt.request_id "
                + " WHERE br.due_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() "
                + "GROUP BY b.id, b.image, b.name, b.amount";

        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String image = rs.getString("image");
                String nameBook = rs.getString("name_book");
                int amountBook = rs.getInt("amount_book");
                int countServed = rs.getInt("count_served");
                int returnGood = rs.getInt("return_good");
                int returnBad = rs.getInt("return_bard");
                int returnVeryBad = rs.getInt("return_verybard");
                double totalFineAmount = rs.getDouble("total_fine_amound");

                BookStatistics bookStatistics = new BookStatistics(id, image, nameBook, amountBook,
                        countServed, returnGood, returnBad, returnVeryBad, totalFineAmount);

                bookStatisticsList.add(bookStatistics);
            }

        } catch (Exception e) {
            System.out.println("Lỗi lấy thông tin thống kê: " + e.getMessage());
        }

        return bookStatisticsList;
    }

    public List<BookStatistics> getBookStatistics(ArrayList<String> constraint) {
        List<BookStatistics> bookStatisticsList = new ArrayList<>();
        String sql = "SELECT b.id as 'id', "
                + "b.image as 'image', "
                + "b.name as 'name_book', "
                + "b.amount as 'amount_book', "
                + "COUNT(br.id) as 'count_served', "
                + "SUM(CASE WHEN bt.return_status = 1 THEN 1 ELSE 0 END) as 'return_good', "
                + "SUM(CASE WHEN bt.return_status = 2 THEN 1 ELSE 0 END) as 'return_bard', "
                + "SUM(CASE WHEN bt.return_status = 3 THEN 1 ELSE 0 END) as 'return_verybard', "
                + "SUM(bt.fine_amound) as 'total_fine_amound' "
                + "FROM book b "
                + "LEFT JOIN borrow_request br ON b.id = br.book_id "
                + "LEFT JOIN borrow_tracking bt ON br.id = bt.request_id"
                + " WHERE br.due_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW() ";
        String havingStr = null;

        List<String> copyOfConstraint = new ArrayList<>(constraint);

        for (String con : copyOfConstraint) {
            if (con.contains("having")) {
                havingStr = con;
                constraint.remove(con);
            }
        }
        sql = this.library.generateSqlWithConstraint(constraint, sql);
        sql += " GROUP BY b.id, b.image, b.name, b.amount ";
        if (havingStr != null) {
            sql += havingStr;
        }
        System.out.println(sql);

        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String image = rs.getString("image");
                String nameBook = rs.getString("name_book");
                int amountBook = rs.getInt("amount_book");
                int countServed = rs.getInt("count_served");
                int returnGood = rs.getInt("return_good");
                int returnBad = rs.getInt("return_bard");
                int returnVeryBad = rs.getInt("return_verybard");
                double totalFineAmount = rs.getDouble("total_fine_amound");

                BookStatistics bookStatistics = new BookStatistics(id, image, nameBook, amountBook,
                        countServed, returnGood, returnBad, returnVeryBad, totalFineAmount);

                bookStatisticsList.add(bookStatistics);
            }

        } catch (Exception e) {
            System.out.println("Lỗi lấy thông tin thống kê: " + e.getMessage());
        }

        return bookStatisticsList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("search", "");
        request.setAttribute("bookCategory", 0);
        request.setAttribute("return_status", 0);
        List<BookStatistics> bookStatisticsList = new ArrayList<>();
        bookStatisticsList = this.getBookStatistics();
        request.setAttribute("JsPage", "bookStatistic.js");
        request.setAttribute("bookStatisticList", bookStatisticsList);
        request.setAttribute("page", "bookStatistic.jsp");

        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
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
        ArrayList<String> constraint = new ArrayList<>();
        String search = request.getParameter("search");
        int returnStatus = Integer.valueOf(request.getParameter("return_status"));
        int bookCategory = Integer.valueOf(request.getParameter("book_category"));
        System.out.println("Search" + search);
        System.out.println("returnStatus" + returnStatus);
        System.out.println("BookCategory" + bookCategory);
        if (returnStatus != 0) {
            constraint.add("bt.return_status =" + String.valueOf(returnStatus));
        }
        if (search.trim().length() > 0) {
            constraint.add("b.name" + " like '%" + search + "%'");
        }
        if (bookCategory == 1) {
            constraint.add("having count(bt.id) >" + String.valueOf(0));
        } else if (bookCategory == 2) {
            constraint.add("  having count(bt.id) =" + String.valueOf(0));
        }

        List<BookStatistics> bookStatisticsList = new ArrayList<>();
        bookStatisticsList = this.getBookStatistics(constraint);
        request.setAttribute("search", search);
        request.setAttribute("bookCategory", bookCategory);
        request.setAttribute("return_status", returnStatus);
        request.setAttribute("errorString", "Kết quả tìm lọc");
        request.setAttribute("JsPage", "bookStatistic.js");
        request.setAttribute("bookStatisticList", bookStatisticsList);
        request.setAttribute("page", "bookStatistic.jsp");

        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);

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
