/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author user
 */
public class ValidationFilter  implements Filter
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException 
    {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    {
        
        String name2   = request.getParameter("name1");
        String email2  = request.getParameter("email1");
        String pass2   = request.getParameter("pass1");
        String gender2 = request.getParameter("gender1");
        String city2   = request.getParameter("city1");
        
        ValidationServerSide vs = new ValidationServerSide();
        
            if(!vs.nameValidate(name2))
            {
                 RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                   rd.include(request, response);
            }
           else if(!vs.emailValidate(email2))
            {
                RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                   rd.include(request, response);
            }
           else if(!vs.passValidate(pass2))
            {
                RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                   rd.include(request, response);
            }
           else if(gender2==null || gender2=="")
           {
            
               RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                   rd.include(request, response);
           }
           else if(city2==null || city2=="")
           {
                RequestDispatcher rd= request.getRequestDispatcher("register.jsp");
                   rd.include(request, response);
           }
           else
           {
               chain.doFilter(request, response);
               
               
           }
        
    }

    @Override
    public void destroy()
    {
       
    }
    
}
