/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import FYPManagementSys_Bean.Semester;
import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServStudTitleSuggestion extends HttpServlet {
   
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
      
        String proTitle = request.getParameter("proTitle");
        String bgProblem = request.getParameter("bgProblem");
        String objective = request.getParameter("objective");
        String scope =request.getParameter("scope");
        String proType = request.getParameter("projectType");
        String proField = request.getParameter("proField");
        String software = request.getParameter("software");
        String hardware = request.getParameter("hardware");
        String technique = request.getParameter("technique");
        String sem = Semester.getSemester();
        String address = "";
        String Option = request.getParameter("Option");
        
        String query = "insert into title (proTitle, bgProblem, objective, scope, proType, proField, softSpecification, hardware, technology, metricNo, status, semester,title_flag) values('"
                        + proTitle +"','"
                        + bgProblem + "','"
                        + objective + "','"
                        + scope + "','"
                        + proType + "','"
                        + proField + "','"
                        + software + "','"
                        + hardware + "','"
                        + technique + "','"
                        + UserSession + "','Pending','"
                        + sem + "','Y')";
                        
        
        String editQuery = "update title set protitle='"+proTitle+
                                         "',bgProblem='"+bgProblem+
                                         "',objective='"+objective+
                                         "',scope='"+scope+
                                         "',proType='"+proType+
                                         "',proField='"+proField+
                                         "',softSpecification='"+software+
                                         "',hardware='"+hardware+
                                         "',technology='"+technique+
                                         "' where metricNo='"+UserSession+"'";
        String del ="delete from title where metricNo='"+UserSession+"'";
        try {
             if ((!(UserSession==null))&&(UserType.equals("1"))) {
                DB objDB = new DB();
                objDB.connect();
                if(Option.equals("Submit"))
                {
                    objDB.query(query);
                    address = "/WEB-INF/StudTitleSuggestion.jsp";
                }
                
                else if(Option.equals("Edit"))
                {
                    objDB.query(editQuery);
                   address="/WEB-INF/Message.jsp?Message=StudTitleUpdate";
                }
                else if(Option.equals("applyAgain"))
                {
                    objDB.query(del);
                    address = "/WEB-INF/StudTitleSuggestion.jsp";
                }
                
                objDB.close();
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
