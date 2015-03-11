package roti;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ___IniDB {

	//private static final String DATAUSERNAME = "root";
	//private static final String DATAPASSWORD = "2289";
	private static final String DATAUSERNAME = "aj_newyork_root";
	private static final String DATAPASSWORD = "al171717";
	private static final String DATADRIVERCLASS = "com.mysql.jdbc.Driver";

	private Connection con = null;

	public ___IniDB(){

		try {
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sea_enshini_luxury?useUnicode=true&characterEncoding=UTF-8", "root", "2289");
			//con = DriverManager.getConnection("jdbc:mysql://aa4ysny85g4puw.cmhz5a9pxmtn.ap-southeast-1.rds.amazonaws.com:3306/sea_enshini_luxury?useUnicode=true&characterEncoding=UTF-8", DB_NAME, DB_PASS);
			
			Class.forName(DATADRIVERCLASS);
			
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hunyin?useUnicode=true&characterEncoding=UTF-8", DATAUSERNAME , DATAPASSWORD);
			con = DriverManager.getConnection("jdbc:mysql://aj-newyork-dev-db-instance.csfqe4okqais.us-east-1.rds.amazonaws.com:3306/hunyin?useUnicode=true&amp;characterEncoding=UTF-8", DATAUSERNAME , DATAPASSWORD);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ___IniDB(String dbName){

		try {
			
			Class.forName(DATADRIVERCLASS);
			
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hunyin?useUnicode=true&characterEncoding=UTF-8", DATAUSERNAME , DATAPASSWORD);
			con = DriverManager.getConnection("jdbc:mysql://aj-newyork-dev-db-instance.csfqe4okqais.us-east-1.rds.amazonaws.com:3306/"+dbName+"?useUnicode=true&amp;characterEncoding=UTF-8", DATAUSERNAME , DATAPASSWORD);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected Connection getConnection(){
		return con;
	}

	protected void setClose(){
		try {
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
