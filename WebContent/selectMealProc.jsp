<%@page import="project.meal.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : select menu proc</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8"); 
	String[] menuArr;
	MealDataBean mealData = new MealDataBean();
	String d = request.getParameter("schoolDate");
	String mld = "";
%>
<h2><%= d %></h2>
<%

	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";

	PreparedStatement pstmt=null;
	ResultSet rs=null;

    try{
    	Class.forName(driver);
		conn = DriverManager.getConnection(url,"TRAVEL","travel");
		
        String sql = "SELECT * FROM MEAL WHERE schooldate = ?";
        pstmt = conn.prepareStatement(sql);
        System.out.println(sql);
        
		Date dd = Date.valueOf(d);
		
        pstmt.setDate(1, dd);
        rs = pstmt.executeQuery();
        
        while(rs.next()){
        	mealData.setSchoolDate(rs.getString("schooldate"));
			mealData.setSchoolTime(rs.getString("schooltime"));
			mealData.setMenu(rs.getString("menu"));
			mealData.setCal(rs.getDouble("cal"));
			mealData.setPro(rs.getDouble("pro"));
			mealData.setCa(rs.getDouble("ca"));
			mealData.setFe(rs.getDouble("fe"));
			menuArr = mealData.getMenu().split("\\$");
			
			if(mealData.getSchoolTime().equals("M")){
				mld = "조식";
			} else if(mealData.getSchoolTime().equals("L")) {
				mld = "중식";
			} else {
				mld = "석식";
			}
%>

			<div>
				<h3><%= mld %></h3>
				<%
				for(int i=0; i<menuArr.length; i++) { 
					System.out.print(menuArr[i]);
				%>
					<%= menuArr[i] %><br>
				<% } %>
					
				<br><br>
				열량 : <%= mealData.getCal() %> kcal<br>
				단백질 : <%= mealData.getPro() %> g<br>
				칼슘 : <%= mealData.getCa() %> mg<br>
				철분 : <%= mealData.getFe() %> mg<br>
				<br>
			</div>
		<% }//while %>
<%
     } catch(Exception e) {
        e.printStackTrace();    
     } finally {
    	if(rs != null) { try { rs.close(); } catch(Exception e) { } }
    	if(pstmt != null) { try { pstmt.close(); } catch(Exception e) { } }
		if(conn != null) { try { conn.close(); } catch(Exception e) { } }
    }
%>

</body>
</html>