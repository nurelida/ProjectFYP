/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdViewStudApp extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        
        
        
        String status = request.getParameter("status");
        String metric = request.getParameter("metricNo");
        String proID = request.getParameter("proID");
        
        String query ="update engapply set status='"+status+"' where metricNo='"+metric+"'and proID='"+proID+"'" ;
        
        String address="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                    
                        DB objDB = new DB();
                        objDB.connect();
                        objDB.query(query);
                        objDB.close();
                        address="/WEB-INF/AdViewStudApp.jsp?metricNo"+metric;
                   
                    
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
