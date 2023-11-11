/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;


/**
 *
 * @author hoatd
 */
public class GenerateLibraryDAO {
    public  boolean isInteger(String str) {
    try {
        Integer.parseInt(str);
        return true;
    } catch (NumberFormatException e) {
        return false;
    }
}
    public  boolean isDouble(String str) {
    try {
        Double.parseDouble(str);
        return true;
    } catch (NumberFormatException e) {
        return false;
    }
}
public  boolean isDate(String str, String dateFormat) {
    try {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        sdf.parse(str);
        return true;
    } catch (ParseException e) {
        return false;
    }
}
  public String generateSqlWithConstraint(ArrayList<String> constraint, String rootSql){
      System.out.println(rootSql);
        StringBuilder strReturn= new StringBuilder(rootSql);
        
         for(String entry : constraint){
            
             strReturn.append(" And ").append(entry);
          
             System.out.println(strReturn.toString());
        }
        return strReturn.toString() ;
    }

}
