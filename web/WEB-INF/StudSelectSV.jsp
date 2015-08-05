<%-- 
    Document   : StudSelectSV
    Created on : Jan 25, 2009, 11:57:45 PM
    Author     : rou
    ----------------------------------------------------------------------------
    Date            Change                                 Author
    ----------------------------------------------------------------------------
    3/3/2009        Display lecturer expertise             Yihrou
                    with the quota.
    ----------------------------------------------------------------------------
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
String pagelimit=(String)request.getAttribute("pageid");
if(pagelimit==null){
    pagelimit="1";
}
int pagelimit2=Integer.parseInt(pagelimit);
int pagelimit3=(pagelimit2-1)*6;
String pagelimit4=String.valueOf(pagelimit3);

String queryExpertise ="select c.proField, a.description, b.lectName, a.staffNo "+
                        "from expertisefield a "+
                        "inner join lecturer b on b.staffNo=a.staffNo "+
                        "inner join projectfield c on c.ID=a.expertised "+
                        "order by b.lectName";

String queryGroup="SELECT b.lectName ,b.staffNo "+
                    "from expertisefield a "+
                    "inner join lecturer b on b.staffNo=a.staffNo "+
                    "where b.active='Active'"+
                    "group by a.staffNo order by b.lectName limit "+pagelimit4+",6";
String queryGroup2="SELECT b.lectName ,b.staffNo "+
                    "from expertisefield a "+
                    "inner join lecturer b on b.staffNo=a.staffNo "+
                    "where b.active='Active'"+
                    "group by a.staffNo order by b.lectName";

String querySv ="SELECT b.lectName, a.status, b.roomNo, b.emailAdd, b.phoneNo "+
                "from supervisor a "+
                "inner join lecturer b on b.staffNo=a.staffNo "+
                "inner join student c on c.metricNo=a.metricNo "+
                "where a.metricNo='"+UserSession+"'"; 
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";


String semester = Semester.getSemester();
String svQuota = "Select count(staffNo) as Quota from supervisor where semester='"+semester+"' and staffNo='";
String queryQuota ="select supervision from quota_lecturer where semester='"+semester+"'";

ArrayList proField = new ArrayList(); 
ArrayList staffNo = new ArrayList();
ArrayList lectName = new ArrayList();
ArrayList desc = new ArrayList();  
ArrayList grStaffNo = new ArrayList();
ArrayList grLectName = new ArrayList();


String svName = "";
String phone = "";
String email = "";
String roomNo = "";
String svStatus = "";

String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";



String color ="#fff0f5"; 
String temp ="";
            
