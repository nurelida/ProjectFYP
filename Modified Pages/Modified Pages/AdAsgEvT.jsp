<%-- 
    Document   : AdAsgEvT
    Created on : Mar 9, 2009, 3:04:58 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Semester"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String semester = Semester.getSemester();
String query = "select a.proTitle, d.lectName as svName, c.staffNo,e.proField,a.evaluator,a.proID, f.lectName as evName, a.semester "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join supervisor c on c.metricNo=a.metricNo "+
                "inner join lecturer d on d.staffNo=c.staffNo "+
                "inner join projectfield e on a.proField= e.id "+
                "left outer join lecturer f on f.staffNo=a.evaluator  "+
                "where a.semester='"+semester+"' order by evName";

String queryLec ="select lectName, staffNo from lecturer order by lectName";

String quota ="select ev_Title from quota_lecturer where semester='"+semester+"'";
String cQuery="";
String temp;
int count =0;
int quo =0;

DB objDB = new DB();
int row = 0;
int lecRow = 0;
ArrayList title = new ArrayList();
ArrayList svName = new ArrayList();
ArrayList svNo = new ArrayList();
ArrayList field = new ArrayList();
ArrayList ev = new ArrayList();
ArrayList evName = new ArrayList();
ArrayList proID = new ArrayList();

ArrayList lecName = new ArrayList();
ArrayList staffNo = new ArrayList();
String color = "#fff0f5";
int rowQuota =0;
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     
     objDB.connect();
     objDB.query(quota);
     rowQuota=objDB.getNumberOfRows();
     if(!(rowQuota==0)){
     temp=objDB.getDataAt(0,"ev_Title");
     quo=Integer.parseInt(temp);
    
     objDB.query(query);
     row = objDB.getNumberOfRows();
    for(int i =0;i<row;i++)
    {
        title.add(objDB.getDataAt(i,"proTitle"));
        svName.add(objDB.getDataAt(i,"svName"));
        svNo.add(objDB.getDataAt(i, "staffNo"));
        field.add(objDB.getDataAt(i, "proField"));
        ev.add(objDB.getDataAt(i,"evaluator"));
        proID.add(objDB.getDataAt(i,"proID"));
        evName.add(objDB.getDataAt(i, "evName"));
        
        if(ev.get(i)==null)
           { ev.set(i,"");
            evName.set(i,"-");}
    }
     
     
     objDB.query(queryLec);
     lecRow=objDB.getNumberOfRows();
     for(int i=0;i<lecRow;i++)
     {
        lecName.add(objDB.getDataAt(i,"lectName"));
        staffNo.add(objDB.getDataAt(i,"staffNo"));
     }
     
    
    
     for(int i=0;i<staffNo.size();i++)
    {
     cQuery ="select count(evaluator) as evQuota from title where evaluator='"+staffNo.get(i)+"'";
     objDB.query(cQuery);
     temp=objDB.getDataAt(0, "evQuota");
     count=Integer.parseInt(temp);
        if(count>=quo)
            {
                staffNo.set(i,"F");
                lecName.set(i,"F");
            }

    }
   }  
     
     objDB.close();
%>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/evaluator.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/AdAsgEvT.js"></script>
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
                        <%if(rowQuota>0){%>
                        <h2>Evaluator of Project Proposal</h2>
                        <table>
                            <tr bgcolor="#fa8072" style="font-weight:bold" align="center">
                                <td id="evaProTitle">Project Title</td>
                                <td id="evaProType">Project Type</td>
                                <td id="evaluator">Evaluator</td>
                                <td id="evaAction">Action</td>
                            </tr>

                             <% if(!(row==0))
                                 {
                                for(int i=0;i<title.size();i++)
                                 {
                                     if(color.equals("#ffe4e1"))
                                        {
                                            color = "#ffb6c1";
                                        }
                                     else
                                        {   color = "#ffe4e1";
                                        }
                            %>

                             <tr>   
                                <td bgcolor="<%=color%>"><%=title.get(i)%></td>
                                <td bgcolor="<%=color%>"><%=field.get(i)%></td>
                                <td bgcolor="<%=color%>"><%=evName.get(i)%></td>
                                <td bgcolor="<%=color%>">
                                <select id="evaList" name="asgEv" onchange="assignEV('<%=proID.get(i)%>','<%=i%>','<%=title.size()%>')">
                                                    <option value=""> Please Select</option>
                                                    <% for(int j=0;j<lecRow ;j++)
                                                        {
                                                          if(!staffNo.get(j).equals("F")){
                                                             %>
                                                            <option value="<%=staffNo.get(j)%>" <%if((staffNo.get(j).equals(svNo.get(i)))){%> disabled <%}%>  ><%=lecName.get(j)%></option>
                                                        <% 
                                                          }
                                                        }%>
                                </select>

                                </td>
                            </tr>
                            <%}
                             } else{%>
                             <tr>
                                 <td>There is not title submited.</td>
                             </tr>
                             <%}%>
                            <input type="hidden" name="proID" value="">
                            <input type="hidden" name="evNo" value="">
                        </table>
                        <%} else {%>
                        <h2>Please insert quota of lecturer for semester <%=semester%> before proceed.</h2>
                        <%}%>
                    </form>
                </span>
        </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="AdMainMenu.jsp" %>
         <br>
         <!--Annoucement-->
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