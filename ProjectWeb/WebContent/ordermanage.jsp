<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Management</title>
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
	<jsp:include page="managemenu.jsp"></jsp:include>
	<div class="w3-main" style="margin-left:250px;margin-right:40px">
		<div class="container">
			<h2 align="center">Food & Drink Management</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" style="width: 1050px">
						<div class="panel-heading" style="background-color: grey;">
							<h3 class="panel-title">Orders</h3>

						</div>
						<table class="table table-hover" id="dev-table">
							<thead>
								<tr>
									<th>STT</th>
									<th>Id Order</th>
									<th>Total bill</th>
									<th>View detail order</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${CartDao.getListCartDetail()}">
									<tr>
										<td>#<c:out value="${row.getStt()}" /></td>
										<td>#<c:out value="${row.getIdCart() }" /></td>
										<td><c:out value="${row.getTotal()}"></c:out> $</td>
										<td><a
											href="ViewCartDetail?index=<c:out value="${row.getIdCart()}"/>"><img
												alt="view detail" src="img/viewicon.png"></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>