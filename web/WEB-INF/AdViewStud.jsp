<%-- 
    Document   : AdViewStud
    Created on : Feb 4, 2009, 12:09:50 AM
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
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     int row = 0;
     String temp="";
     String disabled ="";
     String appURL="Images/Clipboard2.jpg";
     String detailURL="Images/User1.jpg";
     String delURL="Images/del_24_2.jpg";
     String color ="#fff0f5";
     String proURL="Images/project1.jpg";
     String proClass="proShow";
     String appClass="appShow";
     String colProStat="";
     String colAppStat="";
     String ev_psm_URL = "Images/evaluate";
     ArrayList proStatus = new ArrayList();
     ArrayList appStatus = new ArrayList();
     ArrayList studName = new ArrayList();
     ArrayList metricNo = new ArrayList();
     ArrayList semester = new ArrayList();
     if(selectedSemester==null)
         selectedSemester="";
     if(selectedPSM==null){
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
     
     if((!selectedPSM.equals(""))&&(!selectedSemester.equals(""))){
     String query="select studName, a.metricNo, b.status as Pro_Status, c.status as Apply_Status "+
                   "from student a "+
                   "inner join "+selectedPSM +" d on d.metricNo=a.metricNo "+
                   "left outer join title b on b.metricNo=a.metricNo "+
                   "left outer join engapply c on c.proID=b.proID "+
                   "where d.semester='"+selectedSemester+"'";
     
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
           studName.add(objDB.getDataAt(i,"studName"));
           metricNo.add(objDB.getDataAt(i,"metricNo"));
           proStatus.add(objDB.getDataAt(i,"Pro_Status"));
           appStatus.add(objDB.getDataAt(i,"Apply_Status"));
         }
     objDB.close();
     }
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css">     
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script>
            $(function () {
  $('[data-toggle="tooltip"]').tooltip()
  
    
})
        </script>
         <script>
             $(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
             </script>
        
       <script type="text/javascript" src="js/AdView.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
        
    </head>
    
  
    <body>
        
        <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    <form name="studentAcceptance">
    
    <div style="height:auto" id="WrapperBody">
        <center>
            <br><br>
            <div style="width:50%" class="panel panel-default">
  <div class="panel-heading" style="background: #FCF5CA;">
      <h2 style="font-weight:bold;color:#740f2d" class="panel-title">Select Student</h2>
  </div>
  <div class="panel-body alert-warning" style="background:white;">
                <span>
                    <table>
                        <tr>
                            <td><b>Bachelor Project</b></td>
                            <td width="5px"></td>
                            <td>
                                <select class="form-control" name="psm" onchange="choosePSM(this.value)">
                                    <option value="">Please Select</option>
                                    <option value="psm_1" <%if(selectedPSM.equals("psm_1")){%> selected <%}%> >Bachelor Project 1 (PSM1)</option>
                                    <option value="psm_2" <%if(selectedPSM.equals("psm_2")){%> selected <%}%> >Bachelor Project 2 (PSM2)</option>
                                </select>
                                <input type="hidden" name="selectPSM" value="">
                            </td>
                        </tr>
                        <tr><td><br></td></tr>
                        
                        <tr>
                            <td><b>Semester</b></td>
                            <td></td>
                            <td>
                                <select class="form-control" name="semester" onchange="chooseSemester(this.value)">
                                    <option value="">Please Select</option>
                                    <%for(int i=0;i<semester.size();i++){%>
                                    <option value="<%=semester.get(i)%>" <%if(semester.get(i).equals(selectedSemester)){%> selected<%}%> ><%=semester.get(i)%></option>
                                    <%}%>
                                </select>
                                <input type="hidden" name="selectSemester" value="">
                            </td>
                        </tr>
                        
                    </table>
  </div>
            </div>
                    <%if(((!selectedPSM.equals(""))&&(!selectedSemester.equals("")))){%>
                    <table id="expertise" class="table table-hover table-bordered"style="width:90%; background: #fff">
                        <tr style="font-weight:bold" align="center">
                             <td width="20px">No.</td>   
                             <td width="300px">Name</td>
                             <td width="100px">Info</td>
                             <td  width="50px">Delete</td>
                         </tr>
                       
                         <% 
                            if(row > 0)
                                {   for(int i=0;i<row;i++)
                                   {
                                       if(proStatus.get(i)==null)
                                           {
                                           proClass="hide";
                                           }
                                       else if(proStatus.get(i).equals("Pending"))
                                           {
                                            proURL="Images/Pproject";
                                            proClass="proShow";
                                            colProStat="#FF0000";
                                           }
                                       else if(!(proStatus.get(i).equals("Pending")))
                                           {
                                            proURL="Images/project";
                                            proClass="proShow";
                                           
                                           }
                                       if(appStatus.get(i)==null)
                                           {
                                                appClass="hide";
                                           }
                                       else if(appStatus.get(i).equals("Pending"))
                                          {
                                           appClass="appShow";
                                           appURL="Images/PClipboard";
                                           colAppStat="#FF0000";
                                          }
                                       else if(appStatus.get(i).equals("Rejected"))
                                          {
                                           appClass="appShow";
                                           appURL="Images/PClipboard";
                                           colAppStat="#FF0000";
                                          }
                                       else if(appStatus.get(i).equals("Approved"))
                                          {
                                           appClass="appShow";
                                           appURL="Images/PClipboard";
                                           colAppStat="#000";
                                          }
                                        else if(!(appStatus.get(i).equals("Pending")))
                                          {
                                            appClass="appShow";
                                            appURL="Images/Clipboard";
                                            
                                           
                                          }
                                       ev_psm_URL = "Images/evaluate";
                                       if(color.equals("#ffe4e1"))
                                            {
                                                color = "#ffb6c1";
                                                detailURL="Images/User2.jpg";
                                                proURL=proURL+"2.jpg";
                                                delURL="Images/del_24_1.jpg";
                                                appURL=appURL+"2.jpg";
                                                ev_psm_URL=ev_psm_URL+"2.jpg";
                                            }
                                         else
                                            {  
                                                color = "#ffe4e1";
                                                detailURL="Images/User1.jpg";
                                                proURL=proURL+"1.jpg";
                                                delURL="Images/del_24_2.jpg";
                                                appURL=appURL+"1.jpg";
                                                ev_psm_URL=ev_psm_URL+"1.jpg";
                                            }
                                        
                           %>
                           <tr align="center">
                           <td  align="center"><%=i+1%></td>
                           <td><%=studName.get(i)%></td>
                           <td><span  onclick="viewStud('<%=metricNo.get(i)%>')" data-toggle="tooltip" title="View <%=studName.get(i)%> Details" data-placement="left" ><i style="font-size:1.5em" class="fa fa-user"></i></span>
                               <span class="<%=proClass%>" onclick="viewStudTitle('<%=metricNo.get(i)%>')" data-toggle="tooltip" title="Project Prosposal : <%=proStatus.get(i)%> " data-placement="top" ><i style="font-size:1.5em;color:<%=colProStat%>" class="fa fa-file-text"></i></span>
                               <span class="<%=appClass%>" onclick="viewAppForm('<%=metricNo.get(i)%>')" data-toggle="tooltip" title="Application Form : <%=appStatus.get(i)%> " data-placement="right"><i style="font-size:1.5em;color:<%=colAppStat%>" class="fa fa-file-text-o"></i></span>                    
                          
                          </td>
                          <td align="center"><span onclick="deleteStud('<%=metricNo.get(i)%>','<%=studName.get(i)%>')"data-toggle="tooltip" title="Delete <%=studName.get(i)%> from database " data-placement="right" ><i style="font-size:1.5em" class="fa fa-remove"></i></span></td>
                        </tr>
                            <%      }
                              }
                            else
                                {%>
                        <tr>
                            <td colspan="4">There is no data selected from data base</td>
                        </tr>
                        <%     }%>
                        <input type="hidden" name="metricNo" value="">
                        <tr>
                            <td colspan="4">
                                <table cellpadding="0px" cellspacing="0px">
                                    <tr>
                                        <td><i style="font-size:1.5em" class="fa fa-user"></i></td>
                                        <td style="line-height:24px;">Student Details</td>
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
                                </table>
                            </td>
                        </tr>
                 </table>
                        
                 <%}%>
            </span>
                 
                
                    </center>
        
  
            <br><br><br><br><br><br><br>
   
       
<div id="Left">
        
         <br>
         <!--Main Menu-->
 
         <br>
         </div>
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
