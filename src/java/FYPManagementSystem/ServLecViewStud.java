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
public class ServLecViewStud extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        PrintWriter out = response.getWriter();
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                DB objDB = new DB();
                //objDB.connect();
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServLecViewStud</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServLecViewStud at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
            }
            else{
                
            }
        } finally { 
            out.close();
        }
    } 

    
}
