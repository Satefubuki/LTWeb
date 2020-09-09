<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.CartDao"%>


<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/res.png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Shopping Cart</title>
<link rel="shortcut icon" type="image/png" href="images/icon8.png" />
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="" crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="" crossorigin="anonymous">
<link rel="stylesheet" href="css/boxstyle.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="" crossorigin="anonymous"></script>
</head>

<body>

	<jsp:include page="menu.jsp"></jsp:include>
	</br>
	</br>
	</br>
	<form action="CartControl" method="get">


		<div class="container">
			<h2 class="text-center _title">My Order</h2>
			</br> <a href="forstarter.jsp"
				style="background-color: red; right: 1px; color: white;" class="btn">Continue
				Order</a>
			<div class="table-responsive">
				<table class="table">

					<thead>
						<tr style="font-weight: bold; color: black;">

							<th>Name</th>
							<th>Image</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Manipulation</th>

						</tr>

						<%
							//ArrayList<FoodAndDrink> list = CartDao.getCart();
							//for(int i= 0; i< list.size(); i++){
						%>
					</thead>
					<c:forEach var="row" items="${CartDao.getCart()}">

						<tr>

							<th><c:out value="${row.name}" /></th>
							<th><img src="<c:out value = "${row.image}"/>" width="40px"
								height="45px"></th>
							<th style="color: red;"><a style="color: blue;">$</a>
							<c:out value="${row.price}" /></th>
							<th><c:out value="${row.quantity}" /></th>
							<th style="color: red;"><a style="color: blue;">$</a>
							<c:out value="${row.quantity * row.price}" /></th>
							<th><a type="submit" class="btn btn-danger"
								href="CartControl?action=Delete&index=<c:out value = "${row.id}"/>"
								aria-label="Center Align"> <span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</a></th>
						</tr>
					</c:forEach>
				</table>
			</div>
	</form>
	<div class="itemWrapper">
		<div class="itemContainer">
			<center>
				<a href="CartControl?action=Pay" class="btn btn-success" href="">
					<i class="fa fa-usd w3-margin-right"></i>Pay
				</a>

			</center>
		</div>
	</div>

</body>
</html>