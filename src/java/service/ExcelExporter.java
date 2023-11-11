package service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;

import java.util.List;

public class ExcelExporter {

    public ExcelExporter() {
    }
   
    public String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        return input.substring(0, 1).toUpperCase() + input.substring(1);
    }

    public boolean exportToExcel(List<?> dataList, String filePath, String title) {
        // Tạo một workbook mới
        Workbook workbook = new XSSFWorkbook();

        // Tạo một sheet trong workbook
        Sheet sheet = workbook.createSheet("Sheet 1");

        // Tạo một tiêu đề cho bảng
        Row titleRow = sheet.createRow(0);
        Cell titleCell = titleRow.createCell(5);
        titleCell.setCellValue(title);

        // Tạo một kiểu định dạng cho tiêu đề
        CellStyle titleStyle = workbook.createCellStyle();
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
       titleFont.setFontHeightInPoints((short) 20); 
        titleStyle.setFont(titleFont);
        titleCell.setCellStyle(titleStyle);

        // Ghi dữ liệu vào sheet
        // ...
        // Thiết lập định dạng cho các cột
        CellStyle columnHeaderStyle = workbook.createCellStyle();
        Font columnHeaderFont = workbook.createFont();
        columnHeaderFont.setBold(true);
        columnHeaderFont.setColor(IndexedColors.WHITE.getIndex()); // Thiết lập màu chữ là màu trắng
        columnHeaderStyle.setFont(columnHeaderFont);
        columnHeaderStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        columnHeaderStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        
        // Toạ một kiểu định dạng cho footer để in ra tiền sau mỗi báo cáo
        
       CellStyle FooterStyle = workbook.createCellStyle();
        Font FooterFont = workbook.createFont();
        FooterFont.setBold(true);
       FooterFont.setFontHeightInPoints((short) 12); 
       FooterStyle.setFont(FooterFont);
       
        // Lấy thông tin về lớp đối tượng đầu tiên trong danh sách
        Class<?> objectClass = dataList.get(0).getClass();
        // Lấy danh sách các trường (thuộc tính) của đối tượng
        Field[] fields = objectClass.getDeclaredFields();

       

        for (int rowIndex = 0; rowIndex < dataList.size(); rowIndex++) {
            Row row = sheet.createRow(rowIndex + 2);
            Object dataObject = dataList.get(rowIndex);

            for (int columnIndex = 0; columnIndex < fields.length; columnIndex++) {

                Cell cell = row.createCell(columnIndex);

                Field field = fields[columnIndex];
                field.setAccessible(true);
                try {
                    Object value = field.get(dataObject);
                    if (value != null) {
                        if (value instanceof String) {
                            cell.setCellValue((String) value);
                        } else if (value instanceof Integer) {
                            cell.setCellValue((Integer) value);
                        } else if (value instanceof Double) {
                            cell.setCellValue((Double) value);
                        } // Thêm kiểu dữ liệu khác ^nếu cần
                        else{
                            cell.setCellValue(String.valueOf(value));
                        }
                    }
                    if(rowIndex==0)     cell.setCellStyle(columnHeaderStyle);
                    if(rowIndex==dataList.size()-1) cell.setCellStyle(FooterStyle);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
             // Thiết lập tự động điều chỉnh kích thước cột

        }
        // Tự động điều chỉnh kích thước cac cột
         for (int i = 0; i < fields.length; i++) {
            sheet.autoSizeColumn(i);
        }
        // Lưu workbook thành file Excel
        try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
            workbook.write(outputStream);
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }

        System.out.println("File Excel đã được xuất thành công.");
        return true;
    }

    // Sử dụng hàm exportToExcel
//   public static void main(String[] args) {
// 
//           String userHome = System.getProperty("user.home");
//        String filePath = Paths.get(userHome, "Downloads", "ExportCoffee.xlsx").toString();
//        exportToExcel(personList,filePath); // Gọi hàm exportToExcel để xuất file Excel
//    }
}
