<%-- 
    Document   : LecEvaluation_Panel
    Created on : Mar 21, 2009, 2:16:35 AM
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
String metricNo = request.getParameter("metricNo");

String matlamat = "";
String kajian = "";
String perancangan = "";
String pengumpulan = "";
String teknik = "";
String rekabentuk = "";
String perkakasan = "";
String hasil = "";
String rujukan = "";
String lampiran ="";
String laporan = "";
String komen = "";

float matlamat_m = -1;
float kajian_m = -1;
float perancangan_m = -1;
float pengumpulan_m = -1;
float teknik_m = -1;
float rekabentuk_m = -1;
float perkakasan_m = -1;
float hasil_m = -1;
float rujukan_m = -1;
float lampiran_m = -1;
float laporan_m = -1;
float komen_m = -1;

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query("select proTitle, b.studName, c.matlamat, c.kajian, "+
                "c.perancangan, c.pengumpulan, c.teknik, c.rekabentuk, c.perkakasan, c.hasil,"+
                "c.rujukan, c.lampiran, c.laporan, c.total,c.komen "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "left outer join ev_penilaian_psm1 c on c.metricNo=a.metricNo "+
                "where a.metricNo='"+metricNo+"'");
     String proTitle = objDB.getDataAt(0, "proTitle");
     String studName = objDB.getDataAt(0,"studName");
     String total = objDB.getDataAt(0,"total");
     if(!(total==null))
         {
          
          matlamat = objDB.getDataAt(0,"matlamat");
          matlamat_m = Float.parseFloat(matlamat)*10/2; 
          kajian = objDB.getDataAt(0,"kajian");
          kajian_m = Float.parseFloat(kajian)*10/3;
          perancangan = objDB.getDataAt(0,"perancangan");
          perancangan_m = Float.parseFloat(perancangan)*10/1;
          pengumpulan = objDB.getDataAt(0,"pengumpulan");
          pengumpulan_m = Float.parseFloat(pengumpulan)*10/2;
          teknik = objDB.getDataAt(0,"teknik");
          teknik_m = Float.parseFloat(teknik)*10/3;
          rekabentuk = objDB.getDataAt(0,"rekabentuk");
          rekabentuk_m = Float.parseFloat(rekabentuk)*10/5;
          perkakasan = objDB.getDataAt(0,"perkakasan");
          perkakasan_m = Float.parseFloat(perkakasan)*10/2;
          hasil = objDB.getDataAt(0,"hasil");
          hasil_m = Float.parseFloat(hasil)*10/3;
          rujukan = objDB.getDataAt(0,"rujukan");
          rujukan_m = Float.parseFloat(rujukan)*10/1;
          lampiran = objDB.getDataAt(0,"lampiran");
          lampiran_m = Float.parseFloat(lampiran)*10/1;
          laporan = objDB.getDataAt(0,"laporan");
          laporan_m = Float.parseFloat(laporan)*10/2;
          komen = objDB.getDataAt(0,"komen");
     }
     objDB.close();
   
%>
<html>

     <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/LecEvaluation_Panel.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .editShow,
    .saveChangesShow{
            display: ;
    }
    .editHide,
    .saveChangesHide{
            display:none;
    }
