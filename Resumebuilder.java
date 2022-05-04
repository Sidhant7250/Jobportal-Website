package backend;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import driverpackage.DbConnection;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class Resumebuilder extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        //--------------------
        HttpSession session = req.getSession();
        String name2=(String)session.getAttribute("session_name");
        String email2=(String)session.getAttribute("session_email");
        String pic = (String) session.getAttribute("session_pic");
        //------------------------------------------
        String address2=req.getParameter("address1");
        String career2=req.getParameter("career1");
        String hobbies2=req.getParameter("hobbeis1");
        String dob2=req.getParameter("dob1");
        String gendermaital2=req.getParameter("gendermaritial1");
        String language2=req.getParameter("language1");
        
        
        String resume_pdf_name=email2;
        
        Document document=new Document();
        
      try
      {
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PathDetails.RESUME_BUILDER_PATH+resume_pdf_name+".pdf"));
            document.open();
            
            //--------------title-----------------------
            String font_name="Arial";
            float font_size=20;
            int style=Font.BOLD;
            Paragraph title = new Paragraph("Resume",FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
            document.add(title);
         //------------------------------------- 
            
            Paragraph emptyspace = new Paragraph(" ");
            document.add(emptyspace);
            //-------------name&email----------------
            
            Image imag1 = Image.getInstance(PathDetails.PROFILE_PIC_PATH+pic);
            imag1.scaleAbsolute(100f, 100f);
            document.add(imag1);
            
          Paragraph namee=new Paragraph(name2);
          document.add(namee);
          
          int email_size=10;
          Paragraph emaill=new Paragraph("("+email2+")",FontFactory.getFont(font_name, email_size));
          document.add(emaill);
          
          
            
          //----------------career objective------------------------
          
           document.add(emptyspace);
           
           
           
          String cofont_name="Arial";
            float cofont_size=10;
            int costyle=Font.ITALIC;
          Paragraph coobjective=new Paragraph("Career Objective",FontFactory.getFont(cofont_name, cofont_size, costyle, BaseColor.PINK));
          document.add(coobjective);
          
          Paragraph career = new Paragraph(career2);
          document.add(career);
        //-----------------------------------------educational----------------------------  
           document.add(emptyspace);
           Paragraph edutitle = new Paragraph("Educational Details",FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
            document.add(edutitle);
          
          PdfPTable table = new PdfPTable(4);
          
          table.setSpacingBefore(20);
          
          PdfPCell c1 = new PdfPCell(new Phrase("Year"));
          table.addCell(c1);
          
          PdfPCell c2 = new PdfPCell(new Phrase("School/College"));
          table.addCell(c2);
          
          PdfPCell c3 = new PdfPCell(new Phrase("Degree"));
          table.addCell(c3);
          
          PdfPCell c4 = new PdfPCell(new Phrase("Grade"));
          table.addCell(c4);
          
          String year1="",school1="",degree1="",grade1="";
          Connection con=null;
          try
          {
              con=DbConnection.getconnect();
              PreparedStatement ps = con.prepareStatement("select*from education where email=?");
              ps.setString(1, email2);
              ResultSet rs =  ps.executeQuery();
              while(rs.next())
              {
                  year1 = rs.getString("year");
                  school1 = rs.getString("school");
                  degree1 = rs.getString("degree");
                  grade1 = rs.getString("grade");
                  
                    table.addCell(year1);
                    table.addCell(school1);
                    table.addCell(degree1);
                    table.addCell(grade1);
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
              catch(Exception e)
              {
                  e.printStackTrace();
              }
          }
          document.add(table);
          
          //----------------------------------------experience details------------------------------
          document.add(emptyspace);
           Paragraph exptitle = new Paragraph("Experience Details",FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
            document.add(exptitle);
          
          PdfPTable exptable = new PdfPTable(4);
          
          exptable.setSpacingBefore(20);
          
          PdfPCell expc1 = new PdfPCell(new Phrase("Year"));
          table.addCell(expc1);
          
          PdfPCell expc2 = new PdfPCell(new Phrase("Company"));
          table.addCell(expc2);
          
           PdfPCell expc4 = new PdfPCell(new Phrase("Job Title"));
          table.addCell(expc4);
          
          PdfPCell expc3 = new PdfPCell(new Phrase("Location"));
          table.addCell(expc3);
          
         
          
          String year2="",company2="",location2="",jobtitle="";
          
          Connection con2=null;
          try
          {
              con2=DbConnection.getconnect();
              PreparedStatement ps = con2.prepareStatement("select*from experience where email=?");
              ps.setString(1, email2);
              ResultSet rs =  ps.executeQuery();
              while(rs.next())
              {
                  year2 = rs.getString("year");
                  company2 = rs.getString("company");
                  location2 = rs.getString("location");
                  jobtitle = rs.getString("job_title");
                  
                    exptable.addCell(year2);
                    exptable.addCell(company2);
                    exptable.addCell(jobtitle);
                    exptable.addCell(location2);
                    
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
                  con2.close();
              }
              catch(Exception e)
              {
                  e.printStackTrace();
              }
          }
          
          document.add(exptable);
          
          //------------------------------------------hobbies--------------
          document.add(emptyspace);
          Paragraph hob=new Paragraph("Hobbies",FontFactory.getFont(cofont_name, cofont_size, costyle, BaseColor.RED));
          document.add(hob);
          
          Paragraph hobbies = new Paragraph(hobbies2);
          document.add(hobbies);
          
          //-------------------personal information------------------
          document.add(emptyspace);
          Paragraph personal=new Paragraph("Personal Information",FontFactory.getFont(cofont_name, cofont_size, costyle, BaseColor.RED));
          document.add(personal);
          
          Paragraph dob = new Paragraph("Date Of Birth :- "+dob2);
          document.add(dob);
          
          Paragraph gen = new Paragraph("Gender / Marital Status :- "+gendermaital2);
          document.add(gen);
          
          Paragraph lan = new Paragraph("Language Profiency "+language2);
          document.add(lan);
          
          Paragraph addr = new Paragraph("Address : "+address2);
          document.add(addr);
          
          
          //----------------lastphase-----------
          
           Paragraph lname = new Paragraph("Name : "+name2);
          document.add(lname);
          
          Date dt=new Date();
          SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
          
           Paragraph ddd = new Paragraph("Date : "+sdf.format(dt));
          document.add(ddd);
          
            document.close();
            resp.sendRedirect("profile.jsp");
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
        
        
        
    }
    
}
