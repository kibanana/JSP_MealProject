<%@page import="project.meal.MealDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : add menu proc</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="meal" class="project.meal.MealDataBean" scope="request" />
<jsp:setProperty property="*" name="meal"/>

<%
	MealDBBean dbBean = new MealDBBean();
	dbBean.insertMeal(meal);
%>

<meta http-equiv="refresh" content="1; url=addMeal.jsp">

</body>
</html>