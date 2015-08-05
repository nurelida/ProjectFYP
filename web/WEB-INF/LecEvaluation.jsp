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
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query("select * from lec_timetable where staffNo='"+UserSession+"' and semester='"+Semester.getSemester()+"'");
     int row = objDB.getNumberOfRows();
     objDB.close();
  
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    <script type="text/javascript">
        function checkPsm(value){
            var f = document.selectPSM;
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
            var f = document.selectPSM;
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
            var f= document.selectPSM;
            f.method = "POST";
            f.target = "_self";
            f.action = "./ServLecSelectEv";
            f.submit();
        }
    </script>
 
    <body>
             
      
      <div id="Wrapper" style="padding-top:50px">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">
         
    
        
			 <div style="height:auto" id="WrapperBody">
				 <br>

				 <br><center>
				 <form name="selectPSM">
					 <%if(row>0){%>

						 <div style="width:50%" class="panel panel-default">
							 <div class="panel-heading" style="background:#FCF5CA;">
								 <h2 style="color:#740F2D ;font-weight:bold;" class="panel-title"><b>Project Evaluation</h2>
									 </div>
								 <div class="panel-body alert-warning" style="background:white;">       
									 <table class="table" style="font-weight:bold ; background: white; color:#740F2D;">
										 <tr>
											 <td>Bachelor Project</td>
											 <td>&emsp;</td>
											 <td><select class="form-control" name="psmSelect" onchange="checkPsm(this.value)">
												 <option value="">Please Select</option>
												 <option value="psm1">Bachelor Project 1 (PSM1)</option>
												 <option value="psm2">Bachelor Project 2 (PSM2)</option>
												 </select>
											 </td>
										 </tr>

										 <tr>
											 <td>Evaluation</td>
											 <td>&emsp;</td>
											 <td><select class="form-control" name="evSelect" onchange="checkEv(this.value)" disabled>
												 <option value="">Please Select</option>
												 <option value="pro">Project Proposal</option>
												 <option value="chairman">Chairman Evalution</option>
												 <option value="panel">Panel Evalution</option>
												 </select>
											 </td>
										 </tr>

									 </table>
								 </div></div>
							 <%}else {%>
								 <h2 style="color:#FCF5CA;">Please click evaluation schedule to select free period before proceed.</h2>
								 <%}%>
									 </form>

								 </center>


							 <br><br><br><br><br>
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
