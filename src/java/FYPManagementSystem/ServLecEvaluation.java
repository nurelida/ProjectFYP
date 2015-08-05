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
public class ServLecEvaluation extends HttpServlet {
   
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
        String metricNo = request.getParameter("metricNo");
        String evaluation = request.getParameter("Evaluation");
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                if(evaluation.equals("chairman")){
                address="/WEB-INF/LecEvaluation_Chairman.jsp?metricNo="+metricNo;
            }
           
                else if(evaluation.equals("chairman_psm2")){
                address="/WEB-INF/LecEvaluation_Chairman_psm2.jsp?metricNo="+metricNo;
            }
                
                else if(evaluation.equals("panel")){
                address="/WEB-INF/LecEvaluation_Panel.jsp?metricNo="+metricNo;
            }
                else if(evaluation.equals("panel_psm2")){
                address="/WEB-INF/LecEvaluation_Panel_psm2.jsp?metricNo="+metricNo;
                 /* TODO output your page here 
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServLecEvaluation</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServLecEvaluation at " + a + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            }
               
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } finally { 
            out.close();
        }
    } 

    
}
