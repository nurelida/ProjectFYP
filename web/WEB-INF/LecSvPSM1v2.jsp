<%-- 
    Document   : LecSvPSM1v2
    Created on : Feb 10, 2015, 11:00:53 AM
    Author     : Asus
--%>

<%@page import="FYPManagementSys_Bean.Semester"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String metricNo = request.getParameter("metric");
String flagSupervisor="";
String idselected = (String)request.getAttribute("selectedid");
String proTitle = "";
String gantt = "";
String kebolehan = "";
String daya = "";
String kekerapan = "";
String peningkatan = "";
String keberkesanan = "";
String peranan = "";
String formet = "";
String abstrak = "";
String objektif = "";
String analisis = "";
String kajian = "";
String metodologi = "";
String kesimpulan = "";
String rujukan = "";
String lampiran = "";
String persembahan = "";
String ayat = "";
String gambarajah = "";
String total = "";
String comment = null;
String proType="";
String studName="";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";
String tempScheme="";
String valueofcriteria="";
ArrayList parameterToEnable=new ArrayList();


int totalSchememark=0;

ArrayList evId=new ArrayList();
ArrayList evName=new ArrayList();
ArrayList evDesc=new ArrayList();
ArrayList sectionCode=new ArrayList();
ArrayList sectionDesc=new ArrayList();
ArrayList sectionMark=new ArrayList();
ArrayList sectionRole=new ArrayList();
ArrayList rowspan =new ArrayList ();
int rowselect=0;
if(idselected==null){
    idselected="";
}
String query = "select a.proTitle,a.proType, b.gantt, b.kebolehan, b.daya, b.kekerapan, b.peningkatan, b.keberkesanan, b.peranan, "+
                "b.formet, b.abstrak, b.objektif, b.analisis, b.kajian, b.metodologi, b.kesimpulan, b.rujukan, b.lampiran, "+
                "b.persembahan, b.ayat, b.gambarajah, b.total, b.komen, c.studName "+
                "from title a "+
                "inner join student c on c.metricNo=a.metricNo "+
                "left outer join supervision_marks_psm1 b on a.metricNo=b.metricNo "+
                "where a.metricNo='"+metricNo+"'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";

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
     studName = objDB.getDataAt(0, "studName");
     proType =objDB.getDataAt(0, "proType");
     
        String tempstat="";
        String stat="";
        query="select staffNo,metricNo,status from supervisor where staffNo='"+UserSession+"' and metricNo='"+metricNo+"'";
        objDB.query(query);
        tempstat=(String)objDB.getDataAt(0, "status");
        if(tempstat.equals("Approved")){
            stat="S";
        }
        query="select id,ev_scheme,ev_desc,flag from evaluationscheme where flag='Y'";
        objDB.query(query);
        int rowscheme=objDB.getNumberOfRows();
        for(int i=0;i<rowscheme;i++){
            evId.add(objDB.getDataAt(i, "id"));
            evName.add(objDB.getDataAt(i, "ev_scheme"));
            evDesc.add(objDB.getDataAt(i, "ev_desc"));
        }
      String dept="";
      String sem="";
      query="select * from student where metricNo='"+metricNo+"'";
      objDB.query(query);
      for(int i=0;i<objDB.getNumberOfRows();i++){
          dept=String.valueOf(objDB.getDataAt(0, "department"));
          sem=String.valueOf(objDB.getDataAt(0, "semester"));
      }
      query="select deptName from department where deptCode='"+dept+"'";
      objDB.query(query);
      for(int i=0;i<objDB.getNumberOfRows();i++){
          dept=String.valueOf(objDB.getDataAt(0, "deptName"));
      }
      dept= dept.replaceAll("\\s+", "");
      dept+="_"+proType;
      
      query="select "+dept+" from quota_lecturer where semester='"+sem+"'";
      
      objDB.query(query);
      for(int i=0;i<objDB.getNumberOfRows();i++){
          tempScheme=String.valueOf(objDB.getDataAt(0, dept));
      }
      String schemename=tempScheme;
      query="select id from evaluationscheme where ev_scheme='"+tempScheme+"'";
      objDB.query(query);
      for(int i=0;i<objDB.getNumberOfRows();i++){
          tempScheme=String.valueOf(objDB.getDataAt(0, "id"));
      }
      idselected=tempScheme;
      
      query="select * from evaluator where metricNo='"+metricNo+"' ";
      objDB.query(query);
      flagSupervisor=String.valueOf(objDB.getDataAt(0, "flag_supervisor"));
    
      
      if((!idselected.equals(""))){

         query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idselected+"'"+
                        "and scheme_SecRole like '"+stat+"%'"+
                       
                        "order by scheme_SecCode ASC";
    
     
     
     objDB.query(query);
     rowselect = objDB.getNumberOfRows();
  
     for(int i=0;i<rowselect;i++)
         {
           sectionCode.add(objDB.getDataAt(i,"SecCode"));
           sectionDesc.add(objDB.getDataAt(i, "SecDesc"));
           sectionMark.add(objDB.getDataAt(i, "SecPercentage"));
           sectionRole.add(objDB.getDataAt(i, "SecRole"));
           //String tempString = (String) objDB.getDataAt(i,"sectMark");
           //totalSchememark=(Integer)tempString;
           totalSchememark+=Integer.parseInt((String)objDB.getDataAt(i,"SecPercentage"));
           //totalSchememark = (int)objDB.getDataAt(i, "sectCode");
           
           
         }
     for(int i=0;i<rowselect;i++){
         String temp2=(String)sectionCode.get(i);
         query="select count(*) from scheme_section_criteria where scheme_Sec_criEvScheme='"+idselected+"' and scheme_Sec_criSecCode='"+temp2+"'";
         objDB.query(query);
         rowspan.add(objDB.getDataAt(0,"count(*)"));
     }
      }
      
    
            
     
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/LecSvPSM1v2.js"></script>
        <script src="js/jquery.min.js"></script>
     

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
         
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
            
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    

    <div style="height:auto" id="WrapperBody">
         <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span> 
     <br> 
                     <center>
                     
      <form name="evalScheme" >
          <a class="btn">Page Testing</a>
          <%if(rowselect!=0&&flagSupervisor.equals("N")){%>
          
       <table class="table table-bordered" style="width:85%">
                <tr align="center">
                    <td>
                        Code
                    </td>
                    <td>
                        Section
                    </td>
                    <td>
                        Section Percentage
                    </td>
                    <td>
                        Section Mark
                    </td>
                    <td>
                        Criteria/Assessment
                    </td>
                    <td>
                       Marks 
                    </td>
                </tr>
                <% 
                for(int i=0;i<rowselect;i++){
                    int temp4=Integer.parseInt((String)rowspan.get(i));
                    String code=(String)sectionCode.get(i);
                   query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
                   
                   objDB.query(query);
                   String tempString=(String)sectionDesc.get(i);
                   String tempStringid= tempString.replaceAll("\\s+", "_");
                 %>   
                
                 <tr <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>  align="center">
                    
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionCode.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionDesc.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <input id="<%=tempStringid%>_p" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="width:30px;height: 20px;background-color: #ffffff" <%}else if(!sectionRole.equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0"<%}%> type="text" name="" value="0" readonly >/<%=sectionMark.get(i)%>%
                    </td>
                    <td  align="center" rowspan="<%=rowspan.get(i)%>">
                        <input id="<%=tempStringid%>_m" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="width:30px;height: 20px;background-color: #ffffff" <%}else if(!sectionRole.equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0"<%}%> type="text" name="" value="0" readonly >/<%=(temp4*5)%>
                    </td>
                    <td align="center">
                        <%if(objDB.getDataAt(0,"scheme_Sec_criDesc")==null){
                            %>No result found<%
                        }else{%>
                        <%=objDB.getDataAt(0,"scheme_Sec_criDesc")%>
                        <%}%>
                    </td>
                    <td  align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                        tempString+="_"+sectionCode.get(i);
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input type="radio"  id="<%=tempString%>"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>','<%=sectionMark.get(i)%>','<%=(temp4*5)%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input type="radio" id="<%=tempString%>" disabled="disabled"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <% 
                int temp3=Integer.parseInt((String)rowspan.get(i));
                
                for (int j=0;j<(temp3-1);j++){%>
                <tr align="center" >
                    
                    
                    <td align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%> align="center">
                        <%=objDB.getDataAt((j+1),"scheme_Sec_criDesc")%>
                    </td>
                    <td align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                        tempString+="_"+sectionCode.get(i);
                        %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input  id="<%=tempString%>" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>','<%=sectionMark.get(i)%>','<%=(temp4*5)%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input id="<%=tempString%>"  disabled="disabled" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <%}}%>
            </table>
            <br>
                <table>
                    <tr>
                        <td>
                            <span class="btn btn-success" onclick="save()">&emsp;Save&emsp;</span>
                        </td>
                        
                        
                    </tr>
                </table>
                <%}else if(rowselect!=0&&(flagSupervisor.equals("S")||flagSupervisor.equals("Y"))){%>
                <table  class="table table-bordered" style="width:85%">
                <tr align="center">
                    <td>
                        Code
                    </td>
                    <td>
                        Section
                    </td>
                    <td>
                        Section Percentage
                    </td>
                    <td>
                        Section Mark
                    </td>
                    <td>
                        Criteria/Assessment
                    </td>
                    <td>
                       Marks 
                    </td>
                </tr>
                <% 
                for(int i=0;i<rowselect;i++){
                    int temp4=Integer.parseInt((String)rowspan.get(i));
                    String code=(String)sectionCode.get(i);
                   query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
                   String tempString2="";
                   objDB.query(query);
                   String tempString=(String)sectionDesc.get(i);
                   String tempStringid= tempString.replaceAll("\\s+", "_");
                 %>   
                
                 <tr <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>  align="center">
                    
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionCode.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionDesc.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <input id="<%=tempStringid%>_p" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="width:30px;height: 20px;background-color: #ffffff" <%}else if(!sectionRole.equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0"<%}%> type="text" name="" value="0" readonly >/<%=sectionMark.get(i)%>%
                    </td>
                    <td  align="center" rowspan="<%=rowspan.get(i)%>">
                        <input id="<%=tempStringid%>_m" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="width:30px;height: 20px;background-color: #ffffff" <%}else if(!sectionRole.equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0"<%}%> type="text" name="" value="0" readonly >/<%=(temp4*5)%>
                    </td>
                    <td align="center">
                        <%if(objDB.getDataAt(0,"scheme_Sec_criDesc")==null){
                            %>No result found<%
                        }else{%>
                        <%=objDB.getDataAt(0,"scheme_Sec_criDesc")%>
                        <%
                        
                        }
                        tempString2=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString2= tempString2.replaceAll("\\s+", "_");
                        tempString2+="_"+sectionCode.get(i);
                        parameterToEnable.add(tempString2);
                        %>
                    </td>
                    <td align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                        tempString+="_"+sectionCode.get(i);
                        String queryvalue="select "+tempString+" from "+schemename+" where metricNo='"+metricNo+"'";
                        objDB.query(queryvalue);
                        valueofcriteria=objDB.getDataAt(0, tempString);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
                        objDB.query(query);
                        %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input <%if(valueofcriteria.equals(String.valueOf(k))){%>checked<%}%> disabled type="radio"  id="<%=tempString%>"  name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input type="radio" id="<%=tempString%>" disabled="disabled"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <% 
                int temp3=Integer.parseInt((String)rowspan.get(i));
                
                for (int j=0;j<(temp3-1);j++){%>
                <tr align="center">
                    
                    
                    <td align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%> align="center">
                        <%=objDB.getDataAt((j+1),"scheme_Sec_criDesc")%>
                        <%
                        tempString2=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString2= tempString2.replaceAll("\\s+", "_");
                        tempString2+="_"+sectionCode.get(i);
                        parameterToEnable.add(tempString2);%>
                    </td>
                    <td align="center" <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                        tempString+="_"+sectionCode.get(i);
                        String queryvalue="select "+tempString+" from "+schemename+" where metricNo='"+metricNo+"'";
                        objDB.query(queryvalue);
                        valueofcriteria=objDB.getDataAt(0, tempString);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
                        objDB.query(query);
                        %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input  <%if(valueofcriteria.equals(String.valueOf(k))){%>checked<%}%>  disabled  id="<%=tempString%>" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input id="<%=tempString%>"  disabled="disabled" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <%}}%>
            </table>
                <br>
                <table>
                  
                    <tr>
                        <td id="tdbtnedit" class="show">
                            <span style="width:100px" <%if(flagSupervisor.equals("Y")){%>disabled="disabled"<%}%> class="btn btn-success" onclick="enableEdit()">&emsp;Edit&emsp;</span>
                        </td>
                        <td id="tdbtnsave" class="hide">
                            <span  class="btn btn-success" onclick="update()">&emsp;Save&emsp;</span>
                        </td>
                        
                        
                    </tr>
                </table>
     
 <%}%>
                <input type="hidden" name="stat" value="<%=stat%>">
                <input type="hidden" name="metricNo" value="<%=metricNo%>">
                <input type="hidden" name="scheme" value="<%=idselected%>">
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
<script>
      function enableEdit(){
         var f=document.evalScheme;
         document.getElementById("tdbtnsave").classList.remove("hide");
         document.getElementById("tdbtnsave").classList.add("show");
         document.getElementById("tdbtnedit").classList.remove("show");
         document.getElementById("tdbtnedit").classList.add("hide");
         <%for(int i=0;i<parameterToEnable.size();i++){
             %>
                     for(var j=0;j<=5;j++){
                     f.<%=parameterToEnable.get(i)%>[j].disabled=false; 
                    }
             <%
         }
         %>
         
      }
</script>
    
     
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
