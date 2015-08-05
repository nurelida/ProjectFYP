/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Semester;
import java.io.*;
import java.net.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdSelectEv extends HttpServlet {
   public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        ArrayList ev1 = new ArrayList();
        ArrayList ev2 = new ArrayList();
        ArrayList ev1No = new ArrayList();
        ArrayList ev2No = new ArrayList();
        ArrayList room = new ArrayList();
        ArrayList ev_slot = new ArrayList();

        ArrayList title = new ArrayList();
        ArrayList metricNo = new ArrayList();
        ArrayList sv = new ArrayList();
        ArrayList proField = new ArrayList();

        ArrayList studMetricNo = new ArrayList();
        ArrayList studSession = new ArrayList();
        ArrayList studSlot = new ArrayList();
        ArrayList studRoom = new ArrayList();

        int row=0;
        int title_row =0;
        int pro_ev_row =0;
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                DB objDB = new DB();
                objDB.connect();
                objDB.query("SELECT a.slot, a.room, b.lectName as ev1Name, c.lectName as ev2Name, a.ev1, a.ev2 "+
                     "FROM lec_ev_timetable a "+
                     "inner join lecturer b on b.staffNo=a.ev1 "+
                     "inner join lecturer c on c.staffNo=a.ev2 "+
                     "where a.semester='"+Semester.getSemester()+"'");
                 row = objDB.getNumberOfRows();
                 for(int i=0;i<row;i++)
                     {
                         ev_slot.add(objDB.getDataAt(i, "slot"));
                         room.add(objDB.getDataAt(i, "room"));
                         ev1No.add(objDB.getDataAt(i,"ev1"));
                         ev2No.add(objDB.getDataAt(i,"ev2"));
                         ev1.add(objDB.getDataAt(i,"ev1Name"));
                         ev2.add(objDB.getDataAt(i,"ev2Name"));
                     }
                 request.setAttribute("ev_slot",ev_slot );
                 request.setAttribute("room",room );
                 request.setAttribute("ev1No",ev1No );
                 request.setAttribute("ev2No",ev2No );
                 request.setAttribute("ev1",ev1 );
                 request.setAttribute("ev2",ev2 );
                 request.setAttribute("row", Integer.toString(row));
                 objDB.query("SELECT a.proTitle, a.metricNo, b.proField, c.staffNo as supervisor "+
                                "from title a "+
                                "inner join projectField b on a.proField=b.id "+
                                "inner join supervisor c on c.metricNo=a.metricNo "+
                                "inner join psm_1 d on d.metricNo=a.metricNo "+
                                "where a.status!='Fail' and d.semester='"+Semester.getSemester()+"'" );
                 title_row = objDB.getNumberOfRows();
                 for(int i=0;i<title_row;i++)
                     {
                        title.add(objDB.getDataAt(i, "proTitle"));
                        metricNo.add(objDB.getDataAt(i,"metricNo"));
                        proField.add(objDB.getDataAt(i,"proField"));
                        sv.add(objDB.getDataAt(i,"supervisor"));
                     }
                 request.setAttribute("title",title );
                 request.setAttribute("metricNo",metricNo );
                 request.setAttribute("proField",proField );
                 request.setAttribute("sv", sv);
                 request.setAttribute("title_row", Integer.toString(title_row));

                 objDB.query("select slot,roomID, metricNo, session from project_evaluation where semester='"+Semester.getSemester()+"'");
                 pro_ev_row = objDB.getNumberOfRows();
                 for(int i=0;i<pro_ev_row;i++)
                    {
                        studMetricNo.add(objDB.getDataAt(i,"metricNo"));
                        studSession.add(objDB.getDataAt(i,"session"));
                        studSlot.add(objDB.getDataAt(i,"slot"));
                        studRoom.add(objDB.getDataAt(i,"roomID"));
                    }
                 request.setAttribute("studMetricNo",studMetricNo );
                 request.setAttribute("studSession",studSession );
                 request.setAttribute("studSlot",studSlot );
                 request.setAttribute("studRoom",studRoom );
                 request.setAttribute("pro_ev_row", Integer.toString(pro_ev_row));
                 objDB.close();
                 address="/WEB-INF/AdAssignEvaluator.jsp";
            }
            else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServTest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServTest at " + request.getContextPath () + "</h1>");
            for(int j=0;j<ev1.size();j++){
                out.println("<h1>"+ev1.get(j)+"</h1>");
            }
            out.println("</body>");
            out.println("</html>");
            
        } finally { 
            out.close();
        }
    } 
}
