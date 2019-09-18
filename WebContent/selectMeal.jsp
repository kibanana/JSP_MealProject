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

<script>
window.onload = function() {
	document.getElementById('now_date').valueAsDate = new Date();
}

function submit (){
	let frm = document.selectMeal;
	frm.submit();
}
</script>
<title>School Meal : select menu</title>
</head>
<body>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h3 class="display-4">급식 메뉴 보기</h3>
  </div>
</div>

<div class="container-fluid text-white-70 bg-dark">
	<div class="row">
		<div class="col-md-12 d-flex justify-content-center">
		
			<form action="selectMealProc.jsp" method="post" name="selectMeal">
				<div class="form-group">
					<label>
						<input type="date" id="now_date" name="schoolDate" onchange="submit()" class="form-control" style="margin-top: 25px; background: none; color: white; border: solid white 2px;">
					</label>
				</div>
			</form>
			
		</div>
	</div>
</div>
</body>
</html>