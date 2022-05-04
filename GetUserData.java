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
import java.sql.ResultSet;
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
public class GetUserData extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doService(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        doService(req, resp);
    }

    
   
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
     
         resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2;
       
        try
        {
            email2=req.getParameter("email1");
            if(email2 == null || email2.equals("null"))
            {
                email2=email2=(String)req.getAttribute("email1");
            }
        }
        catch(Exception e)
        {
            email2=(String)req.getAttribute("email1");
        }
        
        String name2="",gender2="",city2="" ,field2="";
        
        Connection con = null;
        try
        {
            
            
            con = DbConnection.getconnect();
            
            PreparedStatement ps = con.prepareStatement("select*from register where email=?");
            ps.setString(1, email2);
           
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                 name2 = rs.getString("name");
                gender2 = rs.getString("gender");
                city2 = rs.getString("city");
                field2 = rs.getString("field");
                
                HttpSession session = req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city",city2);
                session.setAttribute("session_fields", field2);
                
                String title="",skills="";
                PreparedStatement ps1 = con.prepareStatement("select*from about_user where email=?");
                ps1.setString(1, email2);
                ResultSet rs1 =   ps1.executeQuery();
                while(rs1.next())
                {
                    title=rs1.getString("about");
                    skills=rs1.getString("skills");
                }
                session.setAttribute("session_title", title);
                session.setAttribute("session_skills", skills);
                String filename="";
                PreparedStatement ps2 = con.prepareStatement("select*from profile_pic where email=?");
                ps2.setString(1, email2);
              ResultSet rs2 =  ps2.executeQuery();
              while(rs2.next())
              {
                  filename = rs2.getString("path");
              }
              session.setAttribute("session_pic", filename);
                
                resp.sendRedirect("profile.jsp");
            }
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
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
