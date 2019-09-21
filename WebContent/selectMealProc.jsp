<%@page import="java.util.List"%>
<%@page import="project.meal.MealDBBean"%>
<%@page import="java.sql.Date"%>
<%@page import="project.meal.MealDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : select menu proc</title>
<script>
window.onload = function() {
	document.getElementById('now_date').valueAsDate = new Date();
}

function submit (){
	let frm = document.selectMeal;
	frm.submit();
}
</script>
</head>
<body>

<%@ include file="nav.jsp" %>

<div class="container-fluid">
	<div class="row text-white-70 bg-dark">
		<div class="col-md-12 d-flex justify-content-center">
		
			<form action="selectMealProc.jsp" method="post" name="selectMeal">
				<div class="form-group">
					<label>
						<input type="date" id="now_date" name="schoolDate" onchange="submit()" class="form-control" style="margin-top: 25px; background: none; color: white; border: solid white 2px;">
						<input type="submit" class="btn btn-outline-success">
					</label>
				</div>
			</form>
			
		</div>
	</div>
</div>

<%
	request.setCharacterEncoding("UTF-8"); 
	String[] menuArr;
	
	Date d = Date.valueOf(request.getParameter("schoolDate"));
	
	String mld = "";
%>

<h2><%= d %></h2>

<%
	MealDBBean dbBean = new MealDBBean();
	List<MealDataBean> list = dbBean.selectMeal(d);

	for(MealDataBean mealData : list) {
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
	<% }//for %>
</body>
</html>