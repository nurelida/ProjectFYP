/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSys_Bean;

/**
 *
 * @author rou
 */
public class Common {
    public static String completeStr(String str, int length){
		for(int i=str.length(); i<length; i++)
			str = "0" + str;

		return str;
}
    public static String replaceSingleQuote(String str){
		str = str.replaceAll("[']{1}", "''");
		return str;
	}
    public static String replaceSlashT(String str){
		str = str.replaceAll("[\n|\r]{1}", "<br>");
                str = str.replaceAll("<br><br>", "<br>");
		return str;
	}
    public static String replaceBr(String str){
		str = str.replaceAll("<br>", "\n");
                //str = str.replaceAll("<br><br>", "<br>");
		return str;
	}

    public static String checkGrade(float marks){
        String grade = "";
        if((marks<=100)&&(marks>=90))
        {
            grade ="A+";
        }
        else if((marks<90)&&(marks>=80))
        {
            grade ="A";
        }
        else if((marks<80)&&(marks>=75))
        {
            grade="A-";
        }
        
       else if((marks<75)&&(marks>=70))
        {
            grade="B+";
        }
        else if((marks<70)&&(marks>=65))
        {
            grade="B";
        }
        else if((marks<65)&&(marks>=60))
        {
            grade="B-";
        }
        else if((marks<60)&&(marks>=55))
        {
            grade="C+";
        }
        else if((marks<55)&&(marks>=50))
        {
            grade="C";
        }
        else if((marks<50)&&(marks>=45))
        {
            grade="C-";
        }
        else if((marks<45)&&(marks>=40))
        {
            grade="D+";
        }
        else if((marks<40)&&(marks>=35))
        {
            grade="D";
        }
        else if((marks<35)&&(marks>=30))
        {
            grade="D-";
        }
        
        else if((marks<30)&&(marks>=0))
        {
            grade="E";
        }
        
        
       return grade; 
    }
    
    public static String getDay(String day){
        String temp_day = "";
        if(day.equals("01")){
            temp_day="Monday";
        }
        else if(day.equals("02")){
            temp_day="Tuesday";
        }
        else if(day.equals("03")){
            temp_day="Wednesday";
        }
        else if(day.equals("04")){
            temp_day="Thursday";
        }
        else if(day.equals("05")){
            temp_day="Friday";
        }
       return temp_day;
    }
    
    public static String getTime(String slot,String session){
        String temp_time="";
        if(slot.equals("02")){
            if(session.equals("1")){
                temp_time="8.00am";
            }
            else{
                temp_time="8.30am";
            }
        }
        else if(slot.equals("03")){
            if(session.equals("1")){
                temp_time="9.00am";
            }
            else{
                temp_time="9.30am";
            }
        }
        else if(slot.equals("04")){
            if(session.equals("1")){
                temp_time="10.00am";
            }
            else{
                temp_time="10.30am";
            }
        }
        else if(slot.equals("05")){
            if(session.equals("1")){
                temp_time="11.00am";
            }
            else{
                temp_time="11.30am";
            }
        }
        else if(slot.equals("06")){
            if(session.equals("1")){
                temp_time="12.00pm";
            }
            else{
                temp_time="12.30pm";
            }
        }
        else if(slot.equals("07")){
            if(session.equals("1")){
                temp_time="1.00pm";
            }
            else{
                temp_time="1.30pm";
            }
        }
        else if(slot.equals("08")){
            if(session.equals("1")){
                temp_time="2.00pm";
            }
            else{
                temp_time="2.30pm";
            }
        }
        else if(slot.equals("09")){
            if(session.equals("1")){
                temp_time="3.00pm";
            }
            else{
                temp_time="3.30pm";
            }
        }
        else if(slot.equals("10")){
            if(session.equals("1")){
                temp_time="4.00pm";
            }
            else{
                temp_time="4.30pm";
            }
        }
        else if(slot.equals("11")){
            if(session.equals("1")){
                temp_time="5.00pm";
            }
            else{
                temp_time="5.30am";
            }
        }
        else if(slot.equals("12")){
            if(session.equals("1")){
                temp_time="6.00pm";
            }
            else{
                temp_time="6.30pm";
            }
        }
       return temp_time;
    } 
    
    public static String getSlot(String slot){
        String temp_time="";
        if(slot.equals("02")){
           temp_time="8.00am";
        }
        else if(slot.equals("03")){
            temp_time="9.00am";
         }
        else if(slot.equals("04")){
            temp_time="10.00am";
         }
        else if(slot.equals("05")){
            temp_time="11.00am";
        }
        else if(slot.equals("06")){
            temp_time="12.00pm";
        }
        else if(slot.equals("07")){
            temp_time="1.00pm";
        }
        else if(slot.equals("08")){
            temp_time="2.00pm";
            }
        else if(slot.equals("09")){
            temp_time="3.00pm";
        }
        else if(slot.equals("10")){
            temp_time="4.00pm";
        }
        else if(slot.equals("11")){
            temp_time="5.00pm";
        }
        else if(slot.equals("12")){
            temp_time="6.00pm";
        }
       return temp_time;
    } 
}
    
