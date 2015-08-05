/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import java.io.*;
import java.net.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLecSvPSM extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        String metric = request.getParameter("metricNo");
        String option = request.getParameter("Option");
        
        String query = "";
        ArrayList crit=new ArrayList();
        ArrayList sectionCode =new ArrayList();
        ArrayList sectionRole =new ArrayList ();
        ArrayList count=new ArrayList();
        ArrayList valueForm=new ArrayList();
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
           if(option.equals("PSM1")){
           query="insert into supervision_marks_psm1 value('"+metric+"','"
                                                            +request.getParameter("gantt_m")+"','"
                                                            +request.getParameter("kebolehan_m")+"','"
                                                            +request.getParameter("daya_m")+"','"
                                                            +request.getParameter("kekerapan_m")+"','"
                                                            +request.getParameter("peningkatan_m")+"','"
                                                            +request.getParameter("keberkesanan_m")+"','"
                                                            +request.getParameter("peranan_m")+"','"
                                                            +request.getParameter("format_m")+"','"
                                                            +request.getParameter("abstrak_m")+"','"
                                                            +request.getParameter("objektif_m")+"','"
                                                            +request.getParameter("analisis_m")+"','"
                                                            +request.getParameter("kajian_m")+"','"
                                                            +request.getParameter("metodologi_m")+"','"
                                                            +request.getParameter("kesimpulan_m")+"','"
                                                            +request.getParameter("rujukan_m")+"','"
                                                            +request.getParameter("lampiran_m")+"','"
                                                            +request.getParameter("persembahan_m")+"','"
                                                            +request.getParameter("ayat_m")+"','"
                                                            +request.getParameter("gambarajah_m")+"','"
                                                            +request.getParameter("total")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
            address="/WEB-INF/LecSvPSM1.jsp?metric="+metric;
            }
           else if(option.equals("PSM1_Edit")){
           query="update supervision_marks_psm1 set gantt='"+request.getParameter("gantt_m")
                                                +"',kebolehan='"+request.getParameter("kebolehan_m")
                                                +"',daya='"+request.getParameter("daya_m")
                                                +"',kekerapan='"+request.getParameter("kekerapan_m")
                                                +"',peningkatan='"+request.getParameter("peningkatan_m")
                                                +"',keberkesanan='"+request.getParameter("keberkesanan_m")
                                                +"',peranan='"+request.getParameter("peranan_m")
                                                +"',formet='"+request.getParameter("format_m")
                                                +"',abstrak='"+request.getParameter("abstrak_m")
                                                +"',objektif='"+request.getParameter("objektif_m")
                                                +"',analisis='"+request.getParameter("analisis_m")
                                                +"',kajian='"+request.getParameter("kajian_m")
                                                +"',metodologi='"+request.getParameter("metodologi_m")
                                                +"',kesimpulan='"+request.getParameter("kesimpulan_m")
                                                +"',rujukan='"+request.getParameter("rujukan_m")
                                                +"',lampiran='"+request.getParameter("lampiran_m")
                                                +"',persembahan='"+request.getParameter("persembahan_m")
                                                +"',ayat='"+request.getParameter("ayat_m")
                                                +"',gambarajah='"+request.getParameter("gambarajah_m")
                                                +"',total='"+request.getParameter("total")
                                                +"',komen='"+Common.replaceSingleQuote(request.getParameter("comment"))
                                                +"' where metricNo='"+metric+"'";
            address="/WEB-INF/LecSvPSM1.jsp?metric="+metric;
            }
            else if(option.equals("phase2_psm2")){
                query="insert into supervision_phase2_psm2 value('"+metric+"','"
                                                            +request.getParameter("gantt_m2")+"','"
                                                            +request.getParameter("kebolehan_m2")+"','"
                                                            +request.getParameter("daya_m2")+"','"
                                                            +request.getParameter("kekerapan_m2")+"','"
                                                            +request.getParameter("peningkatan_m2")+"','"
                                                            +request.getParameter("keberkesanan_m2")+"','"
                                                            +request.getParameter("total2")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment2"))+"')";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            
            }
           else if(option.equals("phase2_psm2_Edit")){
                query="update supervision_phase2_psm2 set gantt='"+request.getParameter("gantt_m2")
                                                    +"',kebolehan='"+request.getParameter("kebolehan_m2")
                                                    +"',daya='"+request.getParameter("daya_m2")
                                                    +"',kekerapan='"+request.getParameter("kekerapan_m2")
                                                    +"',peningkatan='"+request.getParameter("peningkatan_m2")
                                                    +"',keberkesanan='"+request.getParameter("keberkesanan_m2")
                                                    +"',total='"+request.getParameter("total2")
                                                    +"',komen='"+Common.replaceSingleQuote(request.getParameter("comment2"))
                                                    +"' where metricNo='"+metric+"'";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            }
            
            else if(option.equals("phase1_psm2")){
                query="insert into supervision_phase1_psm2 value('"+metric+"','"
                                                            +request.getParameter("gantt_m")+"','"
                                                            +request.getParameter("kebolehan_m")+"','"
                                                            +request.getParameter("daya_m")+"','"
                                                            +request.getParameter("kekerapan_m")+"','"
                                                            +request.getParameter("peningkatan_m")+"','"
                                                            +request.getParameter("keberkesanan_m")+"','"
                                                            +request.getParameter("total")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            
            }
           else if(option.equals("phase1_psm2_Edit")){
               query="update supervision_phase1_psm2 set gantt='"+request.getParameter("gantt_m")
                                                    +"',kebolehan='"+request.getParameter("kebolehan_m")
                                                    +"',daya='"+request.getParameter("daya_m")
                                                    +"',kekerapan='"+request.getParameter("kekerapan_m")
                                                    +"',peningkatan='"+request.getParameter("peningkatan_m")
                                                    +"',keberkesanan='"+request.getParameter("keberkesanan_m")
                                                    +"',total='"+request.getParameter("total")
                                                    +"',komen='"+Common.replaceSingleQuote(request.getParameter("comment"))
                                                    +"' where metricNo='"+metric+"'";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            
            }
            
            else if(option.equals("final_psm2")){
                query="insert into supervision_marks_psm2 value('"+metric+"','"
                                                            +request.getParameter("panduan_m")+"','"
                                                            +request.getParameter("skop_m")+"','"
                                                            +request.getParameter("teknologi_m")+"','"
                                                            +request.getParameter("komersial_m")+"','"
                                                            +request.getParameter("persembahan_m")+"','"
                                                            +request.getParameter("ayat_m")+"','"
                                                            +request.getParameter("gambarajah_m")+"','"
                                                            +request.getParameter("kajian_m")+"','"
                                                            +request.getParameter("teknik_m")+"','"
                                                            +request.getParameter("fakta_m")+"','"
                                                            +request.getParameter("keterperincian_m")+"','"
                                                            +request.getParameter("total3")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment3"))+"')";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            }
           else if(option.equals("final_psm2_Edit")){
                query="update supervision_marks_psm2 set panduan='"+request.getParameter("panduan_m")
                                                        +"',skop='"+request.getParameter("skop_m")
                                                        +"',teknologi='"+request.getParameter("teknologi_m")
                                                        +"',komersial='"+request.getParameter("komersial_m")
                                                        +"',persembahan='"+request.getParameter("persembahan_m")
                                                        +"',ayat='"+request.getParameter("ayat_m")
                                                        +"',gambarajah='"+request.getParameter("gambarajah_m")
                                                        +"',kajian='"+request.getParameter("kajian_m")
                                                        +"',teknik='"+request.getParameter("teknik_m")
                                                        +"',fakta='"+request.getParameter("fakta_m")
                                                        +"',keterperincian='"+request.getParameter("keterperincian_m")
                                                        +"',total='"+request.getParameter("total3")
                                                        +"',komen='"+Common.replaceSingleQuote(request.getParameter("comment3"))
                                                        +"' where metricNo='"+metric+"'";
            address="/WEB-INF/LecSvPSM2.jsp?metric="+metric;
            }
           else if(option.equals("SelectSchemePSM1")){
               query="select * from evaluationscheme";
               
               request.setAttribute("selectedid",request.getParameter("selscheme"));
               address="WEB-INF/LecSvPSM1v2.jsp?metric="+metric;
           }
           else if(option.equals("SaveEvaluatePSM1")){
                String idscheme=request.getParameter("scheme");
                String like=request.getParameter("stat");
                String sqlselectscheme="select ev_scheme from evaluationscheme where id='"+idscheme+"'";
                String namescheme="";
                String sql="select distinct a.scheme_Sec_CriDesc as scheme_Sec_CriDesc,b.scheme_SecRole as scheme_SecRole from scheme_section_criteria a inner join scheme_section b on b.scheme_SecEvScheme=a.scheme_Sec_criEvScheme where b.scheme_SecRole='"+like+"' and a.scheme_Sec_criEvScheme='"+idscheme+"'  ";
                String data="";
                int totalCrit=0;
                DB objDB=new DB();
                objDB.connect();
                //objDB.query(sqlselectscheme);
                query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idscheme+"'"+
                        "and scheme_SecRole like '"+like+"%'"+
                       
                        "order by scheme_SecCode ASC";
                objDB.query(sqlselectscheme);
                 for(int i=0;i<objDB.getNumberOfRows();i++){
                              namescheme=objDB.getDataAt(i, "ev_scheme");
                 }
     
     
                 objDB.query(query);
                int rowselect = objDB.getNumberOfRows();
  
                 for(int i=0;i<rowselect;i++)
                {
                         sectionCode.add(objDB.getDataAt(i, "SecCode"));
                         sectionRole.add(objDB.getDataAt(i, "SecRole"));
                }
                 for(int i=0;i<rowselect;i++){
                String temp2=(String)sectionCode.get(i);
                query="select count(*) from scheme_section_criteria where scheme_Sec_criEvScheme='"+idscheme+"' and scheme_Sec_criSecCode='"+temp2+"'";
                objDB.query(query);
                count.add(objDB.getDataAt(0,"count(*)"));
                }
                int k=0;
                for(int i=0;i<rowselect;i++){
                        String code=(String)sectionCode.get(i);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idscheme+"'";
                        objDB.query(query);
                        
                        int temp3=Integer.parseInt((String)count.get(i));
                
                        for (int j=0;j<temp3;j++){
                            String tempString=objDB.getDataAt(j, "scheme_Sec_CriDesc");
                            tempString= tempString.replaceAll("\\s+", "_");
                            tempString+="_"+sectionCode.get(i);
                            
                            crit.add(tempString);
                            valueForm.add(request.getParameter(tempString));
                            //totalCrit+=Integer.parseInt((String)valueForm.get(i));
                            data+=tempString;
                            k++;
                        }
                     
                }
                
                k=crit.size();
             String insertquery="insert into "+namescheme+"(metricNo, ";
             for(int m=0;m<k;m++){
                 insertquery+=crit.get(m);
                 if((k-m)!=1){
                     insertquery+=" , ";
                 }
             }
             
             insertquery+=") VALUES('"+metric+"',";
             for(int n=0;n<k;n++){
                 insertquery+="'"+valueForm.get(n)+"'";
                 if((k-n)!=1){
                     insertquery+=" , ";
                 }
                 
             }
             insertquery+=")";
             objDB.query(insertquery);
             if(objDB.getNumberOfRows()>0){
                 query="update evaluator set flag_supervisor='S' where metricNo='"+metric+"'";
                 objDB.query(query);
             }
           
               address="WEB-INF/LecSvPSM1v2.jsp?metric="+metric; 
               objDB.close();
           }
           else if(option.equals("UpdateEvaluatePSM1")){
                String idscheme=request.getParameter("scheme");
                String like=request.getParameter("stat");
                String sqlselectscheme="select ev_scheme from evaluationscheme where id='"+idscheme+"'";
                String namescheme="";
                String sql="select distinct a.scheme_Sec_CriDesc as scheme_Sec_CriDesc,b.scheme_SecRole as scheme_SecRole from scheme_section_criteria a inner join scheme_section b on b.scheme_SecEvScheme=a.scheme_Sec_criEvScheme where b.scheme_SecRole='"+like+"' and a.scheme_Sec_criEvScheme='"+idscheme+"'  ";
                String data="";
                int totalCrit=0;
                DB objDB=new DB();
                objDB.connect();
                //objDB.query(sqlselectscheme);
                query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idscheme+"'"+
                        "and scheme_SecRole like '"+like+"%'"+
                       
                        "order by scheme_SecCode ASC";
                objDB.query(sqlselectscheme);
                 for(int i=0;i<objDB.getNumberOfRows();i++){
                              namescheme=objDB.getDataAt(i, "ev_scheme");
                 }
     
     
                 objDB.query(query);
                int rowselect = objDB.getNumberOfRows();
  
                 for(int i=0;i<rowselect;i++)
                {
                         sectionCode.add(objDB.getDataAt(i, "SecCode"));
                         sectionRole.add(objDB.getDataAt(i, "SecRole"));
                }
                 for(int i=0;i<rowselect;i++){
                String temp2=(String)sectionCode.get(i);
                query="select count(*) from scheme_section_criteria where scheme_Sec_criEvScheme='"+idscheme+"' and scheme_Sec_criSecCode='"+temp2+"'";
                objDB.query(query);
                count.add(objDB.getDataAt(0,"count(*)"));
                }
                int k=0;
                for(int i=0;i<rowselect;i++){
                        String code=(String)sectionCode.get(i);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idscheme+"'";
                        objDB.query(query);
                        
                        int temp3=Integer.parseInt((String)count.get(i));
                
                        for (int j=0;j<temp3;j++){
                            String tempString=objDB.getDataAt(j, "scheme_Sec_CriDesc");
                            tempString= tempString.replaceAll("\\s+", "_");
                            tempString+="_"+sectionCode.get(i);
                            
                            crit.add(tempString);
                            valueForm.add(request.getParameter(tempString));
                            //totalCrit+=Integer.parseInt((String)valueForm.get(i));
                            data+=tempString;
                            k++;
                        }
                     
                }
                
                k=crit.size();
             String updatequery="update "+namescheme+" set ";
             for(int m=0;m<k;m++){
                 updatequery+=crit.get(m);
                 updatequery+="=";
                 updatequery+="'"+valueForm.get(m)+"'";
                 if((k-m)!=1){
                     updatequery+=" , ";
                 }
             }
             
             updatequery+="where metricNo='"+metric+"'";
             objDB.query(updatequery);
             

           
               address="WEB-INF/LecSvPSM1v2.jsp?metric="+metric; 
               objDB.close();
           }
           else if(option.equals("SubmitEvaluatePSM1")){
                String idscheme=request.getParameter("scheme");
                String like=request.getParameter("stat");
                String sqlselectscheme="select ev_scheme from evaluationscheme where id='"+idscheme+"'";
                String namescheme="";
                String sql="select distinct a.scheme_Sec_CriDesc as scheme_Sec_CriDesc,b.scheme_SecRole as scheme_SecRole from scheme_section_criteria a inner join scheme_section b on b.scheme_SecEvScheme=a.scheme_Sec_criEvScheme where b.scheme_SecRole='"+like+"' and a.scheme_Sec_criEvScheme='"+idscheme+"'  ";
                String data="";
                int totalCrit=0;
                DB objDB=new DB();
                objDB.connect();
                //objDB.query(sqlselectscheme);
                query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idscheme+"'"+
                        "and scheme_SecRole like '"+like+"%'"+
                       
                        "order by scheme_SecCode ASC";
                objDB.query(sqlselectscheme);
                 for(int i=0;i<objDB.getNumberOfRows();i++){
                              namescheme=objDB.getDataAt(i, "ev_scheme");
                 }
     
     
                 objDB.query(query);
                int rowselect = objDB.getNumberOfRows();
  
                 for(int i=0;i<rowselect;i++)
                {
                         sectionCode.add(objDB.getDataAt(i, "SecCode"));
                         sectionRole.add(objDB.getDataAt(i, "SecRole"));
                }
                 for(int i=0;i<rowselect;i++){
                String temp2=(String)sectionCode.get(i);
                query="select count(*) from scheme_section_criteria where scheme_Sec_criEvScheme='"+idscheme+"' and scheme_Sec_criSecCode='"+temp2+"'";
                objDB.query(query);
                count.add(objDB.getDataAt(0,"count(*)"));
                }
                int k=0;
                for(int i=0;i<rowselect;i++){
                        String code=(String)sectionCode.get(i);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idscheme+"'";
                        objDB.query(query);
                        
                        int temp3=Integer.parseInt((String)count.get(i));
                
                        for (int j=0;j<temp3;j++){
                            String tempString=objDB.getDataAt(j, "scheme_Sec_CriDesc");
                            tempString= tempString.replaceAll("\\s+", "_");
                            tempString+="_"+sectionCode.get(i);
                            
                            crit.add(tempString);
                            valueForm.add(request.getParameter(tempString));
                            //totalCrit+=Integer.parseInt((String)valueForm.get(i));
                            data+=tempString;
                            k++;
                        }
                     
                }
                
                k=crit.size();
                query="select * from "+namescheme+" where metricNo='"+metric+"'";
                objDB.query(query);
                if(objDB.getNumberOfRows()==1){
                                 String updatequery="update "+namescheme+" set ";
                                 for(int m=0;m<k;m++){
                                 updatequery+=crit.get(m);
                                 updatequery+="=";
                                 updatequery+="'"+valueForm.get(m)+"'";
                                 if((k-m)!=1){
                                    updatequery+=" , ";
                                   }
                                 }
             
                                updatequery+="where metricNo='"+metric+"'";
                                objDB.query(updatequery);
                                System.out.println(updatequery);
                                if(objDB.getNumberOfRows()==1){
                                query="update evaluator set flag_supervisor='Y' where metricNo='"+metric+"'";
                                objDB.query(query);
                    }
                    
                }
                else{
                     String insertquery="insert into "+namescheme+"(metricNo, ";
                    for(int m=0;m<k;m++){
                    insertquery+=crit.get(m);
                    if((k-m)!=1){
                        insertquery+=" , ";
                    }
                    }
             
                     insertquery+=") VALUES('"+metric+"',";
                    for(int n=0;n<k;n++){
                     insertquery+="'"+valueForm.get(n)+"'";
                     if((k-n)!=1){
                     insertquery+=" , ";
                    }
                 
                    }
                    insertquery+=")";
                    objDB.query(insertquery);

                    query="update evaluator set flag_supervisor='Y' where metricNo='"+metric+"'";
                    objDB.query(query);
                    
                }
                

             

           
               address="WEB-INF/LecSvPSM1v2.jsp?metric="+metric; 
               objDB.close();
           }
            
//            DB objDB = new DB();
//            objDB.connect();
//            objDB.query(query);
//            objDB.close();
               
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } finally { 
            out.close();
        }
    } 
    
}
