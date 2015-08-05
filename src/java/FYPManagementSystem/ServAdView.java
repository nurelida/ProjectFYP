
package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdView extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String Option = request.getParameter("Option");
        
       
        String staffNo = request.getParameter("staffNo");
        String metric = request.getParameter("metricNo");
        
        String delStud = "delete from student where metricNo='"+metric+"'";
        String delStud2 = "delete from users_login where userID='"+metric+"'";
        String delStud3 = "delete from supervisor where metricNo='"+metric+"'";
          
        String delLec = "delete from lecturer where staffNo='"+staffNo+"'";
        String delLec2 = "delete from supervisor where staffNo='"+staffNo+"'";
        String delLec3 = "delete from users_login where userID='"+staffNo+"'";
         
         
        
        String address="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                    
                    if(Option.equals("DeleteStud")||Option.equals("DeleteLec")){
                        DB objDB = new DB();
                        objDB.connect();
                        if(Option.equals("DeleteLec"))
                        {
                            objDB.query(delLec);
                            objDB.query(delLec2);
                            objDB.query(delLec3);
                            address="WEB-INF/AdViewLec.jsp";
                        }
                        
                        else if(Option.equals("DeleteStud"))
                        {
                            objDB.query(delStud);
                            objDB.query(delStud2);
                            objDB.query(delStud3);
                            address="WEB-INF/AdViewStud.jsp";
                        }
                        objDB.close();
                    }
                    
                    else{
                        if(Option.equals("ViewStud"))
                        {
                            address="WEB-INF/AdViewStudDetails.jsp?metric="+metric;
                        }

                        else if(Option.equals("ViewStudTitle"))
                        {
                            address="WEB-INF/AdViewStudTitle.jsp?metric="+metric;
                        }
                        
                        else if(Option.equals("ViewApp"))
                        {
                            address="WEB-INF/AdViewStudApp.jsp?metric="+metric;
                        }
                         else if(Option.equals("ViewLec"))
                        {
                            address="WEB-INF/AdViewLecDetails.jsp?staffNo="+staffNo;
                        }
                        else if(Option.equals("selectPSM"))
                        {
                            address="WEB-INF/AdViewStud.jsp";
                            request.setAttribute("psm",request.getParameter("selectPSM"));
                        }
                        else if(Option.equals("selectSemester"))
                        {
                            address="WEB-INF/AdViewStud.jsp";
                            request.setAttribute("psm",request.getParameter("selectPSM"));
                            request.setAttribute("semester",request.getParameter("selectSemester"));
                        }
                        else if(Option.equals("PSM1")){
                            address="WEB-INF/AdViewEvPSM1.jsp?metric="+metric;
                        }
                        else if(Option.equals("PSM2")){
                            address="WEB-INF/AdViewEvPSM2.jsp?metric="+metric;
                        }
                        else if(Option.equals("SetActive")){
                            DB objDB = new DB();
                            objDB.connect();
                            objDB.query("update lecturer set active='"+request.getParameter("lecActive")+"' where staffNo='"+staffNo+"'");
                            objDB.close();
                            address="WEB-INF/AdViewLec.jsp";
                        }
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
