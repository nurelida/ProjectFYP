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
public class ServStudEditProfile extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("stud_name");
        String ic_no = request.getParameter("ic_no");
        String phone_num = request.getParameter("phone_no");
        String email = request.getParameter("email_add");
        
       
        String newPsw = request.getParameter("psw");
        String oldpsw = request.getParameter("oldpsw");    
        
        String option = request.getParameter("Option");
       
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
         
        
        String query="update student set studName='"+name
                                                    +"',icNo='"+ic_no
                                                     +"',phoneNo='"+phone_num
                                                     +"',emailAdd='"+email+"' where metricNo='"+ UserSession+"'";
        
        
        
        String msg ="";
        String msg1="";
        
        String address="";
        try {
           if ((!(UserSession==null))&&(UserType.equals("1"))) {
                    DB objDB = new DB();
                    objDB.connect();

                    if(option.equals("UpdateProfile"))
                    {
                        objDB.query(query);
                       
                        session.setAttribute("name", name);
                        address="/WEB-INF/Message.jsp?Message=Profile";
                    }

                    else if(option.equals("ChgPsw"))
                    {
                        String queryComparePsw="select * from users_login where userID='"+UserSession
                                                                         +"' and psw=password('"+Common.replaceSingleQuote(oldpsw)+"') and usertype='"
                                                                         +UserType+"'";
                        String query2="update users_login set psw = password('"+Common.replaceSingleQuote(newPsw)+"') where userID='"+UserSession+"'";
                        String query3="update student set pass = password('"+Common.replaceSingleQuote(newPsw)+"') where metricNo='"+UserSession+"'";
                       objDB.query(queryComparePsw);
                       msg=objDB.getDataAt(0, "psw");
                            if((objDB.getNumberOfRows()==0))
                            {
                                address="/WEB-INF/Message.jsp?Message=ChgPswFail";
                            }
                            else
                            {
                                if(!objDB.query(query2))
                                    objDB.rollback();
                                if(!objDB.query(query3))
                                    objDB.rollback();
                               address="/WEB-INF/Message.jsp?Message=Profile";
                            }
                    }
                    else
                    {
                        address="/WEB-INF/Message.jsp?Message=ProfileFailed";
                    }
                    objDB.close();
                    
                   
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } 
        
        finally { 
            out.close();
        }
    } 

   
   

    
}
