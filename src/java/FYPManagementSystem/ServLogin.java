/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLogin extends HttpServlet {
   
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String userName = Common.replaceSingleQuote(request.getParameter("userID"));
        String userPassword = Common.replaceSingleQuote(request.getParameter("psw"));
        
        String str="select userID,usertype from users_login where userID='"+userName+"'and psw=password('"+userPassword+"')";
        String address="";
        
        try {
             
             if((!userName.equals("null"))&&(!userPassword.equals("null")))
                {
                    DB objDB= new DB();
                    objDB.connect();
                    objDB.query(str);
                    int NumOfRows=objDB.getNumberOfRows();
                    
                    if(NumOfRows==0)
                    {
                       address="./WEB-INF/Message.jsp?Message=Sorry. Your password and username is invalid. Please login again.";
                    }
                    else
                    {
                        String usertype = objDB.getDataAt(0,"usertype");
                        String username = objDB.getDataAt(0,"userID");
                        
                        HttpSession session = request.getSession(true);
                        session.setAttribute("user", username);
                        session.setAttribute("userType",usertype);
                        if(usertype.equals("1"))
                        {   
                            String query = "select studName from student where metricNo='"+username+"'";
                            objDB.query(query);
                            String temp =objDB.getDataAt(0,"studName");
                            session.setAttribute("name", temp);
                            address="/WEB-INF/StudentHome.jsp";
                        }
                        else if(usertype.equals("2"))
                        {   
                            String query = "select lectName from lecturer where staffNo='"+username+"'";
                            objDB.query(query);
                            String temp =objDB.getDataAt(0,"lectName");
                            session.setAttribute("name", temp);
                            address="/WEB-INF/LecHome.jsp";
                        }
                        
                        else if(usertype.equals("3"))
                        {   
                            session.setAttribute("name", "Admin");
                            address="/WEB-INF/AdHome.jsp";
                        }
                        else
                        {
                            address="/WEB-INF/Message.jsp?Message=Invalid User type.";
                        }
                    }
                    objDB.close();
                }
            else
                {
                    address="/WEB-INF/Message.jsp?Message=Sorry. Your password and username is invalid. Please login again.";
                }
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
           
        } finally { 
            out.close();
        }
    } 
}
