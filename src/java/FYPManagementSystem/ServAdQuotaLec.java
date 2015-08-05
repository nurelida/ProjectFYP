/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdQuotaLec extends HttpServlet {
   public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String UserSession = (String)session.getAttribute("user");
            String UserType = (String)session.getAttribute("userType");
            String address = "";
            
            String sv = request.getParameter("svQuota");
            String ev1 = request.getParameter("ev1");
            String ev2 = request.getParameter("ev2");
            String evTitle = request.getParameter("evTitle");
            String semester = request.getParameter("semester");
            String option = request.getParameter("Option");
            String query = "";
            String str = "select semester from quota_lecturer where semester='"+semester+"'";
            int flag = 0;
            DB objDB = new DB();
            
            
            
      try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                if(!(option.equals("edit"))){
                        if(option.equals("add")){
                            objDB.connect();
                            objDB.query(str);
                            int row = objDB.getNumberOfRows();
                            objDB.close();
                            if((row==0)){
                                query="insert into quota_lecturer (ev1,ev2,supervision,semester,ev_title,ev1_psm2,ev2_psm2) values('"+ev1+"','"
                                                                           +ev2+"','"
                                                                           +sv+"','"
                                                                           +semester+"','"
                                                                           +evTitle+"','"
                                                                           +request.getParameter("ev1_psm2")+"','"
                                                                           +request.getParameter("ev2_psm2")+"')";
                            }
                            else
                            {
                                 address="/WEB-INF/Message.jsp?Message=QuotaFail";
                                 request.setAttribute("semester",semester);
                                 flag = 1;
                            }
                        }
                        else if(option.equals("delete")){
                            query="delete from quota_lecturer where semester ='"+semester+"'";
                        }
                        else if(option.equals("saveChanges")){
                            query="update quota_lecturer set ev1='" + request.getParameter("editEv1")+"', ev2='"
                                                                     + request.getParameter("editEv2")+"', supervision='"
                                                                     + request.getParameter("editSvQuota")+"', ev_Title='"
                                                                     + request.getParameter("editEvTitle")+"',ev1_psm2='" 
                                                                     + request.getParameter("editEv1_psm2")+"', ev2_psm2='"
                                                                     + request.getParameter("editEv2_psm2")+"' where semester='"
                                                                     + semester + "'";
                        }
                        if(!(flag==1)){
                            address="/WEB-INF/AdQuotaLec.jsp";
                            objDB.connect();
                            objDB.query(query);
                            objDB.close();
                        }
                }
                else if(option.equals("edit")){
                     address="/WEB-INF/AdQuotaLec.jsp?index="+semester;
                }
                else
                {
                     address="/WEB-INF/Message.jsp?Message=InvalidQuota";
                }
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
