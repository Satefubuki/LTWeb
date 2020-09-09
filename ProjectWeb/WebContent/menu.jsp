<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<header id="header" id="home">
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.jsp"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.jsp">Home</a></li>
						
						
						<li><a href="about.jsp">About</a></li>
						<li class="menu-has-children"><a href="">Dish</a>
							<ul>
								<li class="menu-has-children"><a href="starter.jsp">Starer appetizer</a>
									
								<li class="menu-has-children"><a href="seafood.jsp">Seafood, Chicken & Pasta</a>
								<li class="menu-has-children"><a href="salad.jsp">Market Fresh Salads</a>
								<li class="menu-has-children"><a href="burger.jsp">Burgers,Wraps & Paninis</a>
								<li class="menu-has-children"><a href="wine.jsp">Wine</a>
								<li class="menu-has-children"><a href="juice.jsp">Juice</a>
								
							</ul></li>
						<c:if test="${!empty userNameLogin && userNameLogin == 'admin'}">
						<li><a href="foodmanage.jsp">Manage</a></li>
							</c:if>
						<li><a href="#contact">Contact</a></li>
						<li><a href="cart.jsp">Cart</a></li>
						<c:if test="${empty resultLogin}">
						
						<li class="menu-has-children"><a href="">Profiles</a>
						<ul>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="dangky.jsp">Register</a></li>
						</ul>
						</li>
						</c:if>
						<c:if test="${resultLogin=='success'}">
						<li class="menu-has-children"><a href="">Hello, ${userNameLogin}</a>
						<ul>
						<li><a href="info.jsp">Info</a></li>
						<%-- <li><a href="ControlUser?pass=<c:out value="${pass}"/>&action=changepass">Change password</a></li> --%>
						<li><a href="changepass.jsp">Change password</a></li>
						<li><a href="logout.jsp">Log out</a></li>
						</ul>
						</li>
						</c:if>
												
						

					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- #header -->
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