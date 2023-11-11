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
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
import model.Author;
import model.Book;
import model.Category;
import model.Publisher;
import service.AuthorBO;
import service.BookBO;
import service.CategoryBO;
import service.PublisherBO;

/**
 * Servlet implementation class AddBook
 */
@MultipartConfig
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {

    private BookBO bookService = new BookBO();
        private CategoryBO serviceCategory= new CategoryBO();
    private PublisherBO servicePublisher= new PublisherBO();
    private AuthorBO serviceAuthorBO= new AuthorBO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            
            
             ArrayList<Publisher> listPublisher= new ArrayList<Publisher>();
            ArrayList<Category> listCategory= new ArrayList<Category>();
            ArrayList<Author> listAuthor= new ArrayList<Author>();
            listPublisher= this.servicePublisher.listPublisher();
            listAuthor= this.serviceAuthorBO.listAuthor();
            listCategory= this.serviceCategory.listCategory();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listAuthor", listAuthor);
            request.setAttribute("listPublisher", listPublisher);
            
            
     
            request.setAttribute("page", "add_book.jsp");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
       
        } catch (SQLException ex) {
            Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        request.setCharacterEncoding("UTF-8");
     
        String name = request.getParameter("name");
        
        // Kiểm tra xem có file được gửi hay không
        Part filePart = request.getPart("image");
        String fileName = null;
        System.out.println("filePartA:"+filePart);
        if (filePart != null && filePart.getContentType() != null && filePart.getSize()>0) {
            // Nếu có file được gửi, gọi hàm uploadFile để lấy đường dẫn file đã upload
            fileName = this.uploadFile(filePart);
        } else {
            // Nếu không có file được gửi, lấy tên file từ tham số request
            fileName = request.getParameter("fileName");
        }

        int amount = Integer.parseInt(request.getParameter("amount"));
        int category_id= Integer.parseInt(request.getParameter("category_id"));
        int authorId = Integer.valueOf(request.getParameter("author_id"));
        double price = Double.parseDouble(request.getParameter("price"));
        int numberOfPages = Integer.parseInt(request.getParameter("number_of_pages"));
        int publisherId = Integer.parseInt(request.getParameter("publisher_id"));
        Date publicationYear = Date.valueOf(request.getParameter("publication_year"));

        Book model = new Book();
 
        model.setName(name);
        model.setCategory_id(category_id);
        model.setImage(fileName);
        model.setAmount(amount);
        model.setPrice(price);
        model.setNumberOfPages(numberOfPages);
        model.setPublisherId(publisherId);
        model.setPublicationYear(publicationYear);
        model.setAuthor_id(authorId);

        // Set other properties accordingly
        int rs = this.bookService.insertBook(model);

        if (rs > 0) {
            request.setAttribute("errorString", "Thêm sách thành công ");
         
            response.sendRedirect(request.getContextPath() + "/ManagerBook");
        } else {
            response.sendRedirect(request.getContextPath() + "/AddBook");
        }
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(EditBook.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    @Override
    public String getServletInfo() {
        return "Short description";
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
