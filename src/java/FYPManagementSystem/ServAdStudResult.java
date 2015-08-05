/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdStudResult extends HttpServlet {
   
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
        String str = "";
        try {
             if ((!(UserSession==null))&&(UserType.equals("3"))) {
                    if(Option.equals("selectPSM"))
                        {
                            address="WEB-INF/AdStudResult.jsp";
                            request.setAttribute("psm",request.getParameter("selectPSM"));
                        }
                        else if(Option.equals("selectSemester"))
                        {
                            address="WEB-INF/AdStudResult.jsp";
                            request.setAttribute("psm",request.getParameter("selectPSM"));
                            request.setAttribute("semester",request.getParameter("selectSemester"));
                        }
                        else if(Option.equals("psm1Pass")){
                            
                            str = "select * from psm_2 where metricNo='"+request.getParameter("psm2_metric")+"'";
                            DB objDB = new DB();
                            objDB.connect();
                            objDB.query(str);
                            if(objDB.getNumberOfRows()==0){
                               str = "insert into psm_2 values ('"+request.getParameter("psm2_metric")+"','"+request.getParameter("psm2_semester")+"')";
                               objDB.query(str);
                            }
                            else{
                               str = "update psm_2 set semester='"+request.getParameter("psm2_semester")+"' where metricNo='"+request.getParameter("psm2_metric")+"'"; 
                               objDB.query(str);
                            }
                                 objDB.close();
                            address="WEB-INF/AdStudResult.jsp";
                            
                        }
                        /*
                        else if(Option.equals("PSM2")){
                            address="WEB-INF/AdViewEvPSM2.jsp?metric="+metric;
                        }*/
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServAdStudResult</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServAdStudResult at " + str + "</h1>");
            out.println("</body>");
            out.println("</html>"); */
           
                 
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
