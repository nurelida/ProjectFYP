/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FYPManagementSys_Bean;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
/**
 *
 * @author rou
 */
public class Semester {
    public static String getSemester(){
		Date date = new Date();
		DateFormat df;

		df = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(df.format(date));

		df = new SimpleDateFormat("MM");
		int month = Integer.parseInt(df.format(date));
                
		if(month == 1)
			return Integer.toString(year - 1 ) + Integer.toString(year) + "1";
		else if(month >=2 && month <=4)
			return Integer.toString(year - 1) + Integer.toString(year) + "2";
                else if(month >=5 &&month <= 8)
			return Integer.toString(year - 1) + Integer.toString(year) + "3";
		else if(month >= 9 && month <= 12)
			return Integer.toString(year) + Integer.toString(year + 1) + "1";
		else
			return null;
	}
    public static String generateSem(String sem){
		String sem1 = "";
		String sem2 = "";
		String session = "";
		String newSem = "";
		sem1 = sem.substring(0,4);
		sem2 = sem.substring(4,8);
		session = sem.substring(8,9);
		if(session.equals("1")){
			newSem=sem1+sem2+"2";
		}
		else{
			newSem = Integer.toString(Integer.parseInt(sem1)+1)+Integer.toString(Integer.parseInt(sem2)+1)+"1";
		}
		return newSem;	
	}
}
