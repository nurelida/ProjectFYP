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
public class ServLecSelectEv extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        try {
            if ((!(UserSession==null))&& ((UserType.equals("2"))||(UserType.equals("3")))) {
                if(request.getParameter("psmSelect").equals("psm1")){
                    if(request.getParameter("evSelect").equals("pro")){
                        address="/WEB-INF/LecEvTitle.jsp";
                    }
                    else if(request.getParameter("evSelect").equals("chairman")){
                        address="/WEB-INF/LecEv_Chairman.jsp";
                    }
                    else if(request.getParameter("evSelect").equals("panel")){
                        address="/WEB-INF/LecEv_Panel.jsp";
                    }
                }
                else if(request.getParameter("psmSelect").equals("psm2")){
                    if(request.getParameter("evSelect").equals("chairman")){
                        address="/WEB-INF/LecEv_Chairman_psm2.jsp";
                    }
                    else if(request.getParameter("evSelect").equals("panel")){
                        address="/WEB-INF/LecEv_Panel_psm2.jsp";
                    }
                }
             
                else{
                   address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login."; 
                }
                
            }
            else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
            /* TODO output your page here 
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServLecSelectEv</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServLecSelectEv at " + request.getParameter("psmSelect") + "</h1>");
            out.println("<h1>Servlet ServLecSelectEv at " + request.getParameter("evSelect") + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
           
        } finally { 
            out.close();
        }
    } 
}
