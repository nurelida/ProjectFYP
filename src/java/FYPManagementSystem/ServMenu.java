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
 * This Servlet used in:
 * -----------------------------------------------------------------------------
 * MainMenu
 * StudentMainMenu
 * -----------------------------------------------------------------------------
 */
public class ServMenu extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String address="";
            String PageType=request.getParameter("Page");
           
            if(PageType.equals("Logout"))
            {
             PageType="Home";
             HttpSession session = request.getSession(true);
             session.invalidate();
            }
            else if(PageType.equals("ServStudSelectSV"))
            {
             address="./ServStudSelectSV";
            } else {
                address="/WEB-INF/"+PageType+".jsp";
            }
            
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        
        } finally { 
            out.close();
        }
    } 

    
}
