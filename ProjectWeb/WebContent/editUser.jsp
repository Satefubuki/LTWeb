<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<c:set value="${userDetail}" var="ud"></c:set>
	<jsp:include page="menu.jsp"></jsp:include>
	<section class="top-dish-area section-gap">
	<center>
		<form class="form-horizontal"
			action="ControlUser?action=Edit&id=<c:out value="${ud.getId()}"/>"
			method="post">

			<div class="form-group">
				<label class="control-label col-sm-4">Name</label>
				<div class="col-sm-5">
					<input type="text" style="width: 500px" class="form-control"
						name="name" value="${ud.getName()}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Phone</label>
				<div class="col-sm-5">
					<input type="text" style="width: 500px" class="form-control"
						name="phone" value="${ud.getPhone()}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Address</label>
				<div class="col-sm-5">
					<input type="text" style="width: 500px" class="form-control"
						name="address" value="${ud.getAddress()}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">Email</label>
				<div class="col-sm-5">
					<input type="text" style="width: 500px" class="form-control"
						name="email" value="${ud.getEmail()}">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="primary-btn header-btn text-uppercase">Edit</button>
				</div>
			</div>

		</form>
	</center>
	</section>
</body>
</html>