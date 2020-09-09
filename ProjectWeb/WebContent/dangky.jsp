<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register-Group21</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main1.css">
<!--===============================================================================================-->
</head>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body style="color: red">
	<%@ include file="menu.jsp"%>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form"
					action="LogControl?action=Register" method="post">
					<span class="login100-form-title p-b-70" style="color: black">
						Welcome </span> <span class="login100-form-avatar"> <img
						src="img/logo.png" alt="AVATAR">
					</span>

					<div class="wrap-input100 validate-input m-t-85 m-b-35"
						data-validate="Enter username">
						<input class="input100" type="text" style="color: black"
							name="username" required> <span class="focus-input100"
							data-placeholder="Username"></span>
					</div>
					<c:choose>
						<c:when test="${requestScope.user_err != null}">
							<c:out value="${requestScope.user_err}" />
							<br />
						</c:when>
					</c:choose>
					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter password">
						<input class="input100" type="password" style="color: black"
							name="pass" required> <span class="focus-input100"
							data-placeholder="Password"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Retype password">
						<input class="input100" type="password" style="color: black"
							name="repass" required> <span class="focus-input100"
							data-placeholder="Retype Password"></span>

					</div>
					<c:choose>
						<c:when test="${requestScope.pass_err != null}">
							<c:out value="${requestScope.pass_err}" />
							<br />
						</c:when>
					</c:choose>

					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter your fullname">
						<input class="input100" type="text" style="color: black"
							name="name" required> <span class="focus-input100"
							data-placeholder="Full name"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter your phone">
						<input class="input100" type="text" style="color: black"
							name="phone" required> <span class="focus-input100"
							data-placeholder="Phone"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter your address">
						<input class="input100" type="text" style="color: black"
							name="address" required> <span class="focus-input100"
							data-placeholder="Address"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter your email">
						<input class="input100" type="text" style="color: black"
							name="email" required> <span class="focus-input100"
							data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50"
						data-validate="Enter your birthday">
						<input class="input100" type="text" style="color: black"
							name="birthday" required> <span class="focus-input100"
							data-placeholder="Birthday"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Register</button>
					</div>

					<ul class="login-more p-t-190">
						<li class="m-b-8"><span class="txt1"> Forgot </span> <a
							href="forgot.jsp" class="txt2"> Username / Password? </a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main1.js"></script>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>