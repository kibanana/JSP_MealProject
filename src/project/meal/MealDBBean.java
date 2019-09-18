package project.meal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MealDBBean {
	private static MealDBBean instance = new MealDBBean();
	
	public static MealDBBean getInstance() {
		return instance;
	}
	
	public void insertMeal(MealDataBean meal) throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		
		System.out.println(meal.getSchoolDate());
		System.out.println(meal.getSchoolTime());
		System.out.println(meal.getMenu());
		
		try {   
			
		   Class.forName(driver);
		   conn = DriverManager.getConnection(url,"MEAL","meal");
		   pstat = conn.prepareStatement("INSERT INTO meal (idx, schoolDate, schoolTime, menu, cal, pro, ca, fe) VALUES (MEALSEQUENCE.nextval, ?, ?, ?, ?, ?, ?, ?)");
			
			Date d = Date.valueOf(meal.getSchoolDate());
	        
	        pstat.setDate(1, d);
			pstat.setString(2, meal.getSchoolTime());
			pstat.setString(3, meal.getMenu());
			pstat.setDouble(4, meal.getCal());
			pstat.setDouble(5, meal.getPro());
			pstat.setDouble(6, meal.getCa());
			pstat.setDouble(7, meal.getFe());
			
			pstat.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
	}
	
}