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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BookStatistics;
import model.modelExport;
import repository.ConnectDatabase;
import service.ExcelExporter;

/**
 *
 * @author hoatd
 */
@WebServlet(name = "ExportExcel", urlPatterns = {"/ExportExcel"})
public class ExportExcel extends HttpServlet {
    private  ExcelExporter excelExporter= new ExcelExporter();
     private Connection conn=null;

    public ExportExcel() throws ClassNotFoundException, SQLException {
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
            out.println("<title>Servlet ExportExcel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportExcel at " + request.getContextPath() + "</h1>");
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
    private boolean exportExcel(){
    ArrayList<modelExport> exportData= new ArrayList<modelExport>();
    exportData.add(new modelExport("id", "Tên sách", "Số lượng(hiện có)", "Số lượng sách phục vụ","Đang mượn","TL tốt","TL xấu","TL bồi thường", "Tổng số tiền bồi thường"));
        int totalAmountBook=0;
        int totalCountServed=0;
        int totalReturnGood=0;
        int totalReturnBad=0;
        int totalReturnVeryBad=0;
        double totalMoney= 0;
        int totalBook=0;
        int totalCountBorrow=0;
        for(BookStatistics bs: this.getBookStatistics()){
            String id= String.valueOf(bs.getId());
            String nameBook= String.valueOf(bs.getNameBook());
            String amountBook= String.valueOf(bs.getAmountBook());
            String countServed= String.valueOf(bs.getCountServed());
            String returnGood= String.valueOf(bs.getReturnGood());
            String returnBad= String.valueOf(bs.getReturnBad());
            String returnVeryBad= String.valueOf(bs.getReturnVeryBad());
            String totalFineAmount= String.valueOf(bs.getTotalFineAmount());
            int countBorrow= Integer.valueOf(countServed)-Integer.valueOf(returnGood)- Integer.valueOf(returnBad)- Integer.valueOf(returnVeryBad);
            String strCountBorrow= String.valueOf(countBorrow);
//            cộng tổng 
            totalAmountBook+=bs.getAmountBook();
        totalCountServed+=bs.getCountServed();
        totalReturnGood+=bs.getReturnGood();
        totalReturnBad+=bs.getReturnBad();
         totalReturnVeryBad+= bs.getReturnVeryBad();
        totalMoney+=bs.getTotalFineAmount();
        totalBook++;
        totalCountBorrow+=countBorrow;
            exportData.add(new modelExport(id, nameBook, amountBook, countServed,strCountBorrow, returnGood, returnBad, returnVeryBad, totalFineAmount));
        }
        exportData.add(new modelExport("Tổng ",String.valueOf(totalBook),String.valueOf(totalAmountBook), 
                String.valueOf(totalCountServed),String.valueOf(totalCountBorrow), 
                
                String.valueOf(totalReturnGood),String.valueOf(totalReturnBad), String.valueOf(totalReturnVeryBad),
                String.valueOf(totalMoney)));
        try {
               String userHome = System.getProperty("user.home");
             String filePath = Paths.get(userHome, "Downloads", "ExportLibrary.xlsx").toString();
            this.excelExporter.exportToExcel(exportData,filePath , "Thống kê tình trạng phục vụ sách của thư viên");
            return true;
            
        } catch (Exception e) {
            System.out.println("Lỗi không xuất được file báo cáo excel: "+e.getMessage());
        }
        return false;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        this.exportExcel();

        // Thiết lập status code
        response.setStatus(HttpServletResponse.SC_OK); // Hoặc một status code khác tùy ý

        // Tạo dữ liệu JSON
        String jsonData = "{\"message\": \"Hello, this is a JSON response!\"}";

        // Gửi dữ liệu JSON về client
        PrintWriter out = response.getWriter();
        out.print(jsonData);
        out.flush();
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
        processRequest(request, response);
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
