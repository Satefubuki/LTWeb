<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>
<style type="text/css">
.row {
	margin-top: 40px;
	padding: 0 10px;
}

.clickable {
	cursor: pointer;
}

.panel-heading div {
	margin-top: -18px;
	font-size: 15px;
}

.panel-heading div span {
	margin-left: 5px;
}

.panel-body {
	display: none;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<% ArrayList<CartDetail> list = (ArrayList<CartDetail>)session.getAttribute("listCartDetail"); 
	int iduser = list.get(0).getIdUser();
	UserDetail ud = UserDAO.getUserDetail(iduser);
	session.setAttribute("userdetail", ud);
%> 
<c:set value="${listCartDetail}" var="list" ></c:set>
<c:set value="${0}" var="cost"></c:set>
<c:set value="${list.get(0).getIdUser()}" var="iduser"></c:set>
<c:set value="${UserDAO.getUserDetail(list.get(0).getIdUser())}" var="ud"></c:set>

<jsp:include page="menu.jsp"></jsp:include>

	<div class="w3-main" style="margin-left:250px;margin-right:40px">
		<div class="container">
			<h2 align="center">Food & Drink Management</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" style="width: 1050px">
						<div class="panel-heading" style="background-color: grey;">
							<h3 class="panel-title">User detail</h3>

						</div>
						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>Customer name</th>
									<th>Phone number</th>
									<th>Address</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
							<tr>
							
			<td><c:out value="${ud.getName()}"></c:out></td>
			<td><c:out value="${ud.getPhone()}"></c:out></td>
			<td><c:out value="${ud.getAddress()}"></c:out></td>
			<td><c:out value="${ud.getEmail()}"></c:out></td>
			</tr>
			</tbody>
			</table>
			<div class="panel panel-primary" style="width: 1050px">
						<div class="panel-heading" style="background-color: grey;">
							<h3 class="panel-title">Order detail</h3>

						</div>
						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>Id orders</th>
									<th>Food name</th>
									<th>Image</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Total</th>
									
								</tr>
							</thead>
							<tbody>
							
			
			<c:forEach items="${list }" var="row">
			<tr>
			<td>#<c:out value="${list.get(0).getIdCart()}"></c:out></td>
			<c:set var="cost" value="${cost+ row.getTotal()}"></c:set>
			<td><c:out value="${row.getNameFood()}"></c:out></td>
			<td><img style="width: 40px;height: 60px" src="<c:out value = "${row.getImage()}"/>"><%-- <c:out value="${row.getImage()}"></c:out> --%></td>
			<td><c:out value="${row.getQuantity()}"></c:out></td>
			<td><c:out value="${row.getPrice()}"></c:out> $</td>
			<td><c:out value="${row.getTotal()}"></c:out> $</td>
			</tr>
			</c:forEach>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><h6>Cost</h6></td>
			<td><c:out value="${cost}"></c:out> $</td>
			</tr>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><h6>Process</h6></td>
			<c:set value="${param.ud}" var="userDetail" scope="session"></c:set>
			<td><a href="EmailSendingServlet">Click <img alt="accept order" src="img/box.png"></a></td>
			</tr>
			</tbody>
			</table>
<%-- 			<c:set value="${param.ud}" var="userDetail" scope="session"></c:set>
 --%>			<%-- <%-- <%double cost =0;
			for (CartDetail cd: ${list}){ cost+= cd.getTotal();%>
			++++<%= cd.getNameFood() %>
			++++<%= cd.getImage() %>
			++++<%= cd.getQuantity() %>
			++++<%= cd.getPrice() %>
			++++<%= cd.getTotal() %><br>
			<%} %>
			----<h6>Total bill</h6>
			++++<%= cost %><br>
			----<h6>Action</h6>
			<%session.setAttribute("userdetail", ud);
			%> 
			<a href="EmailSendingServlet">Process <img alt="accept order" src="img/box.png"></a> --%>
</body>
</html>