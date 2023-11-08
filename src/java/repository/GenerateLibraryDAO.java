/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
  public String generateSqlWithConstraint(Map<String,String> constraint, String rootSql){
      System.out.println(rootSql);
        StringBuilder strReturn= new StringBuilder(rootSql);
        
         for(Map.Entry<String,String> entry : constraint.entrySet()){
            String key= entry.getKey();
            String value= entry.getValue();
            if(this.isInteger(value)){
                strReturn.append(" And ").append(key).append("=").append(value);
            }else if(this.isDouble(value)){
                strReturn.append(" And ").append(key).append("=").append(value);
            }else if(this.isDate(value, "yyyy-MM-dd")){
                    strReturn.append(" And ").append(key).append("=").append("'"+value+"'");
            }else{
                strReturn.append(" And ").append(key).append("=").append("'%"+value+"%'");
            }
             System.out.println(strReturn.toString());
        }
        return strReturn.toString() ;
    }

}
