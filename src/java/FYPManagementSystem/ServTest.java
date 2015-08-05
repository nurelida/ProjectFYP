/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServTest extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServTest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServTest at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
        } finally { 
            out.close();
        }
    } 

    
}
