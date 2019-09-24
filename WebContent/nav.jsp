<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<title>Insert title here</title>

<script>
$('ul li').on('click', function() {
	$('li').removeClass('active');
	$(this).addClass('active');
});
</script>

<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 1rem;
}

.vertical-menu {
  width: 200px;
  height: 100%;
  margin-left: 0;
  padding-left: 0;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #4CAF50;
  color: white;
}
</style>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a href="selectMealAnd.jsp" class="nav-link text-primary"><i class="fas fa-mouse-pointer" style="margin-right: 10px"></i> SELECT</a>
	    </li>
	    <li class="nav-item">
	      <a href="selectMeal.jsp" class="nav-link text-primary"><i class="fas fa-mouse-pointer" style="margin-right: 10px"></i> TODAY</a>
	    </li>
	    <li class="nav-item">
	      <a href="calendar.jsp" class="nav-link text-primary"><i class="fa fa-calendar" style="margin-right: 10px"></i> Calendar</a>
	    </li>
	     <li class="nav-item">
	      <a href="graph.jsp" class="nav-link text-primary"><i class="fa fa-signal" style="margin-right: 10px"></i> Graph</a>
	    </li>
	    <li class="nav-item">
	      <a href="addMeal.jsp" class="nav-link text-primary"><i class="fa fa-plus" style="margin-right: 10px"></i> Add Meal</a>
	    </li>
	  </ul>
	</nav>
</body>
</html>