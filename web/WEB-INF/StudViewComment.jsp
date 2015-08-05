<%-- 
    Document   : StudViewComment
    Created on : Apr 1, 2009, 8:58:13 PM
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
/*String query =  "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  h.ev_comment as pembentangan_psm1, "+
                "i.komen as penilaian_psm1, j.komen as penyeliaan, k.ev_comment as pembentangan_psm2, "+
                "l.komen as penilaian_psm2, m.komen as penyeliaan_psm2, n.komen as fasa1, o.komen as fasa2 ,q.lectName as Supervisor "+
                "from lec_ev_timetable a "+
                "inner join project_evaluation b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID "+
                "inner join supervisor p on p.metricNo=f.metricNo "+
                "inner join lecturer q on q.staffNo=p.staffNo "+
                "left outer join ev_pembentangan_psm1 h on h.metricNo=f.metricNo "+
                "left outer join ev_penilaian_psm1 i on i.metricNo=f.metricNo "+
                "left outer join supervision_marks_psm1 j on j.metricNo=f.metricNo "+
                "left outer join ev_pembentangan_psm2 k on k.metricNo=f.metricNo "+
                "left outer join ev_penilaian_psm2 l on l.metricNo=f.metricNo "+
                "left outer join supervision_marks_psm2 m on m.metricNo=f.metricNo "+
                "left outer join supervision_phase1_psm2 n on n.metricNo=f.metricNo "+
                "left outer join supervision_phase2_psm2 o on o.metricNo=f.metricNo "+
                "where f.metricNo='"+UserSession+"'";*/
String query = "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName, "+
                "h.ev_comment as pembentangan_psm1, "+
                "i.komen as penilaian_psm1, j.komen as penyeliaan, "+
                "q.lectName as Supervisor "+
                "from lec_ev_timetable a "+
                "inner join project_evaluation b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join psm_1 k on k.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID "+
                "inner join supervisor p on p.metricNo=f.metricNo "+
                "inner join lecturer q on q.staffNo=p.staffNo "+
                "left outer join ev_pembentangan_psm1 h on h.metricNo=f.metricNo "+
                "left outer join ev_penilaian_psm1 i on i.metricNo=f.metricNo "+
                "left outer join supervision_marks_psm1 j on j.metricNo=f.metricNo "+
                "where k.semester=a.semester and f.metricNo='"+UserSession+"'";
