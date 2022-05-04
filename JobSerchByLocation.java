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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class JobSerchByLocation extends HttpServlet
{
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out = resp.getWriter();
        
        String location = req.getParameter("location");
        
         String id="",job_profile="",company="",experience="",description="",date1="",time1="";
        Connection con = null;
        try
        {
            con = DbConnection.getconnect();
            
            PreparedStatement ps = con.prepareStatement("select*from jobs where job_location like'%"+location+"%' ");
            //ps.setString(1, tech1);
            
            ResultSet rs = ps.executeQuery();
           
            while(rs.next())
            {
                                 id = rs.getString("id");
                                job_profile = rs.getString("job_profile");
                                company = rs.getString("company");
                                experience = rs.getString("experience");
                                description = rs.getString("description");
                                date1 = rs.getString("date1");
                                time1=rs.getString("time1");
                                
                               out.print(" <div class=\"col-md-12 display_job_div\">\n" +
"                             <b> "+job_profile+"</b><span style=\"color: #4b4b4b;font-size: 10px;float:right;\">("+date1+"&nbsp;&nbsp;"+time1+")</span><br>\n" +
"                         <span> <span class=\"glyphicon glyphicon-home\"></span>&nbsp;&nbsp;<span style=\"color: #727171;\">Company :-</span>"+company+"</span><br>\n" +
"                     <span><span class=\"glyphicon glyphicon-book\"></span>&nbsp;&nbsp;<span style=\"color: #727171;\">Experience :-</span>"+experience+"</span><br>\n" +
"                     <span> <span class=\"glyphicon glyphicon-file\"></span>&nbsp;&nbsp;<span style=\"color: #727171;\">Job Description :-</span>"+description+"</span><br>\n" +
"                     <a href=\"jobdescription.jsp?id="+id+"\"> See more details</a><br>\n" +
"                         </div>");
                               
                               
                                
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        }
    }
}
