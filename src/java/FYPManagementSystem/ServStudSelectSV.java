/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Semester;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServStudSelectSV extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        
        String staffNo = request.getParameter("lecID");
        String Option = request.getParameter("Option");
        String semester = Semester.getSemester();
        String str = "delete from supervisor where metricNo='"+UserSession+"'";
        String query="insert into supervisor (staffNo , metricNo, status, semester) values('"+staffNo+"','"+UserSession+"','Pending','"+semester+"')";
        String address="";
        String a ="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("1"))) {
                
                if(Option.equals("Select"))
                {   
                    query="insert into supervisor (staffNo , metricNo, status, semester) values('"+staffNo+"','"+UserSession+"','Pending','"+semester+"')";
                }
                else if(Option.equals("ReApply"))
                {
                    query = "delete from supervisor where metricNo='"+UserSession+"'";
                }
                else if(Option.equals("ViewLec")){
                    request.setAttribute("pageid",request.getParameter("pageid"));
                }
                address="/WEB-INF/StudSelectSV.jsp";
                DB objDB = new DB();
                objDB.connect();
                objDB.query(query);
                objDB.close();
                /* TODO output your page here 
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyUser at " + str+ "</h1>");
            out.println("</html>");*/
              
               
            }
            else
            {
             address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
            }
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        }
        finally
        {
            
        }
            
}
}