String query_psm2 = "select  a.slot, d.lectName as EV1_psm2, e.lectName as EV2_psm2 , f.studName, "+
                    "k.ev_comment as pembentangan_psm2, "+
                    "l.komen as penilaian_psm2, m.komen as penyeliaan_psm2, n.komen as fasa1, "+
                    "o.komen as fasa2 ,q.lectName as Supervisor_psm2 "+
                    "from lec_ev_timetable_psm2 a "+
                    "inner join project_evaluation_psm2 b on b.slot=a.slot "+
                    "inner join lecturer d on d.staffNo=a.ev1 "+
                    "inner join lecturer e on e.staffNo=a.ev2 "+
                    "inner join student f on f.metricNo=b.metricNo "+
                    "inner join psm_2 h on h.metricNo=f.metricNo "+
                    "inner join demo_room g on g.roomID=b.roomID "+
                    "inner join supervisor p on p.metricNo=f.metricNo "+
                    "inner join lecturer q on q.staffNo=p.staffNo "+
                    "left outer join ev_pembentangan_psm2 k on k.metricNo=f.metricNo "+
                    "left outer join ev_penilaian_psm2 l on l.metricNo=f.metricNo "+
                    "left outer join supervision_marks_psm2 m on m.metricNo=f.metricNo "+
                    "left outer join supervision_phase1_psm2 n on n.metricNo=f.metricNo "+
                    "left outer join supervision_phase2_psm2 o on o.metricNo=f.metricNo "+
                    "where h.semester=a.semester and f.metricNo='"+UserSession+"'";
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
String pembentangan = "";
     String penilaian =  "";
     String penyeliaan =  "";
     String pembentangan_psm2 =  "";
     String penilaian_psm2 =  "";
     String penyeliaan_psm2 =  "";
     String fasa1 =  "";
     String fasa2 =  "";
     String ev1= "";
     String ev2 =  "";
     String ev1_psm2= "";
     String ev2_psm2 =  "";
     String supervisor =  "";
     String supervisor_psm2 = "";
     int row_psm2;
     String studName="";
    String studuserID="";
    String studicNo="";
    String studemail="";
    String studphoneNo="";
 if ((!(UserSession==null))&&(UserType.equals("1"))) { 
 
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
    studuserID = objDB.getDataAt(0,"metricNo");
    studicNo = objDB.getDataAt(0,"icNo");
    studemail = objDB.getDataAt(0,"emailAdd");
    studphoneNo = objDB.getDataAt(0,"phoneNo");
     objDB.query(query);
      pembentangan = objDB.getDataAt(0, "pembentangan_psm1");
      penilaian = objDB.getDataAt(0, "penilaian_psm1");
      penyeliaan = objDB.getDataAt(0, "penyeliaan");
      ev1=objDB.getDataAt(0,"EV1");
      ev2 = objDB.getDataAt(0,"EV2");
      supervisor = objDB.getDataAt(0,"Supervisor");
     
     objDB.query(query_psm2);
     pembentangan_psm2 = objDB.getDataAt(0, "pembentangan_psm2");
     penilaian_psm2 = objDB.getDataAt(0, "penilaian_psm2");
     penyeliaan_psm2 = objDB.getDataAt(0, "penyeliaan_psm2");
     fasa1 = objDB.getDataAt(0, "fasa1");
     fasa2 = objDB.getDataAt(0, "fasa2");
     ev1=objDB.getDataAt(0,"EV1_psm2");
     ev2 = objDB.getDataAt(0,"EV2_psm2");
     supervisor_psm2 = objDB.getDataAt(0,"Supervisor_psm2");
     row_psm2 = objDB.getNumberOfRows();
     objDB.close();
     
     
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
         <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/StudViewComment.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
    
    
  
    <body>
       
      
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerstudent.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

    
    <div style="height:auto" id="WrapperBody" >
<center>
    <br><br>
     <form name="comments"> 
    <div style="width:600px" class="panel panel-default">
  <div class="panel-heading" style="background-color: #fcf5ca;">
      <h3  class="panel-title"><b style="color:#470f2d">Assessor Comments</b></h3>
  </div>
  <div class="panel-body ">
                        <table style="margin: auto;font-weight:bold;color:black;">
                            <tr align="left">
                                <td align="left">Bachelor Project&emsp;&emsp;&emsp;</td>
                                <td><select class="form-control" name="psm" onchange="showPSM()">
                                        <option value="">Please Select</option>
                                        <option value="psm1">Bachelor Project 1 (PSM1)</option>
                                        <option value="psm2" <%if(row_psm2==0){%> disabled <%}%>>Bachelor Project 2 (PSM2)</option>
                                       
                                </select></td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr id="psm1Comments" hidden>
                                <td>Evaluation Form (PSM1)&emsp;</td>
                                <td><select class="form-control" name="psm1" onchange="showComment()">
                                        <option value="">Please Select</option>
                                        <option value="penilaian">Main Assessor(Panel)</option>
                                        <option value="pembentangan">Second Assessor(Chairman)</option>
                                        <option value="penyeliaan">Supervisor</option>
                                </select></td>
                            </tr>
                            
                            <tr id="psm2Comments" class="hide">
                                <td>Evalution Form (PSM2)&emsp;</td>
                                <td><select class="form-control" name="psm2" onchange="showComment()">
                                        <option value="">Please Select</option>
                                        <option value="penilaian">Main Assessor(Panel)</option>
                                        <option value="pembentangan">Second Assessor(Chairman)</option>
                                        <option value="penyeliaan">Supervisor</option>
                                        <option value="fasa1">Phase 1 Evaluation</option>
                                        <option value="fasa2">Phase 2 Evaluation</option>
                                </select></td>
                            </tr>
                            
                        </table>
                  
                    <div id="penilaianItem" class="hide">
                    
                        <% if(!(penilaian==null)){%>
                        <fieldset id="titleSuggestion">
                        <legend>Main Assessor Evaluation Comment(PSM1)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Assessor</td>
                            <td><%=ev1%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=penilaian%></td>
                        </tr>
                        
                        </table>
                        </fieldset>
                    <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    
                    <div id="penilaian_psm2Item" class="hide">
                     <% if(!(penilaian_psm2==null)){%>
                    <fieldset id="titleSuggestion">
                       <legend>Main Assessor Evaluation Comment(PSM2)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Assessor</td>
                            <td><%=ev1_psm2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=penilaian_psm2%></td>
                        </tr>
                        </table>
                    </fieldset>
                    <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    
                    <div id="pembentanganItem" class="hide">
                    <% if(!(pembentangan==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Second Assessor Evaluation Comment(PSM1)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Assessor</td>
                            <td><%=ev2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=pembentangan%></td>
                        </tr>
                        
                        </table>
                    </fieldset>
                    <%} else {%>
                    <br><br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    
                    <div id="pembentangan_psm2Item" class="hide">
                        <% if(!(pembentangan_psm2==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Second Assessor Evaluation Comment(PSM2)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Assessor</td>
                            <td><%=ev2_psm2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=pembentangan_psm2%></td>
                        </tr>
                        
                        </table>
                    </fieldset>
                     <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    
                   <div id="penyeliaanItem" class="hide">
                        <% if(!(penyeliaan==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Supervisor Evaluation Comment (PSM1)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Supervisor</td>
                            <td><%=supervisor%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=penyeliaan%></td>
                        </tr>
                        </table>
                    </fieldset>
                    <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    
                    <div id="penyeliaan_psm2Item" class="hide">
                      <% if(!(penyeliaan_psm2==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Supervisor Evaluation Comment(PSM2)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Supervisor</td>
                            <td><%=supervisor_psm2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=penyeliaan_psm2%></td>
                        </tr>
                        
                        </table>
                    </fieldset>
                    <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    <div id="fasa1Item" class="hide">
                        <% if(!(fasa1==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Supervisor Phase 1 Evaluation Comment (PSM2)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Supervisor</td>
                            <td><%=supervisor_psm2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=fasa1%></td>
                        </tr>
                        
                        </table>
                    </fieldset>
                        <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
                    <div id="fasa2Item" class="hide">
                        <% if(!(fasa2==null)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Supervisor Phase 2 Evaluation Comment(PSM2)</legend>
                        <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr>
                            <td>Supervisor</td>
                            <td><%=supervisor_psm2%></td>
                        </tr>
                        <tr>
                            <td>Comment</td>
                            <td><%=fasa2%></td>
                        </tr>
                        
                        </table>
                        <div id="haha" hidden>Evaluation Form (PSM1)<br>
                                <select name="psm1" onchange="showComment()">
                                        <option value="">Please Select</option>
                                        <option value="penilaian">Main Assessor(Panel)</option>
                                        <option value="pembentangan">Second Assessor(Chairman)</option>
                                        <option value="penyeliaan">Supervisor</option>
                                </select></div>
                    </fieldset>
                        <%} else {%>
                        <br><h2>Comment not available</h2>
                        <%}%>
                    </div>
  </div>
    </div>
                    <br><br><br><br>
               
                     </center>
<div id="BodyContentStudent">
    <span>
   
  
        
        
                </span>
    
    
</div>
                               
                
        <div id="Left">
            <!-- Login As -->
       
         <br>
         <!--Main Menu-->
         
         <br>
         </div>
                <br><br><br>
</div>

         <br><br><br>
         <%@ include file="Footer.jsp" %>
         
         
</div> 
         
     
       
      
        </form>
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
