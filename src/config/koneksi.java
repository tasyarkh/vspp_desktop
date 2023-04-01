//tasya's coding
package config;

//import library
import java.sql.*;
import javax.swing.*;

public class koneksi {
    Connection con;
    
    public static Connection connect(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/v_spp", "root", "");
            System.out.println("Koneksi Berhasil");
            
            return con;   
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}
