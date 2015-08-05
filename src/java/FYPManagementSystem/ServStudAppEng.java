/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;

import java.io.*;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServStudAppEng extends HttpServlet {
   
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
        String Option = request.getParameter("Option");
        String address = "";
        String reason = Common.replaceSingleQuote(request.getParameter("reason"));
        String proID = Common.replaceSingleQuote(request.getParameter("proID"));
        String query = "";
        
        try {
            if ((!(UserSession==null))&&(UserType.equals("1"))) {
                
                if(Option.equals("Submit")){
                    query = "insert into engapply (metricNo, reason, proID, status) values('"+UserSession+"','"+reason+"','"+proID+"','Pending')";
                    address = "/WEB-INF/StudAppEng.jsp";
                }
                else if(Option.equals("Update")){
                    query = "update engapply set reason='"+reason+"' where proID='"+proID+"' && metricNo='"+UserSession+"'";
                    address = "/WEB-INF/StudAppEng.jsp";
                }
                else{
                    address="/WEB-INF/Message.jsp?Message=Invalid Option.";
                }
               
                DB objDB = new DB();
                objDB.connect();
                objDB.query(query);
                objDB.close();
                
                        
                
            }
            
            
            
             else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
            
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServStudAppEng</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServStudAppEng at " + query + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } finally { 
            out.close();
        }
    } 

    
   
}
