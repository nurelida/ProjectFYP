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
String selectedscheme = (String)request.getAttribute("scheme");
String idselected = (String)request.getAttribute("selectedid");
String section = (String)request.getAttribute("section");
String sectionid = (String)request.getAttribute("sectionid");



String editId = (String)request.getAttribute("editidscheme");
String selectedSemester = (String)request.getAttribute("semester");
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     int rowview,rowselect= 0;
     int rowselectsection=0;
     String btnAddSection="";
     String btnAddCriteria="";
     String tempId="";
     String goTo="";
     String temp="";
     String disabled ="";
     String appURL="Images/Clipboard2.jpg";
     String detailURL="Images/User1.jpg";
     String delURL="Images/del_24_2.jpg";
     String color ="#fff0f5";
     String proURL="Images/project1.jpg";
     String proClass="proShow";
     String appClass="appShow";
     String sql="";
     String Test="";
     String evalName="";
     String edithide="";
     String ev_psm_URL = "Images/evaluate";
     String editScheme ="";
     ArrayList appStatus = new ArrayList();
     ArrayList idscheme = new ArrayList();
     ArrayList studName = new ArrayList();
     ArrayList titlescheme = new ArrayList();
     ArrayList semester = new ArrayList();
     ArrayList schemeName= new ArrayList();
     ArrayList schemeDesc= new ArrayList();
     ArrayList dateCreated= new ArrayList();
     ArrayList flag= new ArrayList();
     ArrayList btnGenerate= new ArrayList();
     ArrayList sectionCode = new ArrayList();
     ArrayList sectionDesc = new ArrayList();
     ArrayList sectionMark = new ArrayList();
     ArrayList sectionRole = new ArrayList();
     ArrayList criId=new ArrayList();
     ArrayList criDesc=new ArrayList();
     ArrayList sectMark=new ArrayList();
     ArrayList Testsql=new ArrayList();
     ArrayList rowspan=new ArrayList();
     int totalSectMark=0;
     int totalbtnCheck=0;
     
     int totalSchememark=0;
     if(selectedscheme==null){
        selectedscheme="";
     }
     if(idselected==null){
        idselected="";
     }
     if(editId==null){
        editId="";
        edithide="hide";
     }
     if(section==null){
        section="";
     }
     if(sectionid==null){
        sectionid="";
        
     }
    sql="select a.ev_scheme as schemeName, b."+selectedscheme+"Name as titleScheme "+"from evaluationscheme a "+"inner join "+selectedscheme +" b on b."+selectedscheme+"EvalScheme=a.id ";
     String evalScheme="SELECT * FROM evaluationscheme";
     objDB.connect();
     objDB.query(evalScheme);
     rowview=objDB.getNumberOfRows();
     for (int i=0;i<rowview;i++)
     {
         idscheme.add(objDB.getDataAt(i, "id"));
        schemeName.add(objDB.getDataAt(i,"ev_scheme"));
        schemeDesc.add(objDB.getDataAt(i,"ev_desc"));
        dateCreated.add(objDB.getDataAt(i,"dateCreated"));
        flag.add(objDB.getDataAt(i,"flag"));
        tempId=(String)objDB.getDataAt(i, "id");
        Testsql.add("select scheme_SecEvScheme,scheme_SecPercent from scheme_section where scheme_SecEvScheme='"+tempId+"' ");

     }
     objDB.close();
     objDB.connect();
     for(int i=0;i<rowview;i++){
        String tempSql=(String)Testsql.get(i);
       objDB.query(tempSql);
        for(int j=0;j<objDB.getNumberOfRows();j++){
            tempId=(String)objDB.getDataAt(j, "scheme_SecEvScheme");
            totalbtnCheck+=Integer.parseInt((String)objDB.getDataAt(j,"scheme_SecPercent"));
        }
        if(totalbtnCheck==100){
            if(flag.get(i).equals("Y")){
                btnGenerate.add("<span disabled='disabled' class='btn btn-success'>&nbsp;Generated&nbsp;</span");
            }
            else{
            btnGenerate.add("<span onclick='generateScheme("+tempId+")' class='btn btn-success'>&nbsp;&nbsp;Available&nbsp;&nbsp;</span");
            }
        }
        else{
            btnGenerate.add("<span class='btn btn-warning' disabled='disabled'>Unavailable</span>");
        }
       totalbtnCheck=0;
       tempId="";
         
     }
     objDB.close();
     
     if((!selectedscheme.equals(""))&&(!idselected.equals(""))){
//     String query="select b.scheme_SecCode as SecCode,b.scheme_SecDesc as SecDesc,b.scheme_SecRole as SecRole,b.scheme_SecPercent as SecPercentage "+
//                   " from evaluationscheme a "+
//                    "inner join scheme_section b on b.scheme_SecEvScheme=a.id "+
//                    "where b.scheme_SecEvScheme='"+idselected+"'";
         String query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idselected+"'"+
                        "order by scheme_SecCode ASC";
     Test=query;
     
     objDB.connect();
     objDB.query(query);
     rowselect = objDB.getNumberOfRows();
     evalName=selectedscheme;
     if(rowselect==0){
         evalName=query;
     }
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
     
     
//     if(totalSchememark==100){
//         btnAddSection="<td><span class='btn btn-success' disabled='disabled' onclick='addtitlescheme()'>Add Data "+selectedscheme+"</span></td>";
//         btnAddCriteria="<td><span class='btn btn-success' disabled='disabled' onclick='showaddcrisection()'>Add Criteria/Assessment "+section+"</span></td>";
//     }
//     else{
//         btnAddSection="<td><span class='btn btn-success'  onclick='addtitlescheme()'>Add Data "+selectedscheme+"</span></td>";
//         btnAddCriteria="<td><span class='btn btn-success'  onclick='showaddcrisection()'>Add Criteria/Assessment "+section+"</span></td>";
//     }
     
     goTo="scheme";
     }
    
     String stat="";
    
     
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
           var goTo="<%=goTo%>"; 
    if(goTo=="scheme"){
    $(function() { 
    $(window).scrollTop($('#scheme').offset().top);
});}
    if(goTo=="schemeandsection"){
    $(function() {
    $(window).scrollTop($('#criteria').offset().top);
});}

         </script>
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
        
       <script type="text/javascript" src="js/AdEvalScheme.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
        
    </head>
    
    
    <body>
        
        <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    
   
    <div style="height:auto" id="WrapperBody">
       <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span>
        
        <center>
            <br><br>
            <form name="evalScheme">
                <% stat="S";%>
                Supervisor
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
                   String query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
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
                    <td <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input type="radio"  id="<%=tempString%>"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input type="radio" id="<%=tempString%>" disabled="disabled"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <% 
                int temp3=Integer.parseInt((String)rowspan.get(i));
                
                for (int j=0;j<(temp3-1);j++){%>
                <tr >
                    
                    
                    <td  <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%> align="center">
                        <%=objDB.getDataAt((j+1),"scheme_Sec_criDesc")%>
                    </td>
                    <td <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&emsp;&emsp;&nbsp;&nbsp;&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input  id="<%=tempString%>" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input id="<%=tempString%>"  disabled="disabled" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <%}}%>
            </table>
            <br><br>
            <% stat="SE1"; %>
            Supervisor-Examiner 1
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
                   String query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
                   objDB.query(query);
                   String tempString=(String)sectionDesc.get(i);
                   String tempStringid= tempString.replaceAll("\\s+", "_");
                 %>   
                
                 <tr <%if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000" <%}else{%>style="background-color:#FFFFFF"<%}%>  align="center">
                    
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionCode.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <%=sectionDesc.get(i)%>
                    </td>
                    <td align="center" rowspan="<%=rowspan.get(i)%>">
                        <input id="<%=tempStringid%>_p"  <%if(!sectionRole.get(i).equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0" <%}else{%>style="width:30px;height: 20px;background-color: #fff"<%}%> type="text" name="" value="0" readonly >/<%=sectionMark.get(i)%>%
                    </td>
                    <td  align="center" rowspan="<%=rowspan.get(i)%>">
                       <input id="<%=tempStringid%>_m" <%if(!sectionRole.get(i).equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0" <%}else{%>style="width:30px;height: 20px;background-color: #fff"<%}%> name="" value="0" readonly >/<%=(temp4*5)%>
                    </td>
                    <td align="center">
                        <%if(objDB.getDataAt(0,"scheme_Sec_criDesc")==null){
                            %>No result found<%
                        }else{%>
                        <%=objDB.getDataAt(0,"scheme_Sec_criDesc")%>
                        <%}%>
                    </td>
                    <td <%if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000" <%}else{%>style="background-color:#FFFFFF"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)){%><input type="radio"  id="<%=tempString%>"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input type="radio" id="<%=tempString%>" disabled="disabled"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <% 
                int temp3=Integer.parseInt((String)rowspan.get(i));
                
                for (int j=0;j<(temp3-1);j++){%>
                <tr >
                    
                    
                    <td  <%if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000" <%}else{%>style="background-color:#FFFFFF"<%}%> align="center">
                        <%=objDB.getDataAt((j+1),"scheme_Sec_criDesc")%>
                    </td>
                    <td <%if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000" <%}else{%>style="background-color:#FFFFFF"<%}%>>&emsp;&emsp;&nbsp;&nbsp;&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                        %>&emsp;<%if(sectionRole.get(i).equals(stat)){%><input  id="<%=tempString%>" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input id="<%=tempString%>"  disabled="disabled" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <%}}%>
            </table>
            <br><br>
            <% stat="E1E2"; %>
            Examiner 1-Examiner 2
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
                   String query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idselected+"'";
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
                        <input id="<%=tempStringid%>_p" <%if(!sectionRole.get(i).equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0" <%}else{%>style="width:30px;height: 20px;background-color: #fff"<%}%> type="text" name="" value="0" readonly >/<%=sectionMark.get(i)%>%
                    </td>
                    <td  align="center" rowspan="<%=rowspan.get(i)%>">
                       <input id="<%=tempStringid%>_m" <%if(!sectionRole.get(i).equals(stat)){%>style="width:30px;height: 20px;background-color: #000;border: 0" <%}else{%>style="width:30px;height: 20px;background-color: #fff"<%}%> type="text" name="" value="0" readonly >/<%=(temp4*5)%>
                    </td>
                    <td align="center">
                        <%if(objDB.getDataAt(0,"scheme_Sec_criDesc")==null){
                            %>No result found<%
                        }else{%>
                        <%=objDB.getDataAt(0,"scheme_Sec_criDesc")%>
                        <%}%>
                    </td>
                    <td <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt(0,"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input type="radio"  id="<%=tempString%>"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input type="radio" id="<%=tempString%>" disabled="disabled"  name="<%=tempString%>" value="<%=k%>" onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <% 
                int temp3=Integer.parseInt((String)rowspan.get(i));
                
                for (int j=0;j<(temp3-1);j++){%>
                <tr >
                    
                    
                    <td  <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%> align="center">
                        <%=objDB.getDataAt((j+1),"scheme_Sec_criDesc")%>
                    </td>
                    <td <%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%>style="background-color:#ffffff" <%}else if(!sectionRole.get(i).equals(stat)){%>style="background-color:#000"<%}%>>&emsp;&emsp;&nbsp;&nbsp;&nbsp;<% for(int k=0;k<=5;k++){
                        tempString=objDB.getDataAt((j+1),"scheme_Sec_criDesc");
                        tempString= tempString.replaceAll("\\s+", "_");
                    %>&emsp;<%if(sectionRole.get(i).equals(stat)||sectionRole.get(i).equals("SE1")){%><input  id="<%=tempString%>" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}else{%><span style="background-color: #000"><input id="<%=tempString%>"  disabled="disabled" type="radio" name="<%=tempString%>" value="<%=k%>"   onmouseup="add('<%=tempStringid%>','<%=tempString%>','<%=k%>')">&nbsp;<%=k%><%}}%></td>
                </tr>
                <%}}%>
            </table>
           
 <input type="hidden" name="scheme" value="">
 <input type="hidden" name="selectedid" value="">
 
 
 
            
        </form>  
<div id="Left">
        
         <br>
         <!--Main Menu-->
         
         <br>
           
         <br>
         
        
         </div>
</div>

         <br><br><br>
         <%@ include file="Footer.jsp" %>
           
</div>
        
         </form>
    </body>
    </body>
    
</html>

<%
objDB.close();
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }

%>
