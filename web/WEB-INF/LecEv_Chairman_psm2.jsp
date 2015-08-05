<%-- 
    Document   : LecEV_Chairman
    Created on : Mar 20, 2009, 10:34:19 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
DB objDB = new DB();
int row =0;
ArrayList metricNo = new ArrayList();
ArrayList studName = new ArrayList();
ArrayList proTitle = new ArrayList();
ArrayList marks_ev2 = new ArrayList();
ArrayList marks_ev2_psm2 = new ArrayList();
String color ="#fff0f5";

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     String proURL="Images/project1.jpg";
     String psm2URL="";
     
     objDB.connect();
     objDB.query("select  f.studName, f.metricNo, g.proTitle, h.jumlah "+
                "from lec_ev_timetable_psm2 a "+
                "inner join project_evaluation_psm2 b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+ 
                "inner join title g on f.metricNo=g.metricNo "+
                "inner join psm_2 i on f.metricNo=i.metricNo "+
                "left outer join ev_pembentangan_psm1 h on h.metricNo=b.metricNo "+
                "where a.ev2='"+UserSession+"' and i.semester='200820092' "+
                "order by  h.jumlah, f.studName");
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
          metricNo.add(objDB.getDataAt(i, "metricNo"));
          studName.add(objDB.getDataAt(i,"studName"));
          proTitle.add(objDB.getDataAt(i, "proTitle"));
          marks_ev2_psm2.add(objDB.getDataAt(i,"jumlah"));
        }
  objDB.close();
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/LecEvaluation.js"></script>
        
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
       
      
      <div id="Wrapper">
          <div id="Top">
            <div id="TopContent">
                
            </div>
        </div> 
         <div id="BodyContent">
                <span>
                    <form>
                        <h2>Second Assessor (Chairman) PSM2</h2>
                    <table id="expertise">
                        <tr style="font-weight:bold" align="center">
                             <td bgcolor="#fa8072" width="20px">No.</td>   
                             <td bgcolor="#fa8072" width="200px">Student's Name</td>
                             <td bgcolor="#fa8072" width="100px">Metric No</td>
                             <td bgcolor="#fa8072" width="250px">Project Title</td>
                             <td bgcolor="#fa8072" width="50px">Evaluation Form</td>
                        </tr>
                        <% if(!(row==0)){
                            for(int i=0;i<row;i++){
                                if(marks_ev2_psm2.get(i)==null)
                                    psm2URL="Images/p_evaluate";
                                else
                                    psm2URL="Images/evaluate";
                                if(color.equals("#ffe4e1"))
                                   {color = "#ffb6c1";
                                   psm2URL=psm2URL+"2.jpg";
                                   }
                                 else
                                   {color = "#ffe4e1";
                                   psm2URL=psm2URL+"1.jpg";
                                   }
                                %>
                                <tr>
                                    <td bgcolor="<%=color%>"><%=i+1%></td>
                                    <td bgcolor="<%=color%>"><%=studName.get(i)%></td>
                                    <td bgcolor="<%=color%>"><%=metricNo.get(i)%></td>
                                    <td bgcolor="<%=color%>"><%=proTitle.get(i)%></td>
                                    <td bgcolor="<%=color%>" align="center">
                                        <img src="<%=psm2URL%>" onclick="chairmanEvaluation_psm2('<%=metricNo.get(i)%>')"title="Evaluation Form" alt="Evaluation Form" ></img>
                                    </td>
                                </tr>
                        <%  }
                          }%>
                    </table>
                    <table cellpadding="0px" cellspacing="0px">
                        <tr>
                            <td><img src="Images/evaluate.jpg" ></img></td>
                            <td style="line-height:24px;">Evaluation (Done)</td>
                            <td><img src="Images/p_evaluate.jpg" ></img></td>
                            <td style="line-height:24px;">Evaluation (Pending)</td>
                        </tr>
                    </table>
                    <input type="hidden" name="metricNo" value="">
                    </form>
                </span>
        </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="LecMainMenu.jsp" %>
         <br>
         
         </div>
         <!-- Footer-->
         <%@ include file="Footer.jsp" %>	
    </div>
     
    </body>
</html>

<% 
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }

%>

