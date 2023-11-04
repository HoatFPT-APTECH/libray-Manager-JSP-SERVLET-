package controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
import model.Book;
import model.Category;
import service.BookBO;
import service.CategoryBO;

/**
 * Servlet implementation class AddBook
 */
@MultipartConfig
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoryBO categoryBO = new CategoryBO();
    private BookBO bookBO = new BookBO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBook() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String errorString = null;
        ArrayList<Category> list = null;

        try {
            list = categoryBO.listCategory();
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }
        // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("categoryList", list);
        request.getSession().setAttribute("Check", "AddBook");
        request.setAttribute("page", "add_book.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String category_id = request.getParameter("category");
        String count = request.getParameter("count");
        Part filePart = request.getPart("fileImage");
        // gọi hàm upload file và lấy đường dẫn file đã upload
        String fileName= this.uploadFile(filePart);
    
       
        Book book = new Book();
        book.setName(name);
        Category category = new Category();
        try {
            category = categoryBO.findCategory(category_id);
        } catch (ClassNotFoundException | SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        book.setCategory(category);
        book.setAmount(count);
        book.setImage(fileName);
        try {
            int result = bookBO.insertBook(book);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("errorString", "Thêm sách thành công");
        response.sendRedirect(request.getContextPath()+"//ManagerBook");
    }

 
    private String uploadFile(Part filePart) throws FileNotFoundException, IOException{
          String uploadPath= (getServletContext().getRealPath("")+"\\Resources\\img\\products\\").replace("\\build","");
        String fileName= extractfilename(filePart);
        
        InputStream fileContent= filePart.getInputStream();
        OutputStream os= new FileOutputStream(uploadPath+fileName);
        int read;
        byte[] bytes= new byte[1024];
        while((read= fileContent.read(bytes))!=-1){
            os.write(bytes,0,read);
        }
        os.close();
        return fileName;
    }
    private String extractfilename(Part file) {
        String cd = file.getHeader("content-disposition");
        String[] items = cd.split(";");
        for (String string : items) {
            if (string.trim().startsWith("filename")) {
                return string.substring(string.indexOf("=") + 2, string.length() - 1);
            }
        }
        return "";
    }

}
