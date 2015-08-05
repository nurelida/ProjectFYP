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
public class ServAdGenerateTTable extends HttpServlet {
   
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
        String option = request.getParameter("Option");
        String address = "";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
            if(option.equals("psm1")){
              DB objDB = new DB();
                objDB.connect();
                String [] roomID = request.getParameterValues("roomID");
                    for(int k=0;k<roomID.length;k++)
                    {
                       if(!objDB.query("delete from lec_ev_timetable where room='"+roomID[k]+ "'"))
                           objDB.rollback();
                       for(int i=2;i<13;i++){
                           for(int j=0;j<6;j++){
                                String rStr = Integer.toString(j);
                                String cStr = Integer.toString(i);
                                String slot="tt"+Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                                String room = "_"+roomID[k];
                                if((!(request.getParameter("p1"+slot+room)==null))&&(!(request.getParameter("p2"+slot+room)==null))){
                                    if(!(request.getParameter("p1"+slot+room).equals(""))){
                                       objDB.query("insert into lec_ev_timetable values('"+request.getParameter("p1"+slot+room)+"','"
                                                                                          +request.getParameter("p2"+slot+room)+"','"
                                                                                          +slot+"','"
                                                                                          +roomID[k]+"','"+Semester.getSemester()+"')");
                                    }
                                    else if(!(request.getParameter("p2"+slot+room).equals(""))) {
                                       objDB.query("insert into lec_ev_timetable values('"+request.getParameter("p1"+slot+room)+"','"
                                                                                          +request.getParameter("p2"+slot+room)+"','"
                                                                                          +slot+"','"
                                                                                          +roomID[k]+"','"+Semester.getSemester()+"')");
                                    }
                                }
                            }
                        }
                    }
               objDB.close();
               address="/WEB-INF/AdGenerateTTable.jsp";  
            }
            
            else if(option.equals("psm2")){
                DB objDB = new DB();
                objDB.connect();
                String [] roomID = request.getParameterValues("roomID");
                    for(int k=0;k<roomID.length;k++)
                    {
                       
                       if(!objDB.query("delete from lec_ev_timetable_psm2 where room='"+roomID[k]+ "'"))
                           objDB.rollback();
                       for(int i=2;i<13;i++){
                           for(int j=0;j<6;j++){
                                String rStr = Integer.toString(j);
                                String cStr = Integer.toString(i);
                                String slot="tt"+Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                                String room = "_"+roomID[k];
                                if((!(request.getParameter("p1"+slot+room)==null))&&(!(request.getParameter("p2"+slot+room)==null))){
                                    if(!(request.getParameter("p1"+slot+room).equals(""))){
                                       objDB.query("insert into lec_ev_timetable_psm2 values('"+request.getParameter("p1"+slot+room)+"','"
                                                                                          +request.getParameter("p2"+slot+room)+"','"
                                                                                          +slot+"','"
                                                                                          +roomID[k]+"','"+Semester.getSemester()+"')");
                                    }
                                    else if(!(request.getParameter("p2"+slot+room).equals(""))){
                                       objDB.query("insert into lec_ev_timetable_psm2 values('"+request.getParameter("p1"+slot+room)+"','"
                                                                                          +request.getParameter("p2"+slot+room)+"','"
                                                                                          +slot+"','"
                                                                                          +roomID[k]+"','"+Semester.getSemester()+"')");
                                    }
                                }
                            }
                        }
                    }
               objDB.close();
               address="/WEB-INF/AdGenerateTTable_psm2.jsp";  
            }
            else if(option.equals("ShowSchedule")){
              DB objDB = new DB(); 
              objDB.connect();
              objDB.query("delete from flag_lec_ev_schedule");
              objDB.query("insert into flag_lec_ev_schedule value('"+request.getParameter("showEv")+"')");
              objDB.close();
              address="/WEB-INF/AdHome.jsp";
            }
            else if(option.equals("ShowResult")){
              DB objDB = new DB(); 
              objDB.connect();
              objDB.query("delete from flag_stud_result");
              objDB.query("insert into flag_stud_result value('"+request.getParameter("show_result")+"')");
              objDB.close();
              address="/WEB-INF/AdHome.jsp";
            }
            else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
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
