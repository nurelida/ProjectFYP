/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSys_Bean;


/**
 *
 * @author rou
 */
public class SearchB {
    
    private String studName;
    private String metricNo;
    private String svName;
    private String staffNo;
    private String proTitle;
    private String semester;
    
    public SearchB ( String studName, String metricNo, String svName, String staffNo,  String proTitle, String semester)
    {
        this.studName=studName;
        this.metricNo=metricNo;
        this.svName=svName;
        this.staffNo=staffNo;
        this.proTitle=proTitle;
        this.semester=semester;
    }
    
    public String getStudName()
    {
        return studName;
    }
    
    public String getMetricNo(){
        return metricNo;
    }
    
    public String getSvName(){
        return svName;
    }
    
    public String getStaffNo(){
        return staffNo;
    }
    
    public String getProTitle(){
        return proTitle;
    }
    
        
   
}
