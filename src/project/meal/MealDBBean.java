package project.meal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<MealDataBean> selectMeal(Date d) throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		List<MealDataBean> list = new ArrayList<MealDataBean>();
		
	    try{
	    	Class.forName(driver);
			conn = DriverManager.getConnection(url,"MEAL","meal");
			
	        String sql = "SELECT * FROM MEAL WHERE schooldate = ?";
	        pstat = conn.prepareStatement(sql);
	        
	        pstat.setDate(1, d);
	        ResultSet rs = pstat.executeQuery();

	        while(rs.next()){
	    		MealDataBean mealData = new MealDataBean();
	        	mealData.setSchoolDate(rs.getString("schooldate"));
	    		mealData.setSchoolTime(rs.getString("schooltime"));
	    		mealData.setMenu(rs.getString("menu"));
	    		mealData.setCal(rs.getDouble("cal"));
	    		mealData.setPro(rs.getDouble("pro"));
	    		mealData.setCa(rs.getDouble("ca"));
	    		mealData.setFe(rs.getDouble("fe"));
	        	list.add(mealData);
	        }
	        
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
		return list;
	}
	
	public MealDataBean selectMealAnd(Date d, String mld) throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		MealDataBean mealData = null;
		
		System.out.println(d);
		System.out.println(mld);
		
	    try{
	    	Class.forName(driver);
			conn = DriverManager.getConnection(url,"MEAL","meal");
			
	        String sql = "SELECT * FROM MEAL WHERE schooldate = ? AND schooltime = ?";
	        pstat = conn.prepareStatement(sql);
	        
	        pstat.setDate(1, d);
	        pstat.setString(2, mld);
	        ResultSet rs = pstat.executeQuery();

	        while(rs.next()){
	        	mealData = new MealDataBean();
	        	mealData.setSchoolDate(rs.getString("schooldate"));
	    		mealData.setSchoolTime(rs.getString("schooltime"));
	    		mealData.setMenu(rs.getString("menu"));
	    		mealData.setCal(rs.getDouble("cal"));
	    		mealData.setPro(rs.getDouble("pro"));
	    		mealData.setCa(rs.getDouble("ca"));
	    		mealData.setFe(rs.getDouble("fe"));
	    		
	    		System.out.println(mealData);
	        }
	        
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
		return mealData;
	}
	
	
	public List<MealTimeBean> selectMealAll() throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		List<MealTimeBean> list = new ArrayList<MealTimeBean>();
		
	    try{
	    	Class.forName(driver);
			conn = DriverManager.getConnection(url,"MEAL","meal");
			
	        String sql = "SELECT * FROM MEAL";
	        pstat = conn.prepareStatement(sql);
	        ResultSet rs = pstat.executeQuery();

	        while(rs.next()){
	        	MealTimeBean mealData = new MealTimeBean();
	        	mealData.setSchoolDate(rs.getString("schooldate"));
	    		mealData.setSchoolTime(rs.getString("schooltime"));
	    		System.out.println(mealData);
	        	list.add(mealData);
	        }
	        
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
		return list;
	}
	
	public List<MealDataBean> selectMealGraph() throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		List<MealDataBean> list = new ArrayList<MealDataBean>();
		
	    try{
	    	Class.forName(driver);
			conn = DriverManager.getConnection(url,"MEAL","meal");
			
	        String sql = "SELECT * FROM MEAL WHERE reco != 0";
	        pstat = conn.prepareStatement(sql);
	        ResultSet rs = pstat.executeQuery();

	        while(rs.next()){
	        	MealDataBean mealData = new MealDataBean();
	        	mealData.setSchoolDate(rs.getString("schooldate"));
	    		mealData.setSchoolTime(rs.getString("schooltime"));
	    		mealData.setReco(rs.getInt("reco"));
	        	list.add(mealData);
	        }
	        
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
		return list;
	}
	
	public void updateReco(Date d, String mld) throws Exception {
		Connection conn=null;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		PreparedStatement pstat=null;
		
	    try{
	    	Class.forName(driver);
			conn = DriverManager.getConnection(url,"MEAL","meal");
			
	        String sql = "UPDATE MEAL SET RECO = RECO+1 WHERE schooldate = ? AND schooltime = ?";
	        pstat = conn.prepareStatement(sql);
	        pstat.setDate(1, d);
	        pstat.setString(2, mld);
	        pstat.executeUpdate();
	        
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstat != null) { try { pstat.close(); } catch(Exception e) { } }
			if(conn != null) { try { conn.close(); } catch(Exception e) { } }
		}
	}
	
}