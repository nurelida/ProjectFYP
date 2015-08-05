/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;

import java.util.ArrayList;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServSearch extends HttpServlet {
   
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
        String query="select a.proTitle, b.studName, d.lectName ,c.staffNo, a.metricNo, a.semester "+
                  "from title a "+
                  "inner join student b on b.metricNo=a.metricNo "+
                  "inner join supervisor c on c.metricNo=a.metricNo "+
                  "inner join lecturer d on d.staffNo=c.staffNo "; 
              
        int row = 0;
        ArrayList studName = new ArrayList();
        ArrayList metricNo = new ArrayList();
        ArrayList semester = new ArrayList();
        ArrayList svName = new ArrayList();
        ArrayList svNo = new ArrayList();
        ArrayList proTitle = new ArrayList();
        
        String key = Common.replaceSingleQuote(request.getParameter("keywords"));
        String categories = request.getParameter("categories");
        String metric = request.getParameter("metricNo");
        String option = request.getParameter("Option");
       
       
       
        
        try {
            if ((!(UserSession==null))&&(UserType.equals("1"))) {
                
                if(option.equals("viewTitle")){
                    address="/WEB-INF/StudViewSearchTitle.jsp?metric="+metric;
                }
                
                else if(option.equals("Search"))
               {
                       if(categories.equals("title"))
                       {
                            query +=" where a.proTitle like '%"+ key+ "%' order by a.proTitle";
                       }

                       else if(categories.equals("author"))
                       {
                            query +=" where b.studName like '%"+ key+ "%' order by b.studName";
                       }

                       else if(categories.equals("sv"))
                       {
                            query +=" where d.lectName like '%"+ key+ "%' order by d.lectName";
                       }
                       else if(categories.equals("semester"))
                       {
                            query +=" where a.semester like '%"+ key+ "%' order by a.semester";
                       }

                       else
                       {
                            query +="";
                       }

                       DB objDB = new DB();
                       objDB.connect();
                       objDB.query(query);
                       row=objDB.getNumberOfRows();
                       for(int i=0;i<row;i++)
                           {
                           studName.add(objDB.getDataAt(i, "studName"));
                           metricNo.add(objDB.getDataAt(i, "metricNo"));
                           svName.add(objDB.getDataAt(i,"lectName"));
                           svNo.add(objDB.getDataAt(i,"staffNo"));
                           proTitle.add(objDB.getDataAt(i,"proTitle"));
                           semester.add(objDB.getDataAt(i,"semester"));

                           }
                        objDB.close();

                       request.setAttribute("studName",studName);
                       request.setAttribute("metricNo",metricNo);
                       request.setAttribute("svName",svName);
                       request.setAttribute("svNo",svNo);
                       request.setAttribute("proTitle",proTitle);
                       request.setAttribute("semester",semester);
                       request.setAttribute("mericNo",metricNo);
                       request.setAttribute("key",key);
                       request.setAttribute("categories",categories);

                       address="/WEB-INF/Search.jsp";
                       
                }
                
                
            }
            
            else
            {
                  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
            }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServSearch</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServSearch at " + option+ "</h1>");
            out.println("<h1>Servlet ServSearch at " + categories + "</h1>");
            out.println("</body>");
            out.println("</html>"); */
           
        } finally { 
            out.close();
        }
    } 

    
}
