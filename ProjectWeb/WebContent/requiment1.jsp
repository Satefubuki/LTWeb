<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/res.png" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<!-- Site Title -->
<title>Requiment lab1 - Group21</title>

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
<body>
	<%@ include file="menu.jsp"%>
	<div class="section-top-border container">
		<h3 class="mb-30">Group diary</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#requirement">Requiment</a></li>
			<li><a data-toggle="tab" href="#design">Design</a></li>
			<li><a data-toggle="tab" href="#implement">Design</a></li>
		</ul>
		<div class="tab-content">
			<div id="requirement" class="tab-pane fade in active">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Chức năng</th>
							<th>Người đề xuất</th>
							<th>Người thiết kế</th>
							<th>Người hiện thực</th>
							<th>Thời gian dự kiến</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01</td>
							<td></td>
							<td></td>
							<td></td>
							<td>Ho Quang Thanh</td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
						<tr>
							<td>02</td>
							<td></td>
							<td></td>
							<td></td>
							<td>Mai Quang Thinh</td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
						<tr>
							<td>03</td>
							<td></td>
							<td></td>
							<td></td>
							<td>Nguyen Duc Anh</td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
						<tr>
							<td>04</td>
							<td></td>
							<td></td>
							<td></td>
							<td>Tran Nguyen Anh Thong</td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="design" class="tab-pane fade">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Chức năng</th>
							<th>Người đề xuất</th>
							<th>Người thiết kế</th>
							<th>Người hiện thực</th>
							<th>Thời gian dự kiến</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="implement" class="tab-pane fade">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>STT</th>
							<th>Chức năng</th>
							<th>Người đề xuất</th>
							<th>Người thiết kế</th>
							<th>Người hiện thực</th>
							<th>Thời gian dự kiến</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><div class="percentage">
									<div class="progress">
										<div class="progress-bar color-1" role="progressbar"
											style="width: 0%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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