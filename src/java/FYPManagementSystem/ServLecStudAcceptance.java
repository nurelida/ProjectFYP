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
public class ServLecStudAcceptance extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String Option = request.getParameter("Option");
        
        
        String status = request.getParameter("status");
        String metric = request.getParameter("metric");
        
        // Evaluation
        String proStatus = request.getParameter("proStatus");
        
        String evMetricNo = request.getParameter("evMetricNo");
        
        String query = new String();
        if (UserType.equals("2"))
                query="update supervisor set status='"+status+"' where metricNo='"+metric+"'and staffNo='"+UserSession+"'" ;
        else if (UserType.equals("3"))
             query ="update supervisor set status='"+status+"' where metricNo='"+metric+"'";
        
        
        String address="";
        try {
            if ((!(UserSession==null))&& ((UserType.equals("2")) || (UserType.equals("3")))) {
                    if(Option.equals("Status"))
                    {
                       
                        DB objDB = new DB();
                        objDB.connect();
                        objDB.query(query);
                        objDB.close();
                        address="/WEB-INF/LecViewStud.jsp?metric"+metric;
                    }
                    else if(Option.equals("Submit")){
                        String submit="update evaluator set flag_supervisor='Y' where metricNo='"+metric+"'";
                        DB objDB=new DB();
                        objDB.connect();
                        objDB.query(submit);
                        objDB.close();
                        address="WEB-INF/LecStudAcceptance.jsp";
                        request.setAttribute("psm", request.getParameter("selectPSM"));
                        request.setAttribute("semester", request.getParameter("selectSemester"));
                    }
                    
                    else if(Option.equals("ViewStud"))
                    {
                        address="WEB-INF/LecViewStud.jsp?metric="+metric;
                    }
                    
                    else if(Option.equals("ViewTitle"))
                    {
                        
                        address="WEB-INF/LecStudTitle.jsp?metric="+metric;
                        String ev = request.getParameter("ev");
                        request.setAttribute("evaluate", ev);
                    }
                    
                    else if(Option.equals("ViewAppForm"))
                    {
                        address="WEB-INF/LecStudEngApp.jsp?metric="+metric;
                    }
                    else if(Option.equals("Evaluation"))
                    {
                        String comment = request.getParameter("comment");
                        String query2 ="update title set status='"+proStatus+"', comment='"+Common.replaceSingleQuote(comment)+"' where metricNo='"+evMetricNo+"'";
                        DB objDB = new DB();
                        objDB.connect();
                        objDB.query(query2);
                        objDB.close();
                        address="WEB-INF/LecStudTitle.jsp?metric="+evMetricNo;
                        request.setAttribute("evaluate", "evaluation");
                    }
                    
                    else if(Option.equals("Evaluate_psm1"))
                    {
                        address="WEB-INF/LecSvPSM1v2.jsp?metric="+metric;
                        
                    }
                    
                    else if(Option.equals("Evaluate_psm2"))
                    {
                        address="WEB-INF/LecSvPSM2.jsp?metricNo="+metric;
                        
                    }
                     else if(Option.equals("selectPSM"))
                    {
                        address="WEB-INF/LecStudAcceptance.jsp";
                        request.setAttribute("psm", request.getParameter("selectPSM"));
                    }
                    else if(Option.equals("selectSemester"))
                    {
                        address="WEB-INF/LecStudAcceptance.jsp";
                        request.setAttribute("psm", request.getParameter("selectPSM"));
                        request.setAttribute("semester", request.getParameter("selectSemester"));
                    }
                    
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } 
        finally { 
            out.close();
        }
    } 


    
}
