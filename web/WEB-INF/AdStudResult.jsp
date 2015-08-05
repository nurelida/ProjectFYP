<%-- 
    Document   : AdStudResult
    Created on : May 30, 2009, 4:47:48 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String selectedPSM = (String)request.getAttribute("psm");
String selectedSemester = (String)request.getAttribute("semester");
String color = "#fff0f5";
ArrayList studName = new ArrayList();
ArrayList metricNo = new ArrayList();
ArrayList grade = new ArrayList();
ArrayList svMarks = new ArrayList();
ArrayList cmMarks = new ArrayList();
ArrayList pnMarks = new ArrayList();
ArrayList phase1 = new ArrayList();
ArrayList phase2 = new ArrayList();
ArrayList semester = new ArrayList();
ArrayList gradePsm1 = new ArrayList();
ArrayList gradePsm2 = new ArrayList();
ArrayList semesterPSM2 = new ArrayList();
ArrayList sem = new ArrayList();

float tempPSM1 = 0;
float tempPSM2 =0;
int row = -1;
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
    if(selectedSemester==null)
         selectedSemester="";
     if(selectedPSM==null){
        selectedPSM="";
     }    
     else{
     String groupSemester = "SELECT semester FROM "+ selectedPSM +" group by semester";
     DB objDB = new DB();
     objDB.connect();
     objDB.query(groupSemester);
         for (int i =0;i<objDB.getNumberOfRows();i++)
         {
             semester.add(objDB.getDataAt(i, "semester"));
         }
     objDB.close();
     }
    String str ="";
    if((!selectedPSM.equals(""))&&(!selectedSemester.equals(""))){
        if(selectedPSM.equals("psm_1")){
        str = "select a.studName, a.metricNo, b.jumlah as Pembentangan, c.total as Penilaian, d.total as Penyeliaan ,f.semester as semesterPSM2 "+
                    "from student a "+
                    "inner join "+ selectedPSM +" e on e.metricNo=a.metricNo "+
                    "left outer join ev_pembentangan_psm1 b on b.metricNo=a.metricNo "+
                    "left outer join ev_penilaian_psm1 c on c.metricNo=a.metricNo "+
                    "left outer join supervision_marks_psm1 d on d.metricNo=a.metricNo "+
                    "left outer join psm_2 f on f.metricNo=a.metricNo "+
                    "where e.semester ='"+selectedSemester+"'";
                    
        DB objDB = new DB();
        objDB.connect();
        objDB.query(str);
        row=objDB.getNumberOfRows();
        for(int i=0;i<row;i++)
        {
            studName.add(objDB.getDataAt(i, "studName"));
            metricNo.add(objDB.getDataAt(i, "metricNo"));
            
            if(objDB.getDataAt(i,"Penyeliaan")==null)
                svMarks.add("-");
            else
                svMarks.add(objDB.getDataAt(i,"Penyeliaan"));
            
            if(objDB.getDataAt(i,"Pembentangan")==null)
                cmMarks.add("-");
            else
                cmMarks.add(objDB.getDataAt(i, "Pembentangan"));
            
            if(objDB.getDataAt(i, "Penilaian")==null)
                pnMarks.add("-");
            else
                pnMarks.add(objDB.getDataAt(i, "Penilaian")); 
            if(objDB.getDataAt(i,"semesterPSM2")==null)
                semesterPSM2.add("-");
             else
                semesterPSM2.add(objDB.getDataAt(i,"semesterPSM2"));
            
            if((!svMarks.get(i).equals("-"))&&(!cmMarks.get(i).equals("-"))&&(!pnMarks.get(i).equals("-")))
            {
            tempPSM1=Float.parseFloat(objDB.getDataAt(0,"Penilaian"))+Float.parseFloat(objDB.getDataAt(0,"Pembentangan"))+Float.parseFloat(objDB.getDataAt(0, "Penyeliaan"));
            gradePsm1.add(Common.checkGrade(tempPSM1));
            }
            else{
                gradePsm1.add("-");}
        }
            	String str1 = Semester.getSemester();
                for(int j=0;j<3;j++){
			if(j==0){
				sem.add(Semester.generateSem(str1));
			}
			else{
				String temp = sem.get(j-1).toString();
				sem.add(Semester.generateSem(temp));
			}
		}
        }
        else if(selectedPSM.equals("psm_2")){
        str = "select a.studName,a.metricNo, b.jumlah as pembentangan, c.total as penilaian, d.total as penyeliaan, e.total as fasa1, f.total as fasa2 "+
                "from student a "+
                "inner join psm_2 g on g.metricNo=a.metricNo "+
                "left outer join ev_pembentangan_psm2 b on a.metricNo=b.metricNo "+
                "left outer join ev_penilaian_psm2 c on a.metricNo=c.metricNo "+
                "left outer join supervision_marks_psm2 d on a.metricNo=d.metricNo "+
                "left outer join supervision_phase1_psm2 e on e.metricNo=a.metricNo "+
                "left outer join supervision_phase2_psm2 f on a.metricNo=f.metricNo "+
                "where g.semester ='"+selectedSemester+"'";
        DB objDB = new DB();
        objDB.connect();
        objDB.query(str);
        row=objDB.getNumberOfRows();
        for(int i=0;i<row;i++)
        {   studName.add(objDB.getDataAt(i, "studName"));
            metricNo.add(objDB.getDataAt(i, "metricNo"));
            if(objDB.getDataAt(i,"Penyeliaan")==null)
                svMarks.add("-");
            else
                svMarks.add(objDB.getDataAt(i,"Penyeliaan"));
            
            if(objDB.getDataAt(i, "Pembentangan")==null)
                cmMarks.add("-");
            else
                cmMarks.add(objDB.getDataAt(i, "Pembentangan"));
            
            if(objDB.getDataAt(i, "Penilaian")==null)
                pnMarks.add("-");
            else
                pnMarks.add(objDB.getDataAt(i, "Penilaian"));
            
            if(objDB.getDataAt(i, "fasa1")==null)
                phase1.add("-");
            else
                phase1.add(objDB.getDataAt(i, "fasa1"));
            
            if(objDB.getDataAt(i, "fasa2")==null)
                phase2.add("-");
            else
                phase2.add(objDB.getDataAt(i, "fasa2"));
            
           if(((!svMarks.get(i).equals("-"))&&(!cmMarks.get(i).equals("-"))&&(!pnMarks.get(i).equals("-"))&&(!phase1.get(i).equals("-"))&&(!phase2.get(i).equals("-")))) 
            {
                     tempPSM2= Float.parseFloat(objDB.getDataAt(0,"pembentangan"))+
                     Float.parseFloat(objDB.getDataAt(0,"penyeliaan"))+ 
                     Float.parseFloat(objDB.getDataAt(0,"penilaian"))+
                     (Float.parseFloat(objDB.getDataAt(0,"fasa1"))/15*5)+
                     (Float.parseFloat(objDB.getDataAt(0,"fasa2"))/15*10);
            gradePsm2.add(Common.checkGrade(tempPSM2));
            }
            else
            { gradePsm2.add("-");}
         }
        }
    }
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdStudResult.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
        
    </head>
    
  
    <body>
             
        <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         <form>   
   
    <div style="height:auto" id="WrapperBody">
        <br>

        <br><center>
      <div style="width:50%" class="panel panel-default">
  <div class="panel-heading" style="background: #fcf5ca;">
      <h2 style="color:#740f2d; font-weight:bold;" class="panel-title">Student Grade</h2>
  </div>
  <div class="panel-body ">
                <span>
					<table style="color:#740f2d;">
                        <tr >
                            <td><b>Bachelor Project</b></td>
                            <td>&nbsp;</td>
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
                            <td>&nbsp;</td>
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
                                <br>
                    <%if(((!selectedPSM.equals(""))&&(!selectedSemester.equals("")))){
                        if(selectedPSM.equals("psm_1")){ %>
                    <table class="table table-hover table-bordered"style="width:70%">
                        <tr style="background-color: #fff;font-weight:bold;vertical-align:bottom;text-align:center" >
                             <td valign="bottom" rowspan="2"  width="10px" >No.</td> 
                             <td rowspan="2"  width="250px">Name</td> 
                             <td colspan="3"  >Evaluation Marks</td> 
                             <td rowspan="2"   >Grade</td>
                             <td >Action</td>
                        </tr>
                        <tr style="background-color: #fff;font-weight:bold;text-align:center">
                             <td>Chairman</td>
                             <td>Panel</td>
                             <td>Supervisor</td>
                             <td>Semester</td>
                        </tr>
                        <%
                        if(row>0){
                            for(int i=0;i<row;i++){
                            
                        
                        %>
                        <tr bgcolor="white">
                            <td><%=i+1%></td>
                            <td><%=studName.get(i)%></td>
                            <td><%=cmMarks.get(i)%></td>
                            <td><%=pnMarks.get(i)%></td>
                            <td><%=svMarks.get(i)%></td>
                            <td><%=gradePsm1.get(i)%></td>
                            <td>
                                <select class="form-control" name="sem" onchange="moveToPSM2(this.value,'<%=metricNo.get(i)%>','<%=studName.get(i)%>')" <%if(gradePsm1.get(i).equals("-")){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <%for(int j=0;j<sem.size();j++){%>
                                    <option value="<%=sem.get(j)%>" <%if(sem.get(j).equals(semesterPSM2.get(i))){%> selected <%}%> ><%=sem.get(j)%></option>
                                    <%}%>
                                </select>
                                
                            </td>
                            
                        </tr>
                        
                        <%}
                        } else{%>
                        <tr>
                            <td colspan="6">There was no data selected from data base.</td>
                        </tr>
                        <%}%>
                    </table>
                    <%}else if(selectedPSM.equals("psm_2")){%>
                     <table>
						 <tr style="background:#fcf5ca;font-weight:bold; color: #740f2d;" align="center">
                             <td rowspan="2"  width="20px">No.</td>   
                             <td rowspan="2"  width="250px">Name</td>
                             <td  colspan="5">Evaluation Marks</td>
                             <td rowspan="2" >Grade</td>
                         </tr>
                        <tr style="background:#fcf5ca;font-weight:bold; color: #740f2d;" align="center">
                             <td width="50px">Chairman</td>
                             <td  width="50px">Panel</td>
                             <td width="60px">Phase 1</td>
                             <td  width="60px">Phase 2</td>
                             <td  width="50px">Supervisor</td>
                        </tr>
                        <%
                        if(row>0){
                            for(int i=0;i<row;i++){
                          if(color.equals("#ffe4e1"))
                            color = "#ffb6c1";
                          else
                            color ="#ffe4e1";  
                        
                        %>
                    <tr>
                            <td bgcolor="<%=color%>"><%=i+1%></td>
                            <td bgcolor="<%=color%>"><%=studName.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=cmMarks.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=pnMarks.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=phase1.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=phase2.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=svMarks.get(i)%></td>
                            <td bgcolor="<%=color%>"><%=gradePsm2.get(i)%></td>
                    </tr>
                    <%}}else {%>
                    <tr>
                        <td colspan="8">There was no data selected from data base.</td>
                    </tr>
                    <%}%>
                    </table>   
                    <%}}%>
                </span>
               <input type="hidden" name="psm2_semester" value="">
               <input type="hidden" name="psm2_metric" value=""> 
          
        </center>
        <br><br><br><br>
        


                
        <div id="Left">
        
         <br>
         <!--Main Menu-->
    
         <br>
         </div>
</div>

         <br><br><br>
         <%@ include file="Footer.jsp" %>
     </form>     
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
