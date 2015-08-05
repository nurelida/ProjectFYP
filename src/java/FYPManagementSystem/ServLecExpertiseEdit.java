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
public class ServLecExpertiseEdit extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String UserSession = (String)session.getAttribute("user");
            String UserType = (String)session.getAttribute("userType");
            
            String address = "";
            String expertiseID = request.getParameter("expertiseID");
            
            
      try {
            
            if ((!(UserSession==null))&&(UserType.equals("2"))) 
                
                {
                  address="WEB-INF/LecExpertise.jsp?delID='"+expertiseID+"'";
                }
           else
                {
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
               }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } finally { 
            out.close();
        }
    } 

 
}
