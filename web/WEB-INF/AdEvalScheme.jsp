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
                        " where scheme_SecEvScheme='"+idselected+"'";
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
     if(totalSchememark==100){
         btnAddSection="<td><span class='btn btn-success' disabled='disabled' onclick='addtitlescheme()'>Add Data "+selectedscheme+"</span></td>";
         
     }
     else{
         btnAddSection="<td><span class='btn btn-success'  onclick='addtitlescheme()'>Add Data "+selectedscheme+"</span></td>";
         
     }
     objDB.close();
     goTo="scheme";
     }
     if((!selectedscheme.equals(""))&&(!idselected.equals(""))&&(!section.equals(""))&&(!sectionid.equals(""))){
     String query="select scheme_Sec_criID as CriteriaID,scheme_Sec_criDesc as CriteriaDesc from scheme_section_criteria"+
                  " where scheme_Sec_criEvScheme='"+idselected+"'"+
                    " and scheme_Sec_criSecCode='"+sectionid+"'";
                    
                   
     Test=query;
     
     objDB.connect();
     objDB.query(query);
     rowselectsection = objDB.getNumberOfRows();
     totalSectMark=5*rowselectsection;
     evalName=selectedscheme;
     if(rowselectsection==0){
         evalName=query;
     }
     for(int i=0;i<rowselectsection;i++)
         {
           criId.add(objDB.getDataAt(i,"CriteriaID"));
           criDesc.add(objDB.getDataAt(i, "CriteriaDesc"));
           
           
         }
     objDB.close();
     goTo="schemeandsection";
     }
     if((!editId.equals(""))){
         String query="select * from evaluationscheme where id="+editId+"";
         objDB.connect();
         objDB.query(query);
         rowselect = objDB.getNumberOfRows();
         for(int i=0;i<rowselect;i++)
         {
   
           editScheme=objDB.getDataAt(i,"ev_scheme");
         }
     objDB.close();
        edithide="show";
         
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
       
        <form name="evalScheme">
        <center>
            <br><br>
            
            <div style="width:85%" class="panel panel-default">
  <div class="panel-heading">
      <h2 style="color:#000" class="panel-title">Evaluation Scheme</h2>
  </div>
  <div class="panel-body alert-warning">
       <table  class="table table-bordered">
           <tr align="center">
                            <td>No</td>
                            <td>Evaluation Scheme</td>
                            <td>Evaluation Scheme Description</td>
                            <td>Date Created</td>
                            <td align="center">Generate</td>
                            <td>Edit</td>
                            <td>Delete</td>
                                 
                        </tr>
                    <% if(rowview>0){
                        for(int i=0;i<rowview;i++){
                            
                    %>
                    
                        
                    <tr align="center">
                            <td><%=(i+1)%></td> 
                            <td><span class="btn btn-link" onclick="<% if(flag.get(i).equals("Y")){%>viewGenScheme('<%=schemeName.get(i)%>','<%=idscheme.get(i)%>')<%}else{%>viewScheme('<%=schemeName.get(i)%>','<%=idscheme.get(i)%>')<%}%>"><%=schemeName.get(i)%></span></td>    
                            <td><%=schemeDesc.get(i)%></td> 
                            <td><%=dateCreated.get(i)%></td>
                            <td><%=btnGenerate.get(i)%></td>
                            <td><span onclick="editScheme('<%=idscheme.get(i)%>')"><i style="font-size:1.5em" class="glyphicon glyphicon-edit"></i></span></td>
                            <td><%if(flag.get(i).equals("Y")){%><span onclick=""><i style="font-size:1.5em" class="glyphicon glyphicon-remove"></i></span><%}else{%><span onclick="deletescheme('<%=schemeName.get(i)%>','<%=idscheme.get(i)%>')"><i style="font-size:1.5em" class="glyphicon glyphicon-remove"></i></span><%}%></td>
                        </tr>
                      
                       
                        <%}
                    }
                    else{%>
                    <tr>
                        <td colspan="5">No Result found!</td>      
                    </tr><%}
                    %>
                       
                        
                    </table>
                    <table>
                        <tr><td id="showaddscheme" class="show">
                                <span  class="btn btn-primary" onclick="showAddScheme()">Add Scheme</span></td>
                        </tr>
                    </table>
  </div>
            </div>
                    <br><br>
                    
                            <table style="width:50%">
                        <tr>
                            <td colspan="3" class="hide" id="itemAddScheme">
                                <br style="line-height:5px">
                                <br>
                                   
                                       
                                        <table class="table table-bordered">
                                            <tr bgcolor="#ebebeb" >
                                                <td colspan="4" align="center"><b>Add Scheme</td>
                                            </tr>
                                                 <tr>
                                                    <td>Title</td>
                                                   
                                                    <td colspan="3" align="left">
                                                        <input  class="form-control" type="text" name="addScheme" id="inputText"></input>
                                                    </td>
                                                 </tr>
                                                 <tr>
                                                    <td>Description</td>
                                                   
                                                    <td colspan="3" align="left">
                                                        <input  class="form-control" type="text" name="addSchemeDesc" id="inputText"></input>
                                                    </td>
                                                 </tr>
                                                 
                                        </table>
                                <table align="center">
                                    <tr align="center">
                                        <td align="center"><span class="btn btn-success" onclick="addScheme()">Add</span>&emsp;<span class="btn btn-warning" onclick="cancel()">Cancel</span></td>
                                    </tr>
                                </table></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="<%=edithide%>" id="itemEditScheme">
                                <br style="line-height:5px">
                                <br>
                                   
                                       
                                        <table class="table table-bordered">
                                            <tr bgcolor="#ebebeb" >
                                                <td colspan="4" align="center"><b>Edit Scheme</td>
                                            </tr>
                                                 <tr>
                                                    <td>Title</td>
                                                   
                                                    <td colspan="3" align="left">
                                                        <input  class="form-control" type="text" name="editScheme" id="inputText" value="<%=editScheme%>"></input>
                                                    </td>
                                                 </tr>
                                                 
                                        </table>
                                <table align="center">
                                    <tr align="center">
                                        <td align="center"><span class="btn btn-success" onclick="updateScheme()">Add</span>&emsp;<span class="btn btn-warning" onclick="canceleditscheme()">Cancel</span></td>
                                    </tr>
                                </table></td>
                        </tr>
                                
                            </table>
                    <br><br>
                    <table id="scheme" class="table table-bordered" style="width:80%">
                        
                    <%if((!selectedscheme.equals(""))&&(!idselected.equals(""))){
                        %>
                        <tr bgcolor="whitesmoke" rowspan="2">
                            <td  style="font-size:2em" colspan="5" align="center"><b class="text-capitalize"><%=selectedscheme%></td>
                            <td colspan="2" align="center"><b class="text-capitalize">Total Scheme Mark <%=totalSchememark%>/100</td>
                            <input type="hidden" id="mark" value="<%=totalSchememark%>">
                        </tr>
                        <tr>
                            <td>No</td>
                            <td>Section Code</td>
                            <td>Description</td>
                            <td>Role</td>
                            <td>Section Percentage(%)</td>
                            <td>Edit</td>
                            <td>Delete</td>
                        </tr>
                        
                        <%
                        
                        if(rowselect>0){
                            for(int i=0;i<rowselect;i++){
                                
                            
                    %>
                    <tr>
                    <td><%=(i+1)%></td>
                    <td><%=sectionCode.get(i)%></td>
                    <td><span class="btn btn-link" onclick="viewSection('<%=selectedscheme%>','<%=idselected%>','<%=sectionDesc.get(i)%>','<%=sectionCode.get(i)%>')"><%=sectionDesc.get(i)%></span></td>
                    <td><%if(sectionRole.get(i).equals("S")){%>Supervisor<%}else if(sectionRole.get(i).equals("SE1")){%>Supervisor~Examiner 1<%}else if(sectionRole.get(i).equals("E1E2")){%>Examiner 1~Examiner 2<%}else%><%=sectionRole.get(i)%></td>
                    <td><%=sectionMark.get(i)%></td>
                    <td><i style="font-size: 1.5em" onclick="" class="glyphicon glyphicon-edit"></i></td>
                    <td><i style="font-size: 1.5em" class="glyphicon glyphicon-remove"></i></td>
                    </tr>
                   
                    <%}
                        }
                        else{
                            %><tr><td colspan="7">No result found</td></tr></table>
                                
                    <%
                        } 
                      %>
                    <table>
                                <tr class="show" id="btnaddtitlescheme">
                                    <%=btnAddSection%>
                                </tr> 
                    <%
                        
                        
                    }%>
                    </table>
                    <br>
                    <center>
                        <table style="width:60%">
                            <tr>
                                <td id="addtitlescheme" class="hide">
                    <table class="table table-bordered">
                        <tr>
                            
                            <td>Section Code</td>
                            
                            <td colspan="3"><input id="addsectcode" type="text"  class="form-control" ></td>
                            
                            
                        </tr>
                        <tr>
                            
                            <td>Section Description</td>
                            
                            <td colspan="3"><input id="addsectdesc" type="text"  class="form-control" ></td>
                           
                            
                        </tr>
                        <tr>
                            
                            <td>Section Role</td>
                            
                            <td style="font-weight: bold" colspan="3"><input id="addsectrole" name="addsectrole" type="radio"   value="S">Supervisor&emsp;<input id="addsectrole" name="addsectrole" type="radio"   value="SE1" >Supervisor-Examiner&emsp;<input id="addsectrole" name="addsectrole" type="radio"   value="E1E2" >Examiner 1-Examiner 2</td>
                           
                            
                        </tr>
                        <tr>
                            
                            <td>Section Percentage</td>
                            
                            <td colspan="3"><input id="addsectmark" type="text"  class="form-control" ></td>
                           
                            
                        </tr>
                        </table>
                                    <table align="center">
                        <input type="hidden" name="selectedscheme" value="<%=selectedscheme%>"/>
                        <input type="hidden" name="selectedidscheme" value="<%=idselected%>"/>
                       
                        <tr class="hide" id="divtitlescheme" align="center">
                            <td colspan="3" align="center">
                                <span onclick="addsection()" class="btn btn-success">Submit</span>&emsp;<span class="btn btn-warning" onclick="cancel()">Cancel</span>
                            </td>
                            
                        
                         </table>
                        </tr>
                        </table>
                        <br><br>
                        <%if((!selectedscheme.equals(""))&&(!section.equals(""))&&(!sectionid.equals(""))){
                            %>
                            <table id="criteria" class="table table-bordered" style="width:60%">
                                <tr bgcolor="whitesmoke" style="font-size:1.5em" rowspan="2">
                            <td colspan="2" align="center"><b class="text-capitalize"><%=section%></td>
                            <td  colspan="2" align="center"><b class="text-capitalize">Total Section Mark : /<%=totalSectMark%></td>

                        </tr>
                                <tr>
                                    <td>No</td>
                                    <td>Criteria/Assessment</td>
                                    <td align="center">Edit</td>
                                    <td  align="center">Delete</td>
                                </tr>
                    <%
                    if(rowselectsection>0){
                            for(int i=0;i<rowselectsection;i++){
                                
                                %>
                                
                                <tr>
                                    <td><%=(i+1)%></td>
                                    <td><%=criDesc.get(i)%></td>
                                    <td  align="center"><i style="font-size: 1.5em" onclick="" class="glyphicon glyphicon-edit"></i></td>
                                    <td  align="center"><i style="font-size: 1.5em" onclick="comfirmdeletecriteria('<%=criId.get(i)%>','<%=criDesc.get(i)%>','<%=section%>')"  class="glyphicon glyphicon-remove"></i></td>
                                </tr>
                    
                    
                    <%}
                             
                            }
                    else{
                        %>
                        <tr><td colspan="4">No result Found
                            </td>
                        </tr>
                                
                                <%
                    }
                    %>
                            </table>
                            
                                <table>
                                <tr class="show" id="btnshowaddcrisection">
                                   <td><span class="btn btn-success"  onclick="showaddcrisection()">Add Criteria/Assessment <%=section%></span></td>
                                </tr> 
                        
                        <%
                            
                        }
                        
                        %>
                    </table>
                    <br><br>
                    <table style="width:60%">
                            <tr>
                                <td id="addcrisection" class="hide">
                    <table class="table table-bordered">
                        <tr>
                            
                            <td>Criteria/Assessment</td>
                            
                            <td colspan="3"><input id="addcriinput" type="text"  class="form-control" ></td>
                            
                            
                        </tr>
                        
                        </table>
                                    <table align="center">
                        <input type="hidden" name="selectedidschemesection" value="<%=idselected%>"/>
                        
                        <input type="hidden" name="selectedsection" value="<%=section%>"/>
                        <input type="hidden" name="selectedidsection" value="<%=sectionid%>"/>
                       
                        <tr class="hide" id="divcrischeme" align="center">
                            <td colspan="3" align="center">
                                <span onclick="addcriteria()" class="btn btn-success">Submit</span>&emsp;<span class="btn btn-warning" onclick="canceladdcrisection()">Cancel</span>
                            </td>
                            
                        
                         </table>
                        </tr>
                        </table>
               
 <input type="hidden" name="scheme" value="">
 <input type="hidden" name="selectedid" value="">
 <input type="hidden" name="section" value="">
 <input type="hidden" name="sectionid" value="">
 <input type="hidden" name="editidscheme" value="">
 
 
            
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
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }

%>
