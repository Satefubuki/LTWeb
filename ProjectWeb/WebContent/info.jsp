<%@page import="java.util.ArrayList"%>
<%@page import="model.FoodAndDrink"%>
<%@page import="java.util.List"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dao.DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Food & Drink Management</title>
	<style type="text/css">
		.row {  
			margin-top:40px;    
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
			margin-left:5px;
		}
		.panel-body {   
			display: none;
		}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	

</head>
<body>
<c:set value="${userDetail}" var="ud"></c:set>
<jsp:include page="menu.jsp"></jsp:include>
	<section class="top-dish-area section-gap" id="dish">
		<div class="container">
			<h2 align="center">Food & Drink Management</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">User Infomation</h3>

						</div>
						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>Id user</th>
									<th>Name</th>
									<th>Phone</th>
									<th>Address</th>
									<th>Mail</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
							<tr>
							<td><c:out value="${ud.getId()}"></c:out></td>
							<td><c:out value="${ud.getName()}"></c:out></td>
							<td><c:out value="${ud.getPhone()}"></c:out></td>
							<td><c:out value="${ud.getAddress()}"></c:out></td>
							<td><c:out value="${ud.getEmail()}"></c:out></td>
							<td><a href="editUser.jsp?id=<c:out value = "${ud.getId()}"/>"><button class="btn btn-primary">Edit</button></a></td>
							</tr>
							</tbody>
							</table>
							
</body>
</html>