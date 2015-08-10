package FYPManagementSys_Bean;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class DB{
	
	public final static String DRIVER_MYSQL = "com.mysql.jdbc.Driver";
        public final static String DRIVERMGRCONN_MYSQL = "jdbc:mysql:";

	private Connection conn;
	private ResultSet rs;
	private Statement statement;
	private String db;
	private String user;
	private String pwd;
	private String driver;
	private String driverMgrConn;

	public DB(){
		rs = null;
      statement = null;
     /*
      db = "//se.fsksm.utm.my:3306/finalyearproject";  
      user = "hishammuddin";
      pwd = "sulit";
      */
      
      ///*
      db = "//localhost:3306/finalyearproject";  
      user = "root";
      pwd = "elisaelida";
      //*/
      
      /*
      db = "//localhost:3307/ipproject?autoReconnect=true";
      user = "ipproject";
      pwd = "scj2303";
      //*/

      /*
      db = "//localhost:3307/ipproject";
      user = "root";
      pwd = "scj2303";
      //*/

      driver = DRIVER_MYSQL;
      driverMgrConn = DRIVERMGRCONN_MYSQL;
   }

   public boolean connect(){
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(driverMgrConn + db , user, pwd);

			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/ipproject?autoReconnect=true");

			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalyearproject?user=root&password=123&autoReconnect=true");

			conn.setAutoCommit(false);

			return true;
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return false;
		}
		catch(ClassNotFoundException classEx){
			System.out.println(classEx.getMessage());

			return false;
		}
   }

   public boolean query(String sql){
		try{
			if(sql.substring(0, 6).toLowerCase().equals("select")){
				statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = statement.executeQuery(sql);
			}
			else{
				statement = conn.createStatement();
				statement.executeUpdate(sql);
			}

			return true;
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return false;
		}
	}

	public void rollback(){
   	try{
   		conn.rollback();
   	}
   	catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());
		}
   }

   public int getNumberOfRows(){
		try{
			rs.last();

			return rs.getRow();
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return 0;
		}
	}
	public String getDataAt(int row, String columnName){
		try{
			rs.absolute(row+1);

			return rs.getString(columnName);
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return null;
		}
	}
	public void close(){
		try{
			statement.close();
			conn.commit();
			conn.close();
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());
		}
	}
}