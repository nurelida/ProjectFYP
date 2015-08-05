<%-- 
    Document   : LecStudEngApp
    Created on : Feb 16, 2009, 1:46:12 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String metricNo = request.getParameter("metric");
if(metricNo==null)
    {
        metricNo = request.getParameter("metricNo");
    }
String query = "select a.proTitle, a.proID, b.studName, d.lectName, e.status, e.reason, e.svSuppReason "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join supervisor c on c.metricNo=a.metricNo "+
                "inner join lecturer d on d.staffNo=c.staffNo "+
                "inner join engapply e on e.proID = a.proID "+
                "where a.metricNo='"+ metricNo +"'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";

String proTitle = "";
String studName = "";
String lectName = "";
String proID="";
String appStatus ="";
String reason = "";
String svReason = "";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";
int row = 0;



String readOnly = "";

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query(query);
     row = objDB.getNumberOfRows();
     proTitle = objDB.getDataAt(0, "proTitle");
     studName = objDB.getDataAt(0,"studName");
     lectName = objDB.getDataAt(0,"lectName");
     proID = objDB.getDataAt(0,"proID");
     appStatus = objDB.getDataAt(0,"status");
     reason = Common.replaceBr(objDB.getDataAt(0,"reason"));
     svReason = objDB.getDataAt(0,"svSuppReason");
     
     objDB.close();
        if(!(svReason==null))
          readOnly = "readOnly";
        
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/LecStudEngApp.js"></script>
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       

 
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
      
      
      <div id="Wrapper">
         <%@ include file="headerlecture.jsp" %>
        
         
    
    <div class="container">
    <div style="height:auto" id="WrapperBody">
        <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span> 
        <br>

                     <center>
                     <%if(!(row==0))
                            {%>
                        <h2>Application to write BSc project report in English</h2>
                        <form name="applyEng">
                           
                                    <table style="width:60%" class="table table-bordered">
                                        
                                        <tr>
                                            <td  >Supervisor</td>
                                            
                                            <td><%=lectName%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td  >Student</td>
                                            
                                            <td><%=studName%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td  >Status</td>
                                            
                                            <td><%=appStatus%></td>
                                        </tr>
                                        
                                        

                                        <tr>
                                            <td  >Project Title</td>
                                            
                                            <td><%=proTitle%></td>
                                        </tr>

                                        <tr>
                                            <td  >Reason for apply</td>
                                            
                                            <td><%=reason%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td  >Supervisor's support reason</td>
                                            
                                            <%if(svReason==null){%>
                                            <td><textarea cols="40" rows="5"name="svReason" ></textarea></td>
                                            <%} else{%>
                                            <td><textarea class="form-control" cols="40" rows="5"name="svReasonEdit" <%=readOnly%> ><%=svReason%></textarea></td>
                                            <%}%>
                                        </tr>
                                        <input type="hidden" value="<%=proID%>" name="proID">
                                        <input type="hidden" value="<%=metricNo%>" name="metricNo">
                                    </table>
                                      <% if(svReason==null)
                                          {
                                      %>
                                      <table>
                                        <tr>
                                            <td colspan="3" align="center">
                                                <div class="btn btn-success" onclick="addSvReason()">&emsp;Submit&emsp;</div>
                                            </td>
                                        </tr> 
                                      </table>
                                        <% }else{
                                            %>
                                            <table>
                                        <tr id="editItem" class="btnEditShow">
                                            <td colspan="3" align="center">
                                                <div class="btn btn-info"  onclick="showChg()">&emsp;Edit&emsp;</div>
                                            </td>
                                        </tr> 
                                        
                                        <tr id="chgItem" class="hide">
                                            <td colspan="3" align="center">
                                                <div class="btn btn-success" onclick="saveChanges()">Save Changes</div>
                                            </td>
                                        </tr>
                                        
                                       <%}%>
                              </table>
                             </fieldset>
                             
                         </form>
                         <%}else{
                           %>
                           <h2>There is no application form submited.</h2>
                           <%}%>
                         
                    
                    </center>
        
  
        <br><br>
<div id="BodyContentStudent">
    <span>
    
                   
                </span>
    
    
</div>

                
        <div id="Left">
        
         <br>
         <!--Main Menu-->
    
         <br>
         </div>
</div>
</div>
         <br><br><br>
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