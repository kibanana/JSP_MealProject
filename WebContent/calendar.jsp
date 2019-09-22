<%@page import="project.meal.MealDBBean"%>
<%@page import="project.meal.MealTimeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : calendar</title>
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
<style>
table {
	border-collapse: collapse;
}

table, tr, td {
	border: 1px solid darkgray;
}

td {
	padding: 5px;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>

	<%@ include file="nav.jsp"%>

	<div class="container-fluid">
		<div class="row text-white-70 bg-primary">
			<div class="col-md-12 d-flex justify-content-center">

				<form action="selectMeal.jsp" method="post" name="selectMeal">
					<div class="form-group">
						<label> <input type="date" id="now_date" name="schoolDate"
							onchange="submit()" class="form-control"
							style="margin-top: 25px; background: none; color: white; border: solid white 2px;">
							<input type="submit" class="btn btn-block" value="검색"
							style="margin-top: 10px; background: none; color: white; border: solid white 2px;">
						</label>
					</div>
				</form>

			</div>
		</div>
	</div>

<%
Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null) {
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
}

cal.set(year, month, 1);
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;

//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String intToday = sdf.format(todayCal.getTime());
System.out.println(intToday);
%>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	Date d = null;
	String mld = "";
	MealDBBean dbBean = MealDBBean.getInstance();
	List<MealTimeBean> list = dbBean.selectMealAll();
	
	int cnt = 0;
%>

	<div class="container">
		<div class="row">
			<div class="col-md-12" style="text-align: center;">

				<table id="calendar" class="table" width="100%">
					<thead class="thead-light">
						<tr>
							<th colspan="7">
								<a href="<c:url value='/calendar.jsp' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self"> <span>&lt;&lt;</span> </a> 
								<% if(month > 0 ){ %> 
								<a href="<c:url value='/calendar.jsp' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self"> <span>&lt;</span> </a> 
								<% } else { %> <span>&lt;</span> <% } %> &nbsp;&nbsp; <%=year%>년 <%=month+1%>월
									&nbsp;&nbsp; 
									<% if(month < 11 ){ %> 
										<a href="<c:url value='/calendar.jsp' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self"> <span>&gt;</span> </a> 
									<% } else { %> <span>&gt;</span> <%} %> 
									<a href="<c:url value='/calendar.jsp' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self"> <span>&gt;&gt;</span> </a>
									
									<div style="margin-top: 10px;">
										<button type="button" class="btn btn-outline-dark" onclick="javascript:location.href='<c:url value='/calendar.jsp' />'">Today</button>
									</div>
							</th>
						</tr>
					</thead>

					<tr class="table-primary">
						<td>일요일</td>
						<td>월요일</td>
						<td>화요일</td>
						<td>수요일</td>
						<td>목요일</td>
						<td>금요일</td>
						<td>토요일</td>
					</tr>
					
					<tr>
						<% 
						for(int index = 1; index < start ; index++ ) { 
							out.println("<td>&nbsp;</td>");
							newLine++;
						}
						
						for(int index = 1; index <= endDay; index++) {							
						       String color = "";

						       if(newLine == 0){color = "red";}
						       else if(newLine == 6){color = "blue";}
						       else{color = "black";}

						       String sUseDate = Integer.toString(year); 
						       sUseDate += "-";
						       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
						       sUseDate += "-";
						       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

						       String iUseDate = sUseDate;
						       
						       for(MealTimeBean bean : list) {
								   if(iUseDate.equals(bean.getSchoolDate().substring(0, 10))) {
									   cnt++;
								   }
							   }
						       
						       System.out.println(iUseDate+" : "+cnt);
						       
						       if(iUseDate.equals(intToday)) {
						    	   out.println("<td class='bg-dark text-white' nowrap>");
						       } else {
						    	   out.println("<td bgcolor='white' nowrap>");
						       }
						       %>
						       
						       <span style="color: <%= color %>;"><%= index %></span>
							   
							   <%
							   out.println("<br>");
						       // out.println("<br>" + iUseDate + "<br>");
							   
							   if(cnt == 1) {
								   out.println("조식");
							   } else if (cnt == 2) {
								   out.println("조식·중식");
							   } else if (cnt == 3) {
								   out.println("조식·중식·석식");
							   } else {
								   out.println("X");
							   }
							   
						       out.println("</td>");
						       newLine++;

						       if(newLine == 7) {
						         out.println("</tr>");
						         if(index <= endDay) {
						           out.println("<tr>");
						         }
						         newLine=0;
						       }
						       cnt = 0;
						}

						//마지막 공란 while
						while(newLine > 0 && newLine < 7){
						  out.println("<td>&nbsp;</td>");
						  newLine++;
						}
						%>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>