int exRow =0;
int svRow =0;
int grRow =0;
int grRow2 =0;
int quotaOfLec =0;
int quotaOfSV =0;
int count=0;
DB objDB = new DB();
     

 if ((!(UserSession==null))&&(UserType.equals("1"))) {
     objDB.connect();
     
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
     studuserID = objDB.getDataAt(0,"metricNo");
     studicNo = objDB.getDataAt(0,"icNo");
     studemail = objDB.getDataAt(0,"emailAdd");
     studphoneNo = objDB.getDataAt(0,"phoneNo");
     
     objDB.query(querySv);
     svRow=objDB.getNumberOfRows();
     
     if(!(svRow==0)){
         svName = objDB.getDataAt(0,"lectName");
         svStatus = objDB.getDataAt(0,"status");
         phone = objDB.getDataAt(0,"phoneNo");
         email = objDB.getDataAt(0,"emailAdd");
         roomNo = objDB.getDataAt(0,"roomNo");
     }
     
     else{       
         objDB.query(queryQuota);
         temp=objDB.getDataAt(0, "supervision");
         quotaOfSV=Integer.parseInt(temp);
         
         objDB.query(queryExpertise);
         exRow=objDB.getNumberOfRows();
         for(int i=0;i<exRow;i++)
            {
                proField.add(objDB.getDataAt(i,"proField"));
                staffNo.add(objDB.getDataAt(i,"staffNo"));
                lectName.add(objDB.getDataAt(i,"lectName"));
                desc.add(objDB.getDataAt(i,"description"));
            }
         objDB.query(queryGroup2);
         grRow2=objDB.getNumberOfRows();
         objDB.query(queryGroup);
         grRow=objDB.getNumberOfRows();
         for(int i=0;i<grRow;i++)
             {
                grStaffNo.add(objDB.getDataAt(i, "staffNo"));
                grLectName.add(objDB.getDataAt(i, "lectName"));
             }
        
         
         for(int i=0;i<grRow;i++)
             {
                
                String str =svQuota+ grStaffNo.get(i)+"' ";
                objDB.query(str);
                temp=objDB.getDataAt(0,"Quota");
                quotaOfLec=Integer.parseInt(temp);
                if(quotaOfLec>=quotaOfSV)
                    {  
                        for(int j=0;j<exRow;j++)
                           {
                                if(grStaffNo.get(i).equals(staffNo.get(j)))
                                    {
                                        staffNo.set(j, "F");
                                        proField.set(j, "F");
                                        lectName.set(j, "F");
                                        desc.set(j, "F");
                                    }
                           }
                       grStaffNo.set(i, "F");
                       grLectName.set(i, "F");
                    }
             }
        }
     
    
                                   
     
     objDB.close();
     
    
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/StudSelectSV.js"></script>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
    <body>
    
       
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerstudent.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">


    
    <div style="height:auto" id="WrapperBody">
        
   <center>
                <% if(svRow==0){%>
                <h2 class="text-capitalize text-center">&emsp;&emsp;&emsp;Lecturer's Expertise</h2>
            
                <table style="width:80%;margin: auto;border-radius: 5px" id="expertise" class="table table-hover table-bordered">
                    <tr bgcolor="#5BC0DE" style="font-weight:bold;color:white" align="center">
                         <td width="150px">Lecturer's Name</td>
                         <td width="400px">Expertise</td>
                         <td width="100px">&nbsp;</td>
                    </tr>
                    <%  for(int i=0;i<grRow;i++){
                            
                          if(!grLectName.get(i).equals("F"))
                              { 
                                   
                        %>
                        <tr>
                                
                             <td><%=grLectName.get(i)%></td>
                                
                             <td>
                                 <table style="margin-left:0px;margin-top:0px;line-height:20px">
                                     <%for(int j=0;j<exRow;j++){
                                     if(grStaffNo.get(i).equals(staffNo.get(j))){
                                         %>
                                    <tr style="padding-top:5px">
                                         <td style="font-weight:bold"><%=proField.get(j)%></td>
                                     </tr>
                                     
                                     <tr style="padding-bottom:5px">
                                         <td><%=desc.get(j)%></td>
                                     </tr>
                                     <% }
                                     }%>
                                 </table>
                             </td>
                             
                             <td><button class="btn btn-success" onclick="SV('<%=grLectName.get(i)%>','<%=grStaffNo.get(i)%>')">Select&emsp;<i class="glyphicon glyphicon-ok"></i></button></td>
                        
                        </tr>
                        <% }
                        }%>
                        

                <input type="hidden" name="lecID" value="">
                <input type="hidden" name="lecName" value="">
                </table>
                <%}else{%>
                <br>
                <br>
                <div style="width:500px;margin:auto;" class="panel panel-default">
  <div class="panel-heading" style="background-color: whitesmoke">
      <h3  class="panel-title"><b>Supervisor Details</b></h3>
  </div>
  <div class="panel-body alert-warning">
     
                 
    <table border="0">

                        <tr>
                            <td id="text" width="200px" >Name</td>
                            <td id="colon">:</td>
                            <td align="left"><%=svName%></td>
                        </tr>
                        
                        <tr>
                            <td id="text" width="200px" >Phone Number</td>
                            <td id="colon">:</td>
                            <td  align="left"><%=phone%></td>
                        </tr>
                        
                        <tr>
                            <td id="text" width="200px" >Email Address</td>
                            <td id="colon">:</td>
                            <td  align="left"><%=email%></td>
                        </tr>

                        <tr>
                            <td id="text" width="200px"  >Status</td>
                            <td id="colon">:</td>
                            <td  align="left"><%=svStatus%></td>
                        </tr>
                        <% if(svStatus.equals("Rejected"))
                                {%>
                   
                                    <tr><td><br></td></tr>
                                    <tr><td colspan="3" align="center"><button class="btn btn-danger" onclick="reApply()">Apply Again&nbsp;&nbsp;<i class="glyphicon glyphicon-repeat"></i></button></td></tr>
                              

                               <% }%>
                        
                    </table>
      
  </div>
</div>
                <%}%>
               
              <form name="page">
         <ul class="pagination">
         <%
                if(grRow>0){
                    
                
                int total=(int)Math.ceil(grRow2/6)+1;
                if(pagelimit2==1){
                %>
                    <li class="disabled"><span>&laquo;</span></li>
             <%
                }
                else{
                    %>
                    <li><span  onclick="goToPage('<%=(pagelimit2-1)%>')">&laquo;</span></li>
                    <%
                }
                
                for(int i=1;i<=total;i++){
                    if(i==pagelimit2){
                        
                    
                %>
                  
                <li class="disabled"><span><b><%=i%></b></span></li>
                <%
                    }
                    else{%>
                
                <li><span  onclick="goToPage('<%=i%>')"><%=i%></span></li>
                <%
                        
                    }
                }
                if(pagelimit2==total){
                %>
                <li class="disabled"><span>&raquo;</span></li>
                <%
                }
                else{
                    %>
                 <li><span onclick="goToPage('<%=(pagelimit2+1)%>')">&raquo;</span></li>
                <%
                }
                }
         %>
         </ul>
         <input type="hidden" name="pageid" value="">
         </form>
            
               
               
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