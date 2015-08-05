<%-- 
    Document   : LecSvPSM2
    Created on : Apr 1, 2009, 9:16:08 AM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String metricNo = request.getParameter("metric");
String proTitle = "";

String gantt = "";
String kebolehan = "";
String daya = "";
String kekerapan = "";
String peningkatan = "";
String keberkesanan = "";
String total = "";
String comment = "";

float gantt_m = -1;
float kebolehan_m = -1;
float daya_m = -1;
float kekerapan_m = -1;
float peningkatan_m = -1;
float keberkesanan_m = -1;
float total_m = -1;
float comment_m = -1;

String gantt2 = "";
String kebolehan2 = "";
String daya2 = "";
String kekerapan2 = "";
String peningkatan2 = "";
String keberkesanan2 = "";
String total2 = null;
String comment2 = "";

float gantt2_m = -1;
float kebolehan2_m = -1;
float daya2_m = -1;
float kekerapan2_m = -1;
float peningkatan2_m = -1;
float keberkesanan2_m = -1;
float total2_m = -1;
float comment2_m = -1;

String total3="";
String comment3 ="";
String panduan ="";
String skop = "";
String teknologi = "";
String komersial = "";
String persembahan = "";
String ayat = "";
String gambarajah = "";
String kajian = "";
String teknik = "";
String fakta = "";
String keterperincian = "";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";

float total3_m = -1;
float comment3_m = -1;
float panduan_m = -1;
float skop_m =  -1;
float teknologi_m =  -1;
float komersial_m = -1;
float persembahan_m = -1;
float ayat_m = -1;
float gambarajah_m = -1;
float kajian_m = -1;
float teknik_m = -1;
float fakta_m = -1;
float keterperincian_m = -1;

String studName="";
String query = "select a.proTitle, b.studName, c.gantt, c.kebolehan, c.daya, c.kekerapan, c.peningkatan, c.keberkesanan, c.total, c.komen "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "left outer join supervision_phase1_psm2 c on c.metricNo=a.metricNo "+
                "where a.metricNo='"+metricNo+"'";

String query2 = "select a.proTitle, b.studName, c.gantt, c.kebolehan, c.daya, c.kekerapan, c.peningkatan, c.keberkesanan, c.total, c.komen "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "left outer join supervision_phase2_psm2 c on c.metricNo=a.metricNo "+
                "where a.metricNo='"+metricNo+"'";

