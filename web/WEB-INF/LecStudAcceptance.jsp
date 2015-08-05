<%-- 
    Document   : LecStudAcceptance
    Created on : Jan 30, 2009, 11:57:59 PM
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
String selectedPSM = (String)request.getAttribute("psm");
String selectedSemester = (String)request.getAttribute("semester");


 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
     DB objDB = new DB();
     
     String lectNameProfile="";
    String userIDProfile="";
    String emailProfile="";
    String phoneNoProfile="";
    String roomNoProfile="";
    objDB.connect();
    objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
    String proColor="";
    String appColor="";
     ArrayList semester = new ArrayList();
     String proURL="Images/project1.jpg";
     String detailURL="Images/User1.jpg";
     String appURL="Images/Clipboard2.jpg";
     String ev_psm1_URL = "";
     String ev_psm2_URL = "";
     ArrayList studName = new ArrayList();
     ArrayList matricNo = new ArrayList();
     ArrayList proStatus = new ArrayList();
     ArrayList appStatus = new ArrayList();
     ArrayList status = new ArrayList();
     ArrayList svSuppReason = new ArrayList();
     ArrayList svEvaluation = new ArrayList();
     ArrayList svEvaluation_psm2 = new ArrayList();
     ArrayList svEvaluation_psm2_1 = new ArrayList();
     ArrayList svEvaluation_psm2_2 = new ArrayList();
     String proClass="proShow";
     String appClass="appShow";
     String evClass="appShow";
     String psm1Class = "psmShow";
     String psm2Class = "psmShow";
     String scheme="show";
     String color ="#fff0f5";
      int row = 0;
     if(selectedSemester==null)
            selectedSemester="";
     if(selectedPSM==null)
         {
            selectedPSM="";
            
         }
     else{
     String groupSemester = "SELECT semester FROM "+ selectedPSM +" group by semester";
     objDB.connect();
     
     objDB.query(groupSemester);
         for (int i =0;i<objDB.getNumberOfRows();i++)
         {
             semester.add(objDB.getDataAt(i, "semester"));
         }
     objDB.close();
     }
     
     if(((!selectedPSM.equals(""))&&(!selectedSemester.equals("")))){
    String query= "select b.studName,a.metricNo,a.status,d.status as proStatus, e.status as appStatus, e.svSuppReason, "+
                   "f.total as psm1_marks, g.total as psm2_marks, h.total as psm2_marks_phase1, i.total as psm2_marks_phase2 "+
                   "from supervisor a "+
                   "inner join student b on b.metricNo=a.metricNo "+
                   "inner join "+ selectedPSM +" j on j.metricNo=a.metricNo "+
                   "inner join lecturer c on c.staffNo=a.staffNo "+
                   "left outer join title d on d.metricNo=a.metricNo "+
                   "left outer join engapply e on e.metricNo=a.metricNo "+
                   "left outer join supervision_marks_psm1 f on f.metricNo=a.metricNo "+
                   "left outer join supervision_marks_psm2 g on g.metricNo=a.metricNo "+
                   "left outer join supervision_phase1_psm2 h on h.metricNo=a.metricNo "+
                   "left outer join supervision_phase2_psm2 i on i.metricNo=a.metricNo "+
                   "where a.staffNo='"+UserSession+"' and j.semester='"+selectedSemester+"' "+
                   "order by b.studName";
    
    
    
  
     objDB.connect();
     
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
           proStatus.add(objDB.getDataAt(i,"proStatus"));
           matricNo.add(objDB.getDataAt(i,"metricNo"));
           studName.add(objDB.getDataAt(i,"studName"));   
           appStatus.add(objDB.getDataAt(i,"appStatus"));  
           status.add(objDB.getDataAt(i,"status")); 
           svSuppReason.add(objDB.getDataAt(i,"svSuppReason"));
           svEvaluation.add(objDB.getDataAt(i,"psm1_marks"));
           svEvaluation_psm2.add(objDB.getDataAt(i,"psm2_marks"));
           svEvaluation_psm2_1.add(objDB.getDataAt(i,"psm2_marks_phase1"));
           svEvaluation_psm2_2.add(objDB.getDataAt(i,"psm2_marks_phase2"));
         }
     
     
     }
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
        <script>
            $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
        </script>

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
         <script type="text/javascript" src="js/LecStudAcceptance.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>

       
      
      <div id="Wrapper" style="padding-top:50px">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">
   
    <div class="container">
    
