/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import FYPManagementSys_Bean.Semester;
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author rou
 */
public class ServAdAssignEvaluator_psm2 extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
            DB objDB = new DB();
            objDB.connect();
            String [] roomID = request.getParameterValues("roomID");
            objDB.query("delete from project_evaluation_psm2");
            System.out.println("Testing here");
              for(int k=0;k<roomID.length;k++)
                {
                  
                   
                       for(int j=1;j<6;j++){
                           for(int i=2;i<13;i++){
                            String rStr = Integer.toString(j);
                            String cStr = Integer.toString(i);
                            String slot="tt"+Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                            String room = "_"+roomID[k];
                            
                            if(!(request.getParameter("s1_"+slot+room)==null) && !request.getParameter("s1_"+slot+room).equals("")){
                             objDB.query("insert into project_evaluation_psm2 (slot, roomID, metricNo, session, semester) values('"+slot+"','"
                                                                                                                    +roomID[k]+"','"
                                                                                                                    +request.getParameter("s1_"+slot+room)+"','1','"+Semester.getSemester()+"')");
                                                                                                                    
                            }
                            if(!(request.getParameter("s2_"+slot+room)==null) && !request.getParameter("s2_"+slot+room).equals("")){
                             objDB.query("insert into project_evaluation_psm2 (slot, roomID, metricNo, session, semester) values('"+slot+"','"
                                                                                                                    +roomID[k]+"','"
                                                                                                                    +request.getParameter("s2_"+slot+room)+"','2','"+Semester.getSemester()+"')");
                                                                                                                    
                            }
                        }
                    }
                }
            
           out.println("</body>");
           out.println("</html>");
           objDB.close();
           address="/WEB-INF/AdAssignEvaluator_psm2.jsp";
          }
            else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);  
        } 
        catch(Exception e){
            response.getWriter().println(e.getMessage());
        }
        finally {
        
            out.close();
        }
    } 
    
}
