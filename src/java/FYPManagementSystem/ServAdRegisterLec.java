/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;

import java.io.*;
import java.net.*;
import FYPManagementSys_Bean.DB;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdRegisterLec extends HttpServlet {
   
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
        String metric_no = request.getParameter("matric_no");
        String phone_no = request.getParameter("phone_no");
        String email_add = request.getParameter("email_add");
        String dept = request.getParameter("department");
        String psw = request.getParameter("psw");
        String roomNo = request.getParameter("roomNo");
        String lec_status = request.getParameter("lec_status");

        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String str="insert into lecturer values('"+name+"','"+metric_no+"','"+email_add+"','"+phone_no+"',password('"+psw+"'),'"+roomNo+"','"+lec_status+"','"+dept+"')";
        String str1="insert into users_login values(password('"+psw+"'),'"+metric_no+"',2)";
        String str2="select userID from users_login where userID='"+metric_no+"'";
        String address="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
            DB objDB = new DB();
            objDB.connect();
            objDB.query(str2);
            
            if(objDB.getNumberOfRows()==0)
            {   
                if(!objDB.query(str))
                 objDB.rollback();
                   
                
                if(!objDB.query(str1))
                objDB.rollback();
                   
                 address="/WEB-INF/Message.jsp?Message=AdRegSuc";
            }
            else
            {
                address="/WEB-INF/Message.jsp?Message=AdRegFail";
            }
            objDB.close();
           
            }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
             
        } finally { 
            out.close();
        }
    } 
     

}
