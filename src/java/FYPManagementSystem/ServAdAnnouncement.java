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
public class ServAdAnnouncement extends HttpServlet {
   
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
            String annTitle = request.getParameter("addTitle");
            String annDesc = request.getParameter("addDescription");
            String annID = request.getParameter("annID");
            String show = request.getParameter("annShow");
            
            String newDesc =request.getParameter("editDescription");
            String newTitle = request.getParameter("editTitle");
            String newShow = request.getParameter("editShow");
            
            
            
            DB objDB = new DB();
            
            String query = "";
            
      try {
            
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                    if(option.equals("Edit"))
                    {
                        address="/WEB-INF/AdAnnouncement.jsp?aID="+annID;
                        
                    }

                    else
                    {    
                        if(option.equals("Add"))
                        {

                            query= "insert into announcement (annDesc, annTitle, annShow) values('"+Common.replaceSingleQuote(annDesc)+"','"+Common.replaceSingleQuote(annTitle)+"','"+show+"')";
                            address="/WEB-INF/AdAnnouncement.jsp";
                        }

                        if(option.equals("Delete"))
                        { 
                            
                            query="delete from announcement where annID='"+annID+"'";
                            address="/WEB-INF/AdAnnouncement.jsp";
                        }

                        if(option.equals("Update"))
                        { 
                            query="update announcement set annDesc='"+ Common.replaceSingleQuote(newDesc)+"',annTitle='"+ Common.replaceSingleQuote(newTitle) +"',annShow='"+ newShow +"' where annID='"+annID+"'";
                            address="/WEB-INF/AdAnnouncement.jsp";
                        }



                        objDB.connect();
                        objDB.query(query);
                        objDB.close();
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
