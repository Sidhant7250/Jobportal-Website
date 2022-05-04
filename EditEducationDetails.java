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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class EditEducationDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
       String school2 = req.getParameter("school1");
        String degree2 = req.getParameter("degree1");
        String year2 = req.getParameter("year1");
        String grade2 = req.getParameter("grade1");
        String description2 = req.getParameter("description1");
        String id2 = req.getParameter("id1");
        Connection con = null;
        try
        {
            
            
            con = DbConnection.getconnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement("update education set school=?,degree=?,year=?,grade=?,description=? where id=?");
            ps.setString(1, school2);
            ps.setString(2, degree2);
            ps.setString(3, year2);
            ps.setString(4, grade2);
            ps.setString(5, description2);
            ps.setString(6, id2);
            
           int i =  ps.executeUpdate();
            
           if(i>0)
           {
               con.commit();
               resp.sendRedirect("profile.jsp");
           }
           else
           {
               con.rollback();
               RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
               rd1.include(req, resp);
               
                RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_education.jsp");
               rd2.include(req, resp);
           }
           
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
            }
            catch(Exception ee)
            {
                out.println(ee);
            }
           
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception ee)
            {
                out.println(ee);
            }
        }
    }
    
}
