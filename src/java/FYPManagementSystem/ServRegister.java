/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Semester;
import FYPManagementSys_Bean.Common;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServRegister extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String name = request.getParameter("stud_name");
            String dept = request.getParameter("department");
            String metric_no = request.getParameter("matric_no");
            String ic_no = request.getParameter("ic_no");
            String phone_no = request.getParameter("phone_no");
            String email_add = request.getParameter("email_add");
            String psw = request.getParameter("psw");
            String semester = Semester.getSemester();
            String str="insert into student values('"+name+"','"+metric_no+"','"+ic_no+"','"+email_add+"',password('"+psw+"'),'"+phone_no+"','"+semester+"','"+dept+"')";
            String str1="insert into users_login values(password('"+psw+"'),'"+metric_no+"',1)";
            String str2="select userID from users_login where userID='"+metric_no+"'";
            String str3="insert into psm_1 values('"+metric_no+"','"+semester+"')";
            String address="";
            DB objDB = new DB();
            objDB.connect();
            objDB.query(str2);
            
            if(objDB.getNumberOfRows()==0)
            {   
                if(!objDB.query(str))
                    objDB.rollback();
                if(!objDB.query(str1))
                    objDB.rollback();
                if(!objDB.query(str3))
                    objDB.rollback();
                 address="/WEB-INF/Message.jsp?Message=Congratulation. Your registration was Successful";
            }
            else
            {
                address="/WEB-INF/Message.jsp?Message=Sorry. Your registration was Failed";
            }
            objDB.close();
           
            
           
           
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
            
            
            

            
        } finally { 
            out.close();
        }
    } 

}
