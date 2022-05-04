/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author user
 */
public class ValidationServerSide 
{
    private Pattern name;
    private Pattern email;
    private Pattern pass;
    
    private Matcher matcher;
    
     private static final String NAME_PATTERN="^[a-zA-Z ]{3,30}$";
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z-]+(\\.[A-Za-z]+)*(\\.[A-Za-z]{2,3})$";
    private static final String PASS_PATTERN="^[A-Za-z0-9@#_]{6,16}$";
    
    public  ValidationServerSide()
    {
        name = Pattern.compile(NAME_PATTERN);
        email = Pattern.compile(EMAIL_PATTERN);
        pass=Pattern.compile(PASS_PATTERN);
    }
    public boolean nameValidate(final String name1)
    {
        matcher = name.matcher(name1);
        return matcher.matches();
    }
    public boolean emailValidate(final String email1)
    {
        matcher = email.matcher(email1);
        return matcher.matches();
    }
    public boolean passValidate(final String pass1)
    {
        matcher = pass.matcher(pass1);
        
        return matcher.matches();
    }
    
}
