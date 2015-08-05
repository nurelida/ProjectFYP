<%-- 
    Document   : LecEvaluation
    Created on : Mar 20, 2009, 9:44:57 PM
    Author     : rou
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

 //if ((!(UserSession==null))&&(UserType.equals("2"))) {
 if ((!(UserSession==null))) {
   /*
            DB objDB = new DB();
     objDB.connect();
     objDB.query("select * from lec_timetable where staffNo='"+UserSession+"' and semester='"+Semester.getSemester()+"'");
     int row = objDB.getNumberOfRows();
     objDB.close();
  */
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <title>Final Year Project Management System</title>
    </head>
    <script type="text/javascript">
        function checkPsm(value){
            var f = document.forms[0];
            var d = document;
            if(!(value=="")){
                d.getElementsByName("evSelect")[0].disabled=false;
                if(value=="psm2"){
                    d.getElementsByName("evSelect")[0].options[1].className="Hide";
                }
                else  
                    d.getElementsByName("evSelect")[0].options[1].className="Show";
                }
            else{
                d.getElementsByName("evSelect")[0].disabled=true;
            }
        }
        function checkEv(value){
            var d = document;
            var f = document.forms[0];
            if(d.getElementsByName("psmSelect")[0].value=="psm2"){
                if(value=="pro"){
                    alert("Sorry project proposal evalation not available for psm 2.");
                    return;
                 }
                 else{
                    selectEv();
                 }
            }
            else
                selectEv();
        }
        function selectEv(){
            var f= document.forms[0];
            f.method = "POST";
            f.target = "_self";
            f.action = "./ServLecSelectEv";
            f.submit();
        }
    </script>
  <style type="text/css">
    .Show{
            display: ;
    }
    .Hide{
            display:none;
    }
   
    </style>
    <body>
         
        <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    
  
    <div style="height:auto" id="WrapperBody">
        <br>

        <br><center>
             <form>
    
                    <div style="width:600px" class="panel panel-default">
						<div class="panel-heading" style="background-color: #FCF5CA">
							<h3 style="color:#740F2D" class="panel-title"><b>Project Evaluation</b></h3>
  </div>
  <div class="panel-body ">
	  <table id="expertise" style="font-weight:bold; width:100%; color:#740F2D;">
                        <tr>
                            <td>Bachelor Project</td>
                            <td width="5px"></td>
                            <td><select class="form-control" name="psmSelect" onchange="checkPsm(this.value)">
                                    <option value="">Please Select</option>
                                    <option value="psm1">Bachelor Project 1 (PSM1)</option>
                                    <option value="psm2" >Bachelor Project 2 (PSM2)</option>
                                </select>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        
                        <tr>
                            <td>Evaluation</td>
                            <td></td>
                            <td><select class="form-control" name="evSelect" onchange="checkEv(this.value)" disabled>
                                    <option value="">Please Select</option>
                                    <option value="pro">Project Proposal</option>
                                    <option value="chairman" >Chairman Evalution</option>
                                    <option value="panel">Panel Evalution</option>
                                </select>
                            </td>
                        </tr>
                        
                    </table>
                    </form>
         </div>
                    
          
        </center>
        <br><br><br><br>
        


                
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
