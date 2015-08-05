
package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import com.mysql.jdbc.StringUtils;
import java.io.*;
import java.util.ArrayList;


import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author rou
 */
public class ServAdEvalScheme extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String Option = request.getParameter("Option");
        
       
        String schemeNo = request.getParameter("scheme");
        String metric = request.getParameter("metricNo");
        String scheme = request.getParameter("addScheme");
        String desc = request.getParameter("addSchemeDesc");
        String titlescheme=request.getParameter("inputtitlescheme");
        String idScheme=request.getParameter("selectedid");
        
        ArrayList sectionCode=new ArrayList();
        ArrayList sectionRole=new ArrayList();
        ArrayList count=new ArrayList();
      
        
        String query="";
        
        java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());  
        
        String sqldate2=String.valueOf(sqlDate);
        String addEvalScheme="INSERT INTO evaluationscheme (ev_scheme,dateCreated,ev_desc,flag) VALUES('"+scheme+"','"+sqldate2+"','"+desc+"','N') "; 
        String deleteScheme="delete from evaluationscheme where id='"+idScheme+"'";
        String deleteSectionScheme="delete from scheme_section where scheme_SecEvScheme='"+idScheme+"'";
        String deleteCriteriaScheme="delete from scheme_section_criteria where scheme_Sec_criEvScheme='"+idScheme+"' ";
        
        String address="";
        try {
            if ((!(UserSession==null))&&(UserType.equals("3"))) {
                      if(Option.equals("ViewScheme"))
                        {
                            address="WEB-INF/AdEvalScheme.jsp";
                            request.setAttribute("scheme",request.getParameter("scheme"));
                            request.setAttribute("selectedid",request.getParameter("selectedid"));
                            
                        }
                      else if(Option.equals("ViewGenScheme")){
                          address="WEB-INF/AdViewEvalScheme.jsp";
                          request.setAttribute("scheme",request.getParameter("scheme"));
                          request.setAttribute("selectedid",request.getParameter("selectedid"));
                      }
                      else if(Option.equals("ViewSection")){
                          address="WEB-INF/AdEvalScheme.jsp";
                          request.setAttribute("scheme",request.getParameter("scheme"));
                          request.setAttribute("selectedid",request.getParameter("idscheme"));
                          request.setAttribute("section",request.getParameter("section"));
                          request.setAttribute("sectionid",request.getParameter("sectionid"));
                          
                      }
                      else if(Option.equals("AddCriteria")){
                          address="WEB-INF/AdEvalScheme.jsp";
//                          request.setAttribute("scheme",request.getParameter("scheme"));
//                          
//                          request.setAttribute("section",request.getParameter("section"));
//                          request.setAttribute("sectionid",request.getParameter("sectionid"));
                          String idsection=request.getParameter("selectedidsection");
                         //String section=request.getParameter("selectedsection");
                         String selectedidscheme=request.getParameter("selectedidschemesection");
                         String addcriteriafield=request.getParameter("addcriteriainput");
                          
                          String insertIntoCriteria="INSERT INTO scheme_section_criteria (scheme_Sec_criDesc,scheme_Sec_criSecCode,scheme_Sec_criEvScheme) VALUES('"+addcriteriafield+"','"+idsection+"','"+selectedidscheme+"')";
                          DB objDB = new DB();
                          objDB.connect();
                          objDB.query(insertIntoCriteria);
                          objDB.close();
                      
                      }
                      else if(Option.equals("AddScheme")){
                          
                          DB objDB = new DB();
                          objDB.connect();
                          objDB.query(addEvalScheme);
                          objDB.close();
                          
                          address="WEB-INF/AdEvalScheme.jsp";
                          
                      }
                      else if(Option.equals("DeleteScheme")){
                          
                          DB objDB = new DB();
                          objDB.connect();
                          objDB.query(deleteScheme);
                          objDB.query(deleteSectionScheme);
                          objDB.query(deleteCriteriaScheme);
                          objDB.close();
                          
                          address="WEB-INF/AdEvalScheme.jsp";
                          
                      }
                      else if(Option.equals("EditScheme")){
                          request.setAttribute("editidscheme",request.getParameter("editidscheme"));
                          address="WEB-INF/AdEvalScheme.jsp";
                      }
                      else if(Option.equals("UpdateScheme")){
                          String selectid=(String)request.getAttribute("editidscheme");
                      }
                      else if(Option.equals("AddTitleScheme")){
                         String idEvalScheme=request.getParameter("selectedidscheme");
                         String selectedscheme=request.getParameter("selectedscheme");
                         String addCode=request.getParameter("addCode");
                        String addDesc=request.getParameter("addDesc");
                        String addRole=request.getParameter("addRole");
                         String addMark=request.getParameter("addMark");
                         
                         String insertIntoScheme="INSERT INTO scheme_section (scheme_SecCode,scheme_SecDesc,scheme_SecRole,scheme_SecPercent,scheme_SecEvScheme) VALUES('"+addCode+"','"+addDesc+"','"+addRole+"','"+addMark+"','"+idEvalScheme+"')";
                         
                         DB objDB=new DB();
                         objDB.connect();
                         objDB.query(insertIntoScheme);
                         objDB.close();
                         
                         address="WEB-INF/AdEvalScheme.jsp";
                          
                      }
                      else if(Option.equals("DeleteCriteria")){
                          String deleteId=request.getParameter("deleteidcri");
                          String deletecrit="delete from scheme_section_criteria where scheme_Sec_criID='"+deleteId+"'";
                          DB objDB=new DB();
                         objDB.connect();
                         objDB.query(deletecrit);
                         objDB.close();
                         address="WEB-INF/AdEvalScheme.jsp";
                      }
                      else if(Option.equals("GenerateScheme")){
                          String idscheme=request.getParameter("idscheme");
                          String sqlselectscheme="select ev_scheme from evaluationscheme where id='"+idscheme+"'";
                          String namescheme="";
                          String sql="select * from scheme_section_criteria where scheme_Sec_criEvScheme='"+idscheme+"'";
                         String data="";
                DB objDB=new DB();
                objDB.connect();
                //objDB.query(sqlselectscheme);
                query="select scheme_SecCode as SecCode,scheme_SecDesc as SecDesc,scheme_SecRole as SecRole,scheme_SecPercent as SecPercentage "+
                       " from scheme_section "+
                        " where scheme_SecEvScheme='"+idscheme+"'"+
//                        "and scheme_SecRole like '"+like+"%'"+
                       
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
                int k=1;
                if(rowselect>0){
                    data+="create table "+namescheme+" ( metricNo varchar (10) NOT NULL,";
                for(int i=0;i<rowselect;i++){
                        String code=(String)sectionCode.get(i);
                        query="select scheme_Sec_criDesc from scheme_section_criteria where scheme_Sec_criSecCode='"+code+"' and scheme_Sec_criEvScheme='"+idscheme+"'";
                        objDB.query(query);
                        
                        int temp3=Integer.parseInt((String)count.get(i));
                
                        for (int j=0;j<temp3;j++){
                            String tempString=objDB.getDataAt(j, "scheme_Sec_CriDesc");
                            
                            if(tempString!=null){
                                tempString= tempString.replaceAll("\\s+", "_");
                                tempString+="_"+sectionCode.get(i);
                                data+=""+tempString+" varchar(255) ,";
                            }
                            
                            //crit.add(tempString);
                            //data+=tempString;
                            k++;
                        }
                     
                }
                data+=" total varchar(255)  , comment varchar(255),PRIMARY KEY(metricNo))";
                }
                System.out.println(data);
                     objDB.query(data);
                     String updateflag="update evaluationscheme set flag='Y' where id='"+idscheme+"'";
                         objDB.query(updateflag);
                         objDB.close();
                       
                         
                        address="WEB-INF/AdEvalScheme.jsp";
                      }
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } 
        finally { 
            out.close();
        }
    } 

}
