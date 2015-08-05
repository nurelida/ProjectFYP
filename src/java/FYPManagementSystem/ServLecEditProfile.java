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
public class ServLecEditProfile extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
   public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("stud_name");
        String phone_num = request.getParameter("phone_no");
        String email = request.getParameter("email_add");
        String roomNo = request.getParameter("roomNo");
        
        String newPsw = request.getParameter("psw");
        String oldpsw = request.getParameter("oldpsw");    
        
        String option = request.getParameter("Option");
       
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
         
        
        String query="update lecturer set lectName='"+name
                                                    +"',phoneNo='"+phone_num
                                                    +"',emailAdd='"+email
                                                    +"',roomNo='"+roomNo
                                                    +"' where staffNo='"+ UserSession+"'";
        
        
        String msg ="";
        String msg1="";
        
        String address="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                    DB objDB = new DB();
                    objDB.connect();

                    if(option.equals("UpdateProfile"))
                    {
                        objDB.query(query);
                        address="/WEB-INF/Message.jsp?Message=LecProfile";
                        session.setAttribute("name", name);
                    }

                    else if(option.equals("ChgPsw"))
                    {
                        String queryComparePsw="select * from users_login where userID='"+UserSession
                                                                         +"' and psw=password('"+Common.replaceSingleQuote(oldpsw)+"') and usertype='"
                                                                         +UserType+"'";
                        String query2="update users_login set psw = password('"+Common.replaceSingleQuote(newPsw)+"') where userID='"+UserSession+"'";
                        String query3="update lecturer set pass = password('"+Common.replaceSingleQuote(newPsw)+"') where staffNo='"+UserSession+"'";
                       objDB.query(queryComparePsw);
                       msg=objDB.getDataAt(0, "psw");
                            if((objDB.getNumberOfRows()==0))
                            {
                                address="/WEB-INF/Message.jsp?Message=LecChgPswFail";
                            }
                            else
                            {
                                if(!objDB.query(query2))
                                    objDB.rollback();
                                if(!objDB.query(query3))
                                    objDB.rollback();
                               address="/WEB-INF/Message.jsp?Message=LecProfile";
                            }
                    }
                    else
                    {
                        address="/WEB-INF/Message.jsp?Message=LecProfileFailed";
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