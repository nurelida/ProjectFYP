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
public class ServAdAsgEvT extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String proID = request.getParameter("proID");
        String evNo = request.getParameter("evNo");       
        String query = "update title set evaluator='"+evNo+"'where proID='"+proID+"'";
        int count =0;
        int evQ =0;
        String temp = "";
        String semester = Semester.getSemester();
        String cQuery ="select count(evaluator) as evQuota from title where evaluator='"+evNo+"'";
        String quota ="select ev_Title from quota_lecturer where semester='"+semester+"'";
        String address="";
        
         try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
               
              DB objDB = new DB();
              objDB.connect();
              objDB.query(cQuery);
              temp=objDB.getDataAt(0, "evQuota");
                count=Integer.parseInt(temp);
              objDB.query(quota);
              temp=objDB.getDataAt(0,"ev_Title");
              evQ=Integer.parseInt(temp);
              
                if(!(count>=evQ))
                {  
                    objDB.query(query);
                    address="/WEB-INF/AdAsgEvT.jsp";
                }
                else
                {   address="/WEB-INF/Message.jsp?Message=EVTitleFailed"; }
                
              objDB.close();
              
             }
            else
            {
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
