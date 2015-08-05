/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLecSTudEngApp extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String Option = request.getParameter("Option");
        String address = "";
        String svReason = request.getParameter("svReason");
        String svReasonEdit = request.getParameter("svReasonEdit");
        String proID = request.getParameter("proID");
        String metricNo = request.getParameter("metricNo");
        String query = "";
       
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                
                
                if(Option.equals("Submit")){
                    query = "update engapply set svSuppReason='"+Common.replaceSingleQuote(svReason)+"' where proID='"+proID+"' && metricNo='"+metricNo+"'";
                    address = "/WEB-INF/LecStudEngApp.jsp?metricNo="+metricNo;
                }
                
                else if(Option.equals("Update")){
                    query = "update engapply set svSuppReason='"+Common.replaceSingleQuote(svReasonEdit)+"' where proID='"+proID+"' && metricNo='"+metricNo+"'";
                    address = "/WEB-INF/LecStudEngApp.jsp?metricNo="+metricNo;
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
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServLecSTudEngApp</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServLecSTudEngApp at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

    
}
