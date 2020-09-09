<%@page import="java.util.ArrayList"%>
<%@page import="model.FoodAndDrink"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</head>
<body>
	<jsp:include page="managemenu.jsp"></jsp:include>
	
	<div class="w3-main" style="margin-left:250px;margin-right:40px">
		<div class="container">
			<h2 align="center">Food & Drink Management</h2>
		<center>	<a href="add.jsp"><button class="btn btn-warning"
						style="margin-left: 15px;height: 40px;width: 160px">Add to menu</button></a>
	</center>
			
				

				<div style="margin-top: 25px" class="col-md-12">
<form action="Control?action=Search" method="post">
					<c:set value="${DAO.getList()}" var="listFood" />
					<c:set value="${requestScope.listSearch}" var="listSearch" />
					<c:if test="${listSearch != null}">
						<c:set value="${listSearch}" var="listFood" />
					</c:if>
					<input type="text"
						style="width: 400px;margin-left: 575px"
						name="search"> <button type="submit" class="btn" style="width: 70px"><i class="fa fa-search"></i></button>
				</form>



					<div class="panel panel-primary" style="width: 1050px">
						<div class="panel-heading" style="background-color: grey;">
							<h3 class="panel-title">Dish</h3>

						</div>
						


						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>Type</th>
									<th>ID</th>
									<th>Name</th>
									<th>Image</th>
									<th>Description</th>
									<th>Price</th>
									<th>Image</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${listFood}">
									<tr>
										<td><c:out value="${row.type}" /></td>
										<td><c:out value="${row.id}" /></td>
										<td><c:out value="${row.name}" /></td>
										<td><img style="width: 40px; height: 60px"
											src="<c:out value = "${row.image}"/>"></td>
										<td><c:out value="${row.description}" /></td>
										<td><c:out value="${row.price}" /></td>
										<td><a href="upload.jsp?id=${row.id}"><button
													class="btn btn-default">Upload</button></a></td>
										<td><a href="edit.jsp?id=<c:out value = "${row.id}"/>"><button
													class="btn btn-primary">Edit</button></a></td>
										<td><a
											href="Control?id=<c:out value = "${row.id}"/>&action=Delete"><button
													class="btn btn-danger">Delete</button></a></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
</div>


</body>
</html>