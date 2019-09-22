<%@page import="java.util.List"%>
<%@page import="project.meal.MealDBBean"%>
<%@page import="java.sql.Date"%>
<%@page import="project.meal.MealDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : select menu proc</title>
<script>
window.onload = function() {
	let date = new Date();
	
	let day = date.getDate();
	let month = date.getMonth() + 1;
	let year = date.getFullYear();

	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;

	let today = year + "-" + month + "-" + day;  
	document.getElementById('now_date').value = today;
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
	<div class="row text-white-70 bg-primary">
		<div class="col-md-12 d-flex justify-content-center">
		
			<form action="selectMeal.jsp" method="post" name="selectMeal">
				<div class="form-group">
					<label>
						<input type="date" id="now_date" name="schoolDate" onchange="submit()" class="form-control" style="margin-top: 25px; background: none; color: white; border: solid white 2px;">
						<input type="submit" class="btn btn-block" value="검색" style="margin-top: 10px; background: none; color: white; border: solid white 2px;">
					</label>
				</div>
			</form>
			
		</div>
	</div>
</div>

<%
	request.setCharacterEncoding("UTF-8"); 
	String[] menuArr;
	Date d = null;
	
	if (request.getParameter("schoolDate") == null) {
		d = new java.sql.Date(new java.util.Date().getTime());
	} else {
		d = Date.valueOf(request.getParameter("schoolDate"));
	}
	
	System.out.println(d);
	String mld = "";
%>

<div class="container">
	<div class="row">
	<div class="col-md-12" style="text-align: center;">
		<h2><%= d %></h2>
	</div>
<%
	MealDBBean dbBean = new MealDBBean();
	List<MealDataBean> list = dbBean.selectMeal(d);
	int cnt = 0;
	
	for(MealDataBean mealData : list) {
		cnt++;
		menuArr = mealData.getMenu().split("\\$");
		%>
		<div class="card" style="width: 33%; text-align: center;">
		<% if(mealData.getSchoolTime().equals("M")){
			mld = "조식";
		} else if(mealData.getSchoolTime().equals("L")) {
			mld = "중식";
		} else {
			mld = "석식";
		}
		%>
	   	<div class="card-header bg-primary text-white">
			<h3><%= mld %></h3>
		</div>
	    <div class="card-body"> 
			<%
			for(int i=0; i < menuArr.length; i++) { 
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
	  </div>
		
	<% }//for %>
	
	<% if(cnt == 0) { %>
		<div class="col-md-12" style="text-align: center;">
			선택하신 날의 급식정보가 없습니다
		</div>
	<% } %>
	</div>
</div>

</body>
</html>