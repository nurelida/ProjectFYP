/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLecExpertise extends HttpServlet {
   
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String UserSession = (String)session.getAttribute("user");
            String UserType = (String)session.getAttribute("userType");
            
            String address = "";
            String option =request.getParameter("Option");
            String expertise = request.getParameter("addProField");
            String description = request.getParameter("addDescription");
            String expertiseID = request.getParameter("expertiseID");
            String newDescription = request.getParameter("editDescription");
            
            DB objDB = new DB();
            
            String query = "";
       try {
            
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
                    if(option.equals("Edit"))
                    {
                        address="/WEB-INF/LecExpertise.jsp?editID="+expertiseID;
                    }

                    else
                    {    
                        if(option.equals("Add"))
                        {

                            query= "insert into expertisefield (staffNo, expertised, description) values('"+UserSession+"','"+Common.replaceSingleQuote(expertise)+"','"+Common.replaceSingleQuote(description)+"')";
                            address="/WEB-INF/LecExpertise.jsp";
                        }

                        if(option.equals("Delete"))
                        { 
                            query="delete from expertisefield where expertised_ID='"+expertiseID+"'";
                            address="/WEB-INF/LecExpertise.jsp";
                        }

                        if(option.equals("Update"))
                        { 
                            query="update expertisefield set description='"+ Common.replaceSingleQuote(newDescription)+"' where expertised_ID='"+expertiseID+"'";
                            address="/WEB-INF/LecExpertise.jsp";
                        }
                        objDB.connect();
                        objDB.query(query);
                        objDB.close();
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
