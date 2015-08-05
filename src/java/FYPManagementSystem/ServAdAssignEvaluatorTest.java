/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import FYPManagementSys_Bean.DB;

/**
 *
 * @author rou
 */
public class ServAdAssignEvaluatorTest extends HttpServlet {
   
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        String option = request.getParameter("Option");
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                if(option.equals("selectedDay")){
                    request.setAttribute("selectedDay",request.getParameter("selectedDay"));
                    request.setAttribute("selectedRoom",request.getParameter("selectedRoom"));
                }
            
           address="/WEB-INF/AdAsignTestPsm1.jsp";
          }
            else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);  
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServAdAssignEvaluatorTest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServAdAssignEvaluatorTest at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 
}
