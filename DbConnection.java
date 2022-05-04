/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package driverpackage;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 *
 * @author user
 */
public class DbConnection 
{
    static Connection con;
    
    public static Connection getconnect()
    {
        String jdbc_url=null,url=null,password=null;
        try
        {
            InputStream is = DbConnection.class.getResourceAsStream("db.properties");
            
            Properties pr = new Properties();
            pr.load(is);
            
            jdbc_url = pr.getProperty("jdbc-url");
            url = pr.getProperty("username");
            password = pr.getProperty("password");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        try
        {
             //Class.forName("com.mysql.jdbc.Driver");
             //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
           
            MysqlDataSource mds = new MysqlDataSource();
            mds.setURL(jdbc_url);
            mds.setUser(url);
            mds.setPassword(password);
            
           con =  mds.getConnection();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println(e);
        }
        return con;
    }
    
}
