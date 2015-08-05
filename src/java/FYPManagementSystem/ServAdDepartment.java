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
public class ServAdDepartment extends HttpServlet {
   
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
            String option =request.getParameter("Option");
          
            String deptName = request.getParameter("addDeptName");
            String deptCode = request.getParameter("addDeptCode");
            String id = request.getParameter("id");
            
            
            
            DB objDB = new DB();
            
            String query = "";
            String queryadddeptquota="";
            
      try {
            
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                     
                        if(option.equals("Add"))
                        {

                            query= "insert into department (deptName,deptCode) values('"+deptName+"','"+deptCode+"')";
                            String tempString=deptName;
                            tempString= tempString.replaceAll("\\s+", "_");
                            queryadddeptquota="ALTER TABLE quota_lecturer ADD "+tempString+" varchar(255)";
                            objDB.connect();
                            objDB.query(query);
                            objDB.query(queryadddeptquota);
                            objDB.close();
                            address="/WEB-INF/AdDepartment.jsp";
                        }
                        if(option.equals("DeleteDept"))
                        {

                            query= "delete from department where deptID='"+id+"'";
                            objDB.connect();
                            objDB.query(query);
                            objDB.close();
                            address="/WEB-INF/AdDepartment.jsp";
                            
                        }

                        



                        
                
                 /* TODO output your page here 
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyUser at " + query+ "</h1>");
            out.println("</body>");
            out.println("</html>");*/
           

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
