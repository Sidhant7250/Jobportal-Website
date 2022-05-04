/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import driverpackage.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class ApplyForJobs extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session = req.getSession();
       String email = (String) session.getAttribute("session_email");
        
       
       String jobid = req.getParameter("jobid");
       
        Date dd=new Date();
        
        SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-YYYY");
        String date1 = sdf1.format(dd);
        
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String time1 = sdf2.format(dd);
        
          Connection con=null;
        try
        {
            con = DbConnection.getconnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("insert into applied_jobs(email,jobid,date1,time1)values(?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, jobid);
            ps.setString(3, date1);
            ps.setString(4, time1);
            
           int i = ps.executeUpdate();
            
           if(i>0)
           {
               con.commit();
               req.setAttribute("success_message", "you have successfully applied job...!!");
                 System.out.println("1");
               RequestDispatcher rd1 = req.getRequestDispatcher("successfull.jsp");
                rd1.include(req, resp);
               
                 RequestDispatcher rd2 = req.getRequestDispatcher("jobdescription.jsp?id="+jobid+"");
                rd2.include(req, resp);
               // resp.sendRedirect("index.jsp");
           }
           else
           {
               con.rollback();
               req.setAttribute("success_message", "you have not  applied job due to some error...!!");
               System.out.println("2");
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("jobdescription.jsp?id="+jobid+"");
                rd2.include(req, resp);
           }
        }
        catch(Exception e)
        {
            try
            {
               con.rollback();
               req.setAttribute("success_message", "you have not  applied job due to some error...!!");
               
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("jobdescription.jsp?id="+jobid+"");
                rd2.include(req, resp);
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
            e.printStackTrace();
        }
                
      finally
        {
            try
            {
                con.close();
            }
            catch(Exception eee)
            {
                eee.printStackTrace();
            }
        }
       
    }
    
}
