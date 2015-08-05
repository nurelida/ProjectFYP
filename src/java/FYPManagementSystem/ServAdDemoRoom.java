/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServAdDemoRoom extends HttpServlet {
   
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
        String roomName = request.getParameter("demoRoom");
        String roomID = request.getParameter("roomID");
        String query = "";
        String option = request.getParameter("Option");
        try {if ((!(UserSession==null))&&(UserType.equals("3"))) {
               
                if(!(option.equals("edit"))){
                    if(option.equals("save")){
                        query="insert into demo_room (room_name) values('"+Common.replaceSingleQuote(roomName)+"')";

                    }
                    else if(option.equals("delete")){
                        query="delete from demo_room where roomID='"+roomID+"'";
                    }
                    else if (option.equals("saveChanges")){
                        query="update demo_room set room_name='"+Common.replaceSingleQuote(request.getParameter("editDemoRoom"))
                                                                +"' where roomID='"+roomID+"'";
                    }
                    DB objDB = new DB();
                    objDB.connect();
                    objDB.query(query);
                    objDB.close();
                    address="WEB-INF/AdDemoRoom.jsp";
                }
                else{
                    address="WEB-INF/AdDemoRoom.jsp?index="+roomID;
                }
                    
               /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServAdDemoRoom</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServAdDemoRoom at " + query + "</h1>");
            out.println("</body>");
            out.println("</html>"); */
           
                        
                
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
