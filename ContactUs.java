/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import driverpackage.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class ContactUs extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doServise(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doServise(req, resp);
    }
    

   
    protected void doServise(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        PrintWriter out = resp.getWriter();
        
       String name2 = req.getParameter("name1");
       String email2 = req.getParameter("email1");
       String subject2=req.getParameter("subject1");
       String message2 = req.getParameter("message1");
       
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
       String date2= sdf.format(date);
       
       SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm:ss");
        String time2=sdf1.format(date);
       
        Connection con =null;
        try
        {
            con = DbConnection.getconnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("insert into contact_us(name,email,subject,message,date1,time1)values(?,?,?,?,?,?)");
            ps.setString(1, name2);
            ps.setString(2, email2);
            ps.setString(3, subject2);
            ps.setString(4, message2);
            ps.setString(5, date2);
            ps.setString(6, time2);
            
           int i = ps.executeUpdate();
            
           if(i>0)
           {
               con.commit();
               
               String subject1="Thank You";
               String message1 = "Thank you for contactiing us, our team will contact you as soon as possible ...!!";
               SendConfermationMail.sendConfermationMail(email2,subject1,message1);
               //resp.sendRedirect("contact-us.jsp");
               
               req.setAttribute("success_message", "Your message has been sended successfully");
             
               RequestDispatcher rd1 = req.getRequestDispatcher("successfull.jsp");
               rd1.include(req, resp);
               
              
               RequestDispatcher rd2 = req.getRequestDispatcher("contact-us.jsp");
               rd2.include(req, resp);
               
            
           }
           else
           {
               con.rollback();
               
                req.setAttribute("error_message", "Your message has not been submited due to some error........!!");
                
               RequestDispatcher rd2 = req.getRequestDispatcher("error.jsp");
               rd2.include(req, resp);
           
               RequestDispatcher rd1 = req.getRequestDispatcher("contact-us.jsp");
               rd1.include(req, resp);
        
              
               
           }
            
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
                req.setAttribute("error_message", e.getMessage());
                RequestDispatcher rd2 = req.getRequestDispatcher("error.jsp");
               rd2.include(req, resp);
             
               RequestDispatcher rd1 = req.getRequestDispatcher("contact-us.jsp");
               rd1.include(req, resp);
             
            }
            catch(Exception ee)
            {
                out.println(ee);
            }
            out.println(e);
        }
        finally
        {
            try
            {
                con.close();
            }
            catch( Exception ee)
            {
                out.println(ee);
            }
        }
        
        
        
    }
    
    
}
