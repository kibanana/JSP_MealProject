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
	function chk_meal(){
		let frm = document.addMeal;
		let message = document.getElementById("failMessage");
		
		if(!frm.menu.value) {
			frm.menu.focus();
			message.innerHTML = "메뉴를 입력해주세요";
		} else if(!frm.cal.value) {
			frm.cal.focus();
			message.innerHTML = "칼로리를 입력해주세요";
		} else if(!frm.cal.value) {
			frm.cal.focus();
			message.innerHTML = "단백질을 입력해주세요";
		} else if(!frm.ca.value) {
			frm.ca.focus();
			message.innerHTML = "칼슘을 입력해주세요";
		} else if(!frm.fe.value) {
			frm.fe.focus();
			message.innerHTML = "철분을 입력해주세요";
		} else {
			frm.submit();
		}
	}
</script>
	
<title>School Meal : add menu</title>
</head>
<body>


<%@ include file="nav.jsp" %>

<div class="jumbotron jumbotron-fluid">
 <div class="container">
   <h3 class="display-4">급식 메뉴 입력</h3>
 </div>
</div>
		
<div class="container">
	<div class="row">
		
		<div class="col-md-8 col-md-offset-2">
			<form action="addMealProc.jsp" method="post" name="addMeal">
				<div class="form-group">
					<label>
						날짜
						<input type="date" name="schoolDate" class="form-control">
					</label>
				</div>
				
				<div class="form-group">
					<label>
						<select name="schoolTime" class="form-control">
							<option value="M">조식</option>
							<option value="L">중식</option>
							<option value="D">석식</option>
						</select>
					</label>
				</div>
				
				<div class="form-group">
					<label>
						메뉴
						<textarea name="menu" placeholder="$로 메뉴를 구분해서 입력해주세요" class="form-control" cols="50"></textarea>
					</label>
				</div>
				
				<div class="form-group">
					<label>
						칼로리
						<input type="text" name="cal" class="form-control" step="0.1">
					</label>
					
					<label>
						단백질
						<input type="text" name="pro" class="form-control" step="0.1">
					</label>
					
					<label>
						칼슘
						<input type="text" name="ca" class="form-control" step="0.1">
					</label>
					
					<label>
						철분
						<input type="text" name="fe" class="form-control" step="0.1">
					</label>
				</div>
				
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
				
				<button type="button" onClick="chk_meal()" class="form-control btn btn-outline-success btn-lg btn-block">저장</button>
				<input type="reset" value="양식 초기화" class="form-control btn btn-outline-warning btn-lg btn-block">
			</form>
			
		</div>
	</div>
</div>
</body>
</html>