</div>
        
			 <div style="height:auto" id="WrapperBody">
				 <br>

				 <br><center>

				 <span>

					 <div style="width:50%" class="panel panel-default">
						 <div class="panel-heading" style="background: #FCF5CA ">
							 <h2 style="color:#740f2d; font-weight:bold;" class="panel-title">Select Student</h2>
						 </div>
						 <div class="panel-body alert-warning" style="background:white;">
							 <form name="studentAcceptance"> 
								 <table style="color:#740f2d;">
									 <tr>
										 <td><b>Bachelor Project</b></td>
										 <td>&emsp;</td>
										 <td><select class="form-control" name="psm" onchange="choosePSM(this.value)">
											 <option value="">Please Select</option>
											 <option value="psm_1" <%if(selectedPSM.equals("psm_1")){%> selected <%}%> >Bachelor Project 1 (PSM1)</option>
											 <option value="psm_2" <%if(selectedPSM.equals("psm_2")){%> selected <%}%> >Bachelor Project 2 (PSM2)</option>
											 </select>
											 <input type="hidden" name="selectPSM" value="">
										 </td>
									 </tr>
									 <tr>
										 <td>
											 <br>
										 </td>
									 </tr>
									 <tr>
										 <td><b>Semester</b></td>
										 <td>&emsp;</td>
										 <td>
											 <select class="form-control" name="semester" onchange="chooseSemester(this.value)" <%if(selectedPSM.equals("")){%> disabled<%}%>>
											 <option value="">Please Select</option>
											 <% for(int i=0;i<semester.size();i++){%>
											 <option value="<%=semester.get(i)%>" <%if(semester.get(i).equals(selectedSemester)){%> selected <%}%>><%=semester.get(i)%></option>
											 <%}%>
												 </select>
											 <input type="hidden" name="selectSemester" value="">
											 </td>
											 </tr>
								 </table>
									 </div>
								 </div>
							 <%if(((!selectedPSM.equals(""))&&(!selectedSemester.equals("")))){%>
								 <table style="width:80%;background-color:white" class="table table-bordered table-hover">
									 <tr bgcolor="#ebebeb" style="font-weight:bold" align="center">
										 <td  width="20px">No.</td>   
										 <td  width="250px">Student's Name</td>
										 <td  width="80px">Metric No.</td>
										 <td width="100">Status</td>
										 <td width="150px" >Info</td>
										 <td width="80px">Evaluation</td>



									 </tr>

									 <% 
										if(!(row == 0))
										{   for(int i=0;i<matricNo.size();i++)
									 {

									 if(proStatus.get(i)==null)
									 {
									 proClass="hide";
									 psm1Class="hide";
									 scheme="hide";


									 }
									 else if(proStatus.get(i).equals("Pending"))
									 {
									 proURL="Images/Pproject";
									 proClass="show";
									 psm1Class="hide";
									 scheme="hide";
									 proColor="#FF0000";

									 }
									 else if(!(proStatus.get(i).equals("Pending")))
									 {
									 proURL="Images/project";
									 proClass="show";
									 proColor="#000";

									 }
									 if(appStatus.get(i)==null)
									 {
									 appClass="hide";
									 }
									 else if(appStatus.get(i).equals("Pending"))
									 {
									 appClass="show";
									 appURL="Images/PClipboard";
									 appColor="#FF0000";
									 }
									 else if(appStatus.get(i).equals("Approved"))
									 {
									 appClass="show";
									 appURL="Images/Clipboard";
									 appColor="#000";
									 }
									 if(svEvaluation.get(i)==null)
									 {
									 ev_psm1_URL = "Images/p_evaluate";
									 psm2Class="appHide";

									 }
									 else
									 {
									 ev_psm1_URL = "Images/evaluate";
									 }

									 if((!(svEvaluation_psm2.get(i)==null)&&(svEvaluation_psm2_1.get(i)==null)&&(svEvaluation_psm2_2.get(i)==null)))
									 { 
									 ev_psm2_URL = "Images/evaluate";
									 }
									 else{
									 ev_psm2_URL = "Images/p_evaluate";
									 }
									 if(color.equals("#ffe4e1"))
									 {
									 color = "#ffb6c1";
									 detailURL="Images/User2.jpg";
									 proURL=proURL+"2.jpg";
									 appURL=appURL+"2.jpg";
									 ev_psm1_URL= ev_psm1_URL+"2.jpg";
									 ev_psm2_URL= ev_psm2_URL+"2.jpg";
									 }
									 else
									 {  
									 color = "#ffe4e1";
									 detailURL="Images/User1.jpg";
									 proURL=proURL+"1.jpg";
									 appURL=appURL+"1.jpg";
									 ev_psm1_URL= ev_psm1_URL+"1.jpg";
									 ev_psm2_URL= ev_psm2_URL+"1.jpg";
									 }
									 String stat="";
									 String query="select flag_supervisor from evaluator where metricNo='"+String.valueOf(matricNo.get(i))+"'";
									 objDB.query(query);
									 stat=String.valueOf(objDB.getDataAt(0, "flag_supervisor"));
									 if(stat.equals("S")){
									 scheme="show";
									 }
									 else{
									 scheme="hide";
									 }


									 %>
									 <tr>
										 <td ><%=i+1%></td>
										 <td ><%=studName.get(i)%></td>
										 <td ><%=matricNo.get(i)%></td>
										 <td ><%=status.get(i)%></td>
										 <td align="center"><span  onclick="viewStud('<%=matricNo.get(i)%>')" data-toggle="tooltip" title="View <%=studName.get(i)%> Details" data-placement="left"><i style="font-size:1.5em" class="fa fa-user"></i></span>
											 <span  class="<%=proClass%>" onclick="viewTitle('<%=matricNo.get(i)%>')"data-toggle="tooltip" title="Project Proposal : <%=proStatus.get(i)%>" data-placement="right" ><i style="color:<%=proColor%>;font-size:1.5em" class="fa fa-file-text"></i></span>
											 <span  class="<%=appClass%>" onclick="viewAppForm('<%=matricNo.get(i)%>')"data-toggle="tooltip" title="Application Status : <%=appStatus.get(i)%>" data-placement="right"><i style="color:<%=appColor%>;font-size:1.5em" class="fa fa-file-text-o"></i></span>
										 </td>
										 <%if(selectedPSM.equals("psm_1")){%>
											 <td align="center"><span class="<%=psm1Class%>" onclick="evaluate_psm1('<%=matricNo.get(i)%>')"title="Evaluation PSM 1" alt="Evaluation PSM 1" ><i style="font-size:1.5em" class="glyphicon glyphicon-list-alt"></i></span>&emsp;<span class="<%=scheme%>" ><span  class="btn btn-primary" onclick="submit('<%=matricNo.get(i)%>','<%=selectedSemester%>')">Submit</span></span></td>
											 <%}else{%>
												 <td align="center"><span onclick="evaluate_psm2('<%=matricNo.get(i)%>')"title="Evaluation PSM 2" alt="Evaluation PSM 2" ><i style="font-size:1.5em" class="glyphicon glyphicon-list-alt"></i></span></td>
												 <%}%>
													 </tr>
												 <%      }
													}
													else
													{%>
													 <tr >
														 <td colspan="6">There is no data selected from data base</td>
													 </tr>
													 <%      }%>
														 <%}%>
															 <input type="hidden" name="metric" value="">

															 <td colspan="6">
																 <%if(((!selectedPSM.equals(""))&&(!selectedSemester.equals("")))){%>
																	 <table cellpadding="0px" cellspacing="0px">
																		 <tr>
																			 <td><i style="font-size:1.5em;" class="fa fa-user"></i></td>
																			 <td style="line-height:24px;;">Student Details</td>
																		 </tr>

																		 <tr>
																			 <td><i style="font-size:1.5em" class="fa fa-file-text-o"></i></td>
																			 <td style="line-height:24px;">Application (Done)</td>
																			 <td><i style="color:#FF0000;font-size:1.5em" class="fa fa-file-text-o"></i></td>
																			 <td style="line-height:24px;">Application (Pending/Rejected)</td>
																		 </tr>

																		 <tr>
																			 <td><i style="font-size:1.5em" class="fa fa-file-text"></i></td>
																			 <td style="line-height:24px;">Project Status (Done)</td>
																			 <td><i style="color:#FF0000;font-size:1.5em" class="fa fa-file-text"></i></td>
																			 <td style="line-height:24px;">Project Status (Pending)</td>
																		 </tr>
																		 <tr>
																			 <td><i style="font-size:1.5em" class="glyphicon glyphicon-list-alt"></i></td>
																			 <td style="line-height:24px;">Evaluation (Done)</td>
																			 <td><i style="color:#FF0000;font-size:1.5em" class="glyphicon glyphicon-list-alt"></i></td>
																			 <td style="line-height:24px;">Evaluation (Pending)</td>
																		 </tr>
																	 </table>
																	 <%}%>
																		 </td>
																	 </table>
															 </form>

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
