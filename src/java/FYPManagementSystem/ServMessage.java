/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 * ----------------------------------------------------------------------------
    Date            Change                                 Author
    ----------------------------------------------------------------------------
   1/2/2009         Add Submit Title Msg                    Yihrou
    ----------------------------------------------------------------------------
 */
public class ServMessage extends HttpServlet {
   
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
            String PageType;
            PageType=request.getParameter("PageID");
            String address="";
            address="/WEB-INF/"+PageType+".jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RedirectPage</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RedirectPage at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

   
}
