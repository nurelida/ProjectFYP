/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.Common;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Semester;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLecTimeTable extends HttpServlet {
   
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
        String address="";
        String option = request.getParameter("Option");
        String del="delete from lec_timetable where staffNo='"+UserSession+"' and semester='"+Semester.getSemester()+"'";
        String insert ="insert into lec_timetable values('"+UserSession+"','tt";
        DB objDB = new DB(); 
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                if (option.equals("saveTimetable")){
                  objDB.connect();
                  objDB.query(del);  
                 for(int r=1; r<6; r++){
                    for(int c=2; c<13; c++){
                            String rStr = Integer.toString(r);
                            String cStr = Integer.toString(c);
                        if((request.getParameter("tt" + Common.completeStr(rStr, 2) + Common.completeStr(cStr, 2))).equals("1")){
                                String query=insert + Common.completeStr(rStr, 2) + Common.completeStr(cStr, 2)+"','"+Semester.getSemester()+"')";
                                objDB.query(query);
                                
                                 }
                        }
                    
                }
                objDB.close();
                address="/WEB-INF/LecTimeTable.jsp";
                }
                else if(option.equals("selectEv")){
                    String temp1=request.getParameter("selectedPSM");
                    String temp2 =request.getParameter("selectedEv");
                    request.setAttribute("selectedPSM",temp1 );
                    request.setAttribute("selectedEv",temp2);
                    address="/WEB-INF/LecTimeTable.jsp";
                }
                else if(option.equals("viewTitle")){
                    address="/WEB-INF/LecStudTitle.jsp";
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
