<%@page import="project.meal.MealDataBean"%>
<%@page import="java.util.List"%>
<%@page import="project.meal.MealDBBean"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
	Date d = null;
	String mld = null;
	MealDBBean dbBean = new MealDBBean();
	
	if (request.getParameter("d") == null) {
		
	} else {
		d = Date.valueOf(request.getParameter("d"));
		mld = request.getParameter("mld");
		
		dbBean.updateReco(d, mld);
	}
	
	List<MealDataBean> list = dbBean.selectMealGraph();
%>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
        	['Date', 'Like Count', '*'],
        	
        	<%
        	for(MealDataBean bean : list) {
        		String result = null;
        		if(bean.getSchoolTime().equals("M")){
        			result = "조식";
        		} else if(bean.getSchoolTime().equals("L")) {
        			result = "중식";
        		} else {
        			result = "석식";
        		}
        		
        	%>
            ['<%=bean.getSchoolDate().substring(0,10) + " " + result %>',  <%=bean.getReco() %>, <%=bean.getReco() %>],
        	<%
        	}
        	%>
        ]);

        var options = {
          title : 'Date&Time by Like Count',
          vAxis: {title: 'Like Count', format: '#,###.##'},
          hAxis: {title: 'Date and Time', format: '#,###.##'},
          seriesType: 'bars',
          series: {1: {type: 'line'}}, 
        }

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
<%@ include file="nav.jsp"%>
<div class="container-fluid">
	<div class="row">
	<div id="chart_div" style="width: 100%; height: 500px;"></div>
	</div>
</div>
</body>
</html>