String query3 = "select proTitle, b.studName, c.panduan, c.skop, c.teknologi, c.komersial, c.persembahan, "+
                "c.ayat, c.gambarajah, c.kajian, c.teknik, c.fakta, c.keterperincian, c.total, c.komen "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "left outer join  supervision_marks_psm2 c on c.metricNo=a.metricNo "+
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
 proTitle=objDB.getDataAt(0, "proTitle");
 studName = objDB.getDataAt(0, "studName");
 total = objDB.getDataAt(0,"total");
 if(!(total==null))
     {
         gantt = objDB.getDataAt(0, "gantt");
         gantt_m=Float.parseFloat(gantt)*10/5;
         kebolehan = objDB.getDataAt(0, "kebolehan");
         kebolehan_m = Float.parseFloat(kebolehan)*10/2;
         daya = objDB.getDataAt(0, "daya");
         daya_m = Float.parseFloat(daya)*10/2;
         kekerapan = objDB.getDataAt(0, "kekerapan");
         kekerapan_m = Float.parseFloat(kekerapan)*10/2;
         peningkatan = objDB.getDataAt(0, "peningkatan");
         peningkatan_m = Float.parseFloat(peningkatan)*10/2;
         keberkesanan = objDB.getDataAt(0, "keberkesanan");
         keberkesanan_m = Float.parseFloat(keberkesanan)*10/2;
         comment = objDB.getDataAt(0,"komen");
     }
 objDB.query(query2);
 total2 = objDB.getDataAt(0,"total");
 if(!(total2==null))
     {
         gantt2 = objDB.getDataAt(0, "gantt");
         gantt2_m = Float.parseFloat(gantt2)*10/5;
         kebolehan2 = objDB.getDataAt(0, "kebolehan");
         kebolehan2_m = Float.parseFloat(kebolehan2)*10/2;
         daya2 = objDB.getDataAt(0, "daya");
         daya2_m = Float.parseFloat(daya2)*10/2;
         kekerapan2 = objDB.getDataAt(0, "kekerapan");
         kekerapan2_m = Float.parseFloat(kekerapan2)*10/2;
         peningkatan2 = objDB.getDataAt(0, "peningkatan");
         peningkatan2_m = Float.parseFloat(peningkatan2)*10/2;
         keberkesanan2 = objDB.getDataAt(0, "keberkesanan");
         keberkesanan2_m = Float.parseFloat(keberkesanan2)*10/2;
         comment2 = objDB.getDataAt(0,"komen");
     }
 
 objDB.query(query3);
 total3 = objDB.getDataAt(0,"total");
 if(!(total3==null))
     {
         comment3 = objDB.getDataAt(0,"komen");
         panduan = objDB.getDataAt(0,"panduan");
         panduan_m = Float.parseFloat(panduan)*10/5;
         skop = objDB.getDataAt(0,"skop");
         skop_m = Float.parseFloat(skop)*10/5;
         teknologi = objDB.getDataAt(0,"teknologi");
         teknologi_m = Float.parseFloat(teknologi)*10/3;
         komersial = objDB.getDataAt(0,"komersial");
         komersial_m = Float.parseFloat(komersial)*10/2;
         persembahan = objDB.getDataAt(0,"persembahan");
         persembahan_m = Float.parseFloat(persembahan)*10/4;
         ayat = objDB.getDataAt(0,"ayat");
         ayat_m = Float.parseFloat(ayat)*10/4;
         gambarajah = objDB.getDataAt(0,"gambarajah");
         gambarajah_m = Float.parseFloat(gambarajah)*10/2;
         kajian = objDB.getDataAt(0,"kajian");
         kajian_m = Float.parseFloat(kajian)*10/6;
         teknik = objDB.getDataAt(0,"teknik");
         teknik_m = Float.parseFloat(teknik)*10/6;
         fakta = objDB.getDataAt(0,"fakta");
         fakta_m = Float.parseFloat(fakta)*10/4;
         keterperincian = objDB.getDataAt(0,"keterperincian");
         keterperincian_m = Float.parseFloat(keterperincian)*10/4;
     }
  objDB.close();    
     
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/LecSvPSM2.js"></script>
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <title>Final Year Project Management System</title>
    </head>
   
  
    <body>
            
      
      <div id="Wrapper" style="padding-top:50px">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">
         
    
   
    <div style="height:auto" id="WrapperBody">
        <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span> 
        <br>

                     <center>
                        <form name="evaluatePSM2">
                     <h2>Supervisor Evaluation form</h2>
                     <center>
                     <table class="table table-bordered">
                         <tr>
                             <td >Evaluation Form</td>
                             <td id="inputText">
                                 <select class="form-control"  name="evForm" onchange="formType()">
                                     <option value="">Please Select</option>
                                     <option value="phase1">Phase 1 Evaluation</option>
                                     <option value="phase2" <%if(total==null){%> disabled <%}%> >Phase 2 Evaluation</option>
                                     <option value="final" <%if(total2==null){%> disabled <%}%> >Final Evaluation</option>
                                 </select>
                             </td>
                         </tr>
                     </table>
                    <div id="phase2Item" class="hide">
                    <fieldset id="titleSuggestion">
                        <legend>Phase 2 Evaluation</legend>
                            <table>
                                <tr>
                                    <td  width="200px" >Name</td>
                                   
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Metric No.</td>
                                   
                                    <td  align="left"><%=metricNo%></td>
                                    <input class="form-control" type="hidden" name="metricNo" value="<%=metricNo%>"></input>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Project title</td>
                                   
                                    <td  align="left"><%=proTitle%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Comment</td>
                                   
                                    <td  align="left"><textarea cols="50" rows="10" id="inputText" name="comment2" <%if(!(total2==null)){%> readonly <%}%>><%if(!(total2==null)){%> <%=comment2%> <%}%> </textarea></td>
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
                        <tr  style="font-weight:bold">
                            <td width="10px">No.</td>
                            <td width="300px">Item Penilaian</td>
                            <td width="110px">Paras Penilaian</td>
                            <td width="100px">Markah</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td colspan="4">Penilaian Laporan Kemajuan</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>1.</td>
                           <td colspan="3">Kemajuan Pelajar (5%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Pencapaian perancangan Projek berdasarkan carta Gantt.(5%) </td>
                            <td><select class="form-control"   name="gantt2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==gantt2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="gantt_m2" readonly   <%if(!(total2==null)){%> value="<%=gantt2%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>2.</td>
                           <td colspan="3">Prestasi Perlaksanaan Projek (6%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kebolehan merancang dan menyelesaikan masalah (2%)</td>
                            <td><select class="form-control"   name="kebolehan2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kebolehan2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="kebolehan_m2" readonly <%if(!(total2==null)){%> value="<%=kebolehan2%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Daya usaha dan kebolehan berdikari (2%) </td>
                            <td><select class="form-control"   name="daya2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==daya2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="daya_m2" readonly <%if(!(total2==null)){%> value="<%=daya2%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kekerapan pelajar berbincang dan mengemukakan perkembangan(2%)</td>
                            <td><select class="form-control"   name="kekerapan2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kekerapan2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="kekerapan_m2" readonly <%if(!(total2==null)){%> value="<%=kekerapan2%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>3.</td>
                           <td colspan="3">Perkembangan Intelek / Sahsiah Pelajar (4%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Peningkatan pengetahuan dan kemahiran(2%)</td>
                            <td><select class="form-control"   name="peningkatan2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==peningkatan2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="peningkatan_m2" readonly <%if(!(total2==null)){%> value="<%=peningkatan2%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Keberkesanan berkomunikasi/perhubungan(2%)</td>
                            <td><select class="form-control"   name="keberkesanan2" onchange="addPhase2()" <%if(!(total2==null)){%> disabled<%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==keberkesanan2_m){%> selected<%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="keberkesanan_m2" readonly <%if(!(total2==null)){%> value="<%=keberkesanan2%>"<%}%>></td>
                        </tr>
       
                       
                        <tr style="font-weight:bold">
                            <td colspan="2" align="right">Total</td>
                            <td><input class="form-control" style="width:50px" type="text" name="total2" readonly <%if(!(total2==null)){%> value="<%=total2%>" <%}%> > &nbsp;/&nbsp;15 </td>
                        </tr>
                    </table>
                    
                    <%if((total2==null)){%>
                    <div id="itemButton">
                       
                            <div class="btn btn-success" onclick="savePhase2('save')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEditPhase2"class="show">
                        <div id="itemButton">
                             <div class="btn btn-info" onclick="editPhase2()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChangesPhase2" class="hide">
                        <div id="itemButton">
                             <div class="btn btn-success" onclick="savePhase2('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>
                    </fieldset>
                    </div>
                    <div id="phase1Item" class="hide">
                    <fieldset id="titleSuggestion">
                        <legend>Phase 1 Evaluation</legend>
                        
                            <table>
                                <tr>
                                    <td  width="200px" >Name</td>
                                   
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Metric No.</td>
                                   
                                    <td  align="left"><%=metricNo%></td>
                                    <input class="form-control" type="hidden" name="metricNo" value="<%=metricNo%>"></input>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Project title</td>
                                   
                                    <td  align="left"><%=proTitle%></td>
                                 </tr>
                                
                                <tr>
                                    <td  width="200px" >Comment</td>
                                   
                                    <td  align="left"><textarea cols="50" rows="10" id="inputText" name="comment" <%if(!(total==null)){%> readonly <%}%>><%if(!(total==null)){%> <%=comment%><%}%></textarea></td>
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
                        <tr  style="font-weight:bold">
                            <td width="10px">No.</td>
                            <td width="300px">Item Penilaian</td>
                            <td width="110px">Paras Penilaian</td>
                            <td width="100px">Markah</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td colspan="4">Penilaian Laporan Kemajuan</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>1.</td>
                           <td colspan="3">Kemajuan Pelajar (3%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Pencapaian perancangan Projek berdasarkan carta Gantt.(5%) </td>
                            <td><select class="form-control"   name="gantt" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%> >
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==gantt_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="gantt_m" readonly   <%if(!(total==null)){%> value="<%=gantt%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>2.</td>
                           <td colspan="3">Prestasi Perlaksanaan Projek (6%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kebolehan merancang dan menyelesaikan masalah (2%)<%=gantt_m%></td>
                            <td><select class="form-control"   name="kebolehan" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==gantt_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="kebolehan_m" readonly <%if(!(total==null)){%> value="<%=kebolehan%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Daya usaha dan kebolehan berdikari (2%) </td>
                            <td><select class="form-control"   name="daya" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==daya_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="daya_m" readonly <%if(!(total==null)){%> value="<%=daya%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kekerapan pelajar berbincang dan mengemukakan perkembangan(2%)</td>
                            <td><select class="form-control"   name="kekerapan" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kekerapan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="kekerapan_m" readonly <%if(!(total==null)){%> value="<%=kekerapan%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>3.</td>
                           <td colspan="3">Perkembangan Intelek / Sahsiah Pelajar (4%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Peningkatan pengetahuan dan kemahiran(2%)</td>
                            <td><select class="form-control"   name="peningkatan" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==peningkatan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="peningkatan_m" readonly <%if(!(total==null)){%> value="<%=peningkatan%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Keberkesanan berkomunikasi/perhubungan(2%)</td>
                            <td><select class="form-control"   name="keberkesanan" onchange="addPhase1()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==keberkesanan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="keberkesanan_m" readonly <%if(!(total==null)){%> value="<%=keberkesanan%>"<%}%>></td>
                        </tr>
       
                       
                        <tr style="font-weight:bold">
                            <td colspan="2" align="right">Total</td>
                            <td><input class="form-control" style="width:50px" type="text" name="total" readonly <%if(!(total==null)){%> value="<%=total%>" <%}%> > &nbsp;/&nbsp;15 </td>
                        </tr>
                    </table>
                    
                    <%if((total==null)){%>
                    <div id="itemButton">
                       <div class="btn btn-success" onclick="savePhase1('save')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEditPhase1"class="show">
                        <div id="itemButton">
                             <div class="btn btn-info" onclick="editPhase1()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChangesPhase1" class="hide">
                        <div id="itemButton">
                             <div class="btn btn-success" onclick="savePhase1('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>
                    </fieldset>
                    </div>
                    
                    <!Penilaian Akhir ->
                    
                    <div id="finalItem" class="hide">
                    <fieldset id="titleSuggestion">
                        <legend>Supervision Evaluation Form</legend>
                            <table>
                                <tr>
                                    <td  width="200px" >Name</td>
                                   
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Metric No.</td>
                                   
                                    <td  align="left"><%=metricNo%></td>
                                    <input class="form-control" type="hidden" name="metricNo" value="<%=metricNo%>"></input>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Project title</td>
                                   
                                    <td  align="left"><%=proTitle%></td>
                                 </tr>
                                
                                <tr>
                                    <td  width="200px" >Comment</td>
                                   
                                    <td  align="left"><textarea cols="50" rows="10" id="inputText" name="comment3" <%if(!(total3==null)){%> readonly <%}%>><%if(!(total3==null)){%> <%=comment3%><%}%> </textarea></td>
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
                        <tr  style="font-weight:bold">
                            <td width="10px">No.</td>
                            <td width="300px">Item Penilaian</td>
                            <td width="110px">Paras Penilaian</td>
                            <td width="100px">Markah</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>1.</td>
                           <td colspan="3">Kemahiran pelajar dalam penulisan tesis mengikut spesifikasi format (5%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Menurut panduan penulisan tesis untuk pelajar(5%)</td>
                            <td><select class="form-control"   name="panduan" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==panduan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="panduan_m" readonly   <%if(!(total3==null)){%> value="<%=panduan%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>2.</td>
                           <td colspan="3">Hasil Projek (10%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Memenuhi Skop(5%)</td>
                            <td><select class="form-control"   name="skop" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>  
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==skop_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="skop_m" readonly <%if(!(total3==null)){%> value="<%=skop%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Penggunaan Teknologi/Teknik terkini.(3%)</td>
                            <td><select class="form-control"   name="teknologi" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==teknologi_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="teknologi_m" readonly <%if(!(total3==null)){%> value="<%=teknologi%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Berciri Komersial(2%)</td>
                            <td><select class="form-control"   name="komersial" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==komersial_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="komersial_m" readonly <%if(!(total3==null)){%> value="<%=komersial%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>3.</td>
                           <td colspan="3">Penyampaian bertulis tesis(30%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Susunan persembahan laporan mengikut jujukan secara logik (4%) </td>
                            <td><select class="form-control"   name="persembahan" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==persembahan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="persembahan_m" readonly <%if(!(total3==null)){%> value="<%=persembahan%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Susunan ayat yang mudah dan jelas difahami(4%)</td>
                            <td><select class="form-control"   name="ayat" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==ayat_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="ayat_m" readonly <%if(!(total3==null)){%> value="<%=ayat%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Gambarajah/lakaran yang dapat memudahkan pemahaman(2%)</td>
                            <td><select class="form-control"   name="gambarajah" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==gambarajah_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="gambarajah_m" readonly <%if(!(total3==null)){%> value="<%=gambarajah%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kajian literatur / latarbelakang yang mencukupi(6%)</td>
                            <td><select class="form-control"   name="kajian" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kajian_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="kajian_m" readonly <%if(!(total3==null)){%> value="<%=kajian%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Penggunaan kaedah/formula/teknik/pendekatan kajian yang betul (6%)</td>
                            <td><select class="form-control"   name="teknik" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==teknik_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="teknik_m" readonly <%if(!(total3==null)){%> value="<%=teknik%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Fakta-fakta kajian yang betul(4%)</td>
                            <td><select class="form-control"   name="fakta" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==fakta_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:50px" type="text" name="fakta_m" readonly <%if(!(total3==null)){%> value="<%=fakta%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Keterperincian kajian (4%)</td>
                            <td><select class="form-control"   name="keterperincian" onchange="addFinal()" <%if(!(total3==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==keterperincian_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:50px" type="text" name="keterperincian_m" readonly <%if(!(total3==null)){%> value="<%=keterperincian%>"<%}%>></td>
                        </tr>
       
                       <tr style="font-weight:bold">
                            <td colspan="3" align="right">Total</td>
                            <td><input class="form-control" style="width:50px" type="text" name="total3" readonly <%if(!(total==null)){%> value="<%=total3%>" <%}%> > &nbsp;/&nbsp;45 </td>
                        </tr>
                    </table>
                    
                    <%if((total3==null)){%>
                    <div id="itemButton">
                       
                            <div class="btn btn-success" onclick="saveFinal('save')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEdit"class="show">
                        <div id="itemButton">
                             <div class="btn btn-info" onclick="editFinal()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChanges" class="hide">
                        <div id="itemButton">
                             <div class="btn btn-success" onclick="saveFinal('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>
                </fieldset>
                    </div>
                    <div style="float:right;">
                       
                            <div><img src="Images/Back.jpg" onclick="javascript:history.back();" alt="Back" title="Back"  border="0"></img></div>
                        
                    </div>
                </center>
                </form>
                    
                    </center>
        
  
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
