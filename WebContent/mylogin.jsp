<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 설정 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!-- 웹에서 가져오는 방법 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- 당장은 필요없다 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  


<style type="text/css">

.nav_scrren{
	margin-top: 30px;
	background-color: #CD853F;
	height: 50px;
	border-radius: 5px;
}

.brand_logo_nav{
	margin-top: auto;
	position: center;
	height: 100px;
	width: 100px;
	top: -75px;
	border-radius: 50%;
	background: #D7A35D;
	padding: 10px;
	
}
.brand_nav{
	height: 80px;
	width: 80px;
	position: center;
	border-radius: 50%;
	border: 2px solid white; 
} 
.main_login_out{
	margin-top: 30px;
	margin-left: 15px;
	padding-top: 40px;
	width: 300px;
	height: 200px;
	float: right;
	border-radius: 5px;
	background-color: #CD853F;
	text-align: center;
	color: #ffffff;
	float: right;
}

.btn_login{
	margin-top: auto;
	width: 100px;
	height: 40px;
	border-radius: 5px;
	background-color: #8B4513;
	color: #fff;
}
.user_card {
		height: 400px;
		width: 350px;
		margin-top: auto;
		margin-bottom: auto;
		background: #8B4513;
		position: relative;
		display: flex;
		justify-content: center;
		flex-direction: column;
		padding: 10px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		-webkit-box-shadow: 0 4px 8px 0  rgba(0, 0, 0, 0.2),  0 6px 20px 0 rgba(0, 0, 0, 0.19)  ;
		-moz-box-shadow: 0 4px 8px 0  rgba(0, 0, 0, 0.2),  0 6px 20px 0 rgba(0, 0, 0, 0.19)  ;
		border-radius: 5px;
}

.brand_logo_container {
		position: absolute;
		height: 170px;
		width: 170px;
		top: -75px;
		border-radius: 50%;
		background: #d2d2d2;
		padding: 10px;
		text-align: center;
}

.brand_logo {
	height: 150px;
	width: 150px;
	border-radius: 50%;
	border: 2px solid white; 	
}

.btn_close{
	text-align: right;
}
.form_container {
	margin-top: 100px;
}
.login_btn {
	width: 100%;
	background: #c0392b !important;
	color: white !important;
}
.login_btn:focus {
	box-shadow: none !important;
	outline: 0px !important;
}
.login_container {
	padding: 0 2rem;
}
.input-group-text {
	background: #c0392b !important;
	color: white !important;
	border: 0 !important;
	border-radius: 0.25rem 0 0 0.25rem !important;
}
.input_user,
.input_pass:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.form_container {
	margin-top: 100px;
}

.main_screen{
	color: #ffffff;
	background-color: #CD853F;
	margin-top: 30px;
 	float: left;
 	width: 750px;
 	height: 1000px;
 	border: 5px #8B4513;
 	border-radius: 5px;
 	/* border-color: #8B4513; */
}
.carousel_screen{
	margin: 40px;
	float: left;
	position: center;
	width: 650px;
	height: 500px;
	border: 5px #8B4513 solid;
	border-radius: 5px
}

.image1{
	width: 650px;
	height: 490px;
}

.image2{
	width: 650px;
	height: 490px;
}

.image3{
	width: 650px;
	height: 490px;
}

.foot_screen{
	width: auto;
	height: auto;
}

</style>
</head>
<body>

<div class="main_login_out">
		<h3 align="center">Login</h3>
		<div class="d-flex justify-content-center">
			<button type="button" class="btn btn_login" data-toggle="modal"
			data-target="#exampleModal">Login</button>
		</div>
		
		<!-- modal 테두리 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModallabel" aria-hidden="true">

			<!-- modal 본체 -->
			<div class="modal-dialog d-flex justify-content-center h-100" role="document">
				<!-- modal 내용 -->
				<div class="modal-content user_card">
					<div class="d-flex justify-content-center">
						<div class="brand_logo_container">
							<img src="./images/gom.jpg" class="brand_logo" alt="Logo">
						</div>
					</div>
					
					<button type="button" class="close btn_close" data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>
					</button>
					
					<div class="d-flex justify-content-center">
						<!-- 기본틀 -->
						<div class="d-flex justify-content-center form_container">
							<form>
								<div class="input-group mb-3">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="id" id="_id" class="form-control input_user" value="" placeholder="username"> <!-- ID입력 칸 -->
								</div>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-key"></i></span>
									</div>
									<input type="password" name="pwd" id="_pwd" class="form-control input_pass" value="" placeholder="password"> <!-- PW입력 칸 -->
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customControlInline">
										<label class="custom-control-label" for="customControlInline">Remember me</label>
									</div>
								</div>
								
								<div class="d-flex justify-content-center mt-3 login_container">
							 	<button type="button" name="button" class="btn login_btn">Login</button>
							    </div>
							</form>
						</div>
					</div>
					<div class="mt-4 sign_up">
						<div class="d-flex justify-content-center links">
							Don't have an account? <a href="regi.jsp" class="ml-2">Sign Up</a>
						</div>
						<div class="d-flex justify-content-center links">
							<a href="#">Forgot your password?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>