</style>
    
  
    <body>
       
      
      <div id="Wrapper" style="padding-top:50px">
         
		  <img src="Images/headerbg3.png" alt="" class="home-img">

          <div id="Top">
            <div id="TopContent">
                
            </div>
        </div> 
         <div id="BodyContent">
             <form>
				 <h2 style="font-weight:bold; color:#FCF5CA;">Main Asscessor(Panel)PSM 1 </h2>
                     <center>
                    
                    <fieldset id="titleSuggestion">
                        <legend>Evaluation form</legend>
                        <center>
                            <table >
                                <tr>
                                    <td id="text" width="200px" >Name</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Metric No.</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=metricNo%></td>
                                    <input type="hidden" value="<%=metricNo%>" name="metricNo">
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Project title</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=proTitle%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Comment</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><textarea cols="30" rows="10" id="inputText" name="comment"<%if(!(total==null)){%> readonly <%}%> ><%if(!(total==null)){%> <%=komen%><%}%></textarea></td>
                                </tr>
                             </table>
                             
                             <table style="font-weight:bold;text-align:left">
                                 <tr>
                                     <td colspan="6">Skala Penilaian</td>
                                 </tr>
                                <tr>
                                    <td>Tidak Memuaskan</td>
                                    <td>0-2</td>

                                    <td>Kurang Memuaskan</td>
                                    <td>3-4</td>

                                    <td>Sederhana</td>
                                    <td>5-6</td>
                               </tr>
                               <tr>
                                    <td>Memuaskan</td>
                                    <td>7-8</td>

                                    <td>Sangat Memuaskan</td>
                                    <td>9-10</td>
                               </tr>
                            </table>
                     
                            <table style="text-align:left">
                                <tr bgcolor="#fa8072" style="font-weight:bold;text-align:center">
                                    <td width="10px">No.</td>
                                    <td width="300px">Item Penilaian</td>
                                    <td width="110px">Paras Penilaian</td>
                                    <td width="100px">Markah</td>
                                </tr>
                                <tr bgcolor="#ffe4e1" style="font-weight:bold">
                                    <td>1.</td>
                                    <td colspan="3">Kajian 6%</td>
                                </tr>
                                <tr bgcolor="#ffe4e1">
                                    <td>&nbsp;</td>
                                    <td>Matlamat dan objektif projek yang bersesuaian &nbsp;(2%)</td>
                                    
                                    <td><select  name="matlamat" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==matlamat_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    
                                    <td><input style="width:50px" type="text" name="matlamat_m" readonly <%if(!(total==null)){%> value="<%=matlamat%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffe4e1">
                                    <td>&nbsp;</td>
                                    <td>Kajian latarbelakang dan kajian literatur yang mencukupi &nbsp;(3%)</td>
                                    
                                    <td><select name="kajian" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==kajian_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    
                                    <td><input style="width:50px" type="text" name="kajian_m" readonly <%if(!(total==null)){%> value="<%=kajian%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffe4e1">
                                    <td>&nbsp;</td>
                                    <td>Perancangan projek yang betul&nbsp;(1%)<%=perancangan_m%></td>
                                    
                                    <td><select name="perancangan" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==perancangan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                   
                                    <td><input style="width:50px" type="text" name="perancangan_m" readonly <%if(!(total==null)){%> value="<%=perancangan%>"<%}%>></td>
                                </tr>

                               <tr bgcolor="#ffb6c1" style="font-weight:bold">
                                   <td>2.</td>
                                   <td colspan="3">Analisa(5%)</td>
                                </tr>
                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Pengumpulan data/maklumat yang mencukupi(2%)</td>
                                    
                                    <td><select name="pengumpulan" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==pengumpulan_m){%> selected<%}%> ><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="pengumpulan_m" readonly <%if(!(total==null)){%> value="<%=pengumpulan%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Penggunaan teknik/metodologi/formula/kaedah yang tepat (3%)</td>
                                    <td><select name="teknik" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==teknik_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="teknik_m" readonly <%if(!(total==null)){%> value="<%=teknik%>"<%}%>></td>
                                </tr>
                                <tr bgcolor="#ffe4e1" style="font-weight:bold">
                                    <td>3.</td>
                                    <td colspan="3">Rekabentuk(7%)</td>
                                </tr>
                                <tr bgcolor="#ffe4e1">
                                    <td>&nbsp;</td>
                                    <td>Rekabentuk input/output, rekabentuk pangkalan data, rekabentuk senibina sistem dan lain-lain rekabentuk yang bersesuaian(5%) </td>
                                    <td><select name="rekabentuk" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==rekabentuk_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="rekabentuk_m" readonly <%if(!(total==null)){%> value="<%=rekabentuk%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffe4e1">
                                    <td>&nbsp;</td>
                                    <td>Pemilihan perkakasan dan perisian yang tepat(2%) </td>
                                    <td><select name="perkakasan" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==perkakasan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="perkakasan_m" readonly <%if(!(total==null)){%> value="<%=perkakasan%>"<%}%>></td>
                                </tr>
                                <tr bgcolor="#ffb6c1" style="font-weight:bold">
                                    <td>4.</td>
                                    <td colspan="3">Rumusan dan Hasil Projek (7%)</td>
                                </tr>
                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Hasil projek (kajian, analisa dan rekabentuk) yang mencukupi dan lengkap(3%)</td>
                                    <td><select name="hasil" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==hasil_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="hasil_m" readonly <%if(!(total==null)){%> value="<%=hasil%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Rujukan yang mencukupi (1%)</td>
                                    <td><select name="rujukan" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==rujukan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="rujukan_m" readonly <%if(!(total==null)){%> value="<%=rujukan%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Lampiran (rajah, cartalir dan sebagainya) yang lengkap  (1%)</td>
                                    <td><select name="lampiran" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==lampiran_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="lampiran_m" readonly <%if(!(total==null)){%> value="<%=lampiran%>"<%}%>></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>&nbsp;</td>
                                    <td>Hasil penulisan laporan yang teratur, jelas dan mudah difahami (2%)</td>
                                    <td><select name="laporan" onchange="getAll()" <%if(!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==laporan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="laporan_m" readonly <%if(!(total==null)){%> value="<%=laporan%>"<%}%>></td>
                                </tr>
                                <tr style="font-weight:bold">
                                    <td colspan="3" align="right">Total</td>
                                    <td><input style="width:50px" type="text" name="total" readonly <%if(!(total==null)){%> value="<%=total%>"<%}%>> &nbsp;/&nbsp;25</td>
                                </tr>
                           </table>
                   <%if((total==null)){%>
                    <div id="itemButton">
                        <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="save('save')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEdit"class="editShow">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="editPSM1()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChanges" class="saveChangesHide">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="save('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>       
                    <div style="float:right;">
                       <div><img src="Images/Back.jpg" onclick="javascript:history.back();" alt="Back" title="Back"  border="0"></img></div>
                    </div>
                   </center>
                    </fieldset>
                </center>
                </form>     
        </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="LecMainMenu.jsp" %>
         <br>
         </div>
         <!-- Footer-->
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