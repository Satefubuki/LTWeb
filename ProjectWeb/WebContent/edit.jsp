<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="dao.DAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="managemenu.jsp"></jsp:include>
	<div class="w3-main" style="margin-left:250px;margin-right:40px">
		<div class="container">
		
		</br><h2 align="center" style="color: black;">Edit</h2></br>
	<center>
		<c:set var="id" value="${param.id}"></c:set>
		<%-- <sql:setDataSource var="snapshot"
						driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://ltw-midterm.mysql.database.azure.com:3306/qlgv" user="anhnguyenit@ltw-midterm"
						password="anh@17051998" />
					<sql:query dataSource="${snapshot}" var="result">
          select * from food where id='${id}';
         </sql:query> --%>
		<form class="form-horizontal" action="Control?action=Edit"
			method="post">
			<c:forEach var="row" items="${DAO.getList()}">
				<c:choose>
					<c:when test="${row.id.equals(param.id)}">
						<div class="form-group">
							<label class="control-label col-sm-4">Type</label>
							<div class="col-sm-5">
								<select style="width: 500px" class=" form-control" name="type">
									<option value="s">Starter appetizer</option>
									<option value="salad">Market Fresh Salads</option>
									<option value="sea">Seafood, Chicken & Pasta</option>
									<option value="buger">Burgers, Wraps & Paninis</option>
									<option value="wine">Beverages-Wine</option>
									<option value="juice">Beverages-Juice</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">ID</label>
							<div class="col-sm-5">
								<input type="text" style="width: 500px" class="form-control"
									name="id" value="${row.id}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Name</label>
							<div class="col-sm-5">
								<input type="text" style="width: 500px" class="form-control"
									id="" name="name" value="${row.name}">
							</div>
						</div>
						<%-- <div class="form-group">
      <label class="control-label col-sm-4" >Image</label>
      <div class="col-sm-5">          
        <input type="text" style="width: 500px" class="form-control" id="" name="image" value="${row.image}">
      </div>
    </div> --%>
						<div class="form-group">
							<label class="control-label col-sm-4">Description</label>
							<div class="col-sm-5">
								<input type="textarea" style="width: 500px" class="form-control"
									name="des" value="${row.description}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Price</label>
							<div class="col-sm-5">
								<input type="text" style="width: 500px" class="form-control"
									name="price" value="${row.price}">
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-danger" style="width: 200px">Edit</button>
				</div>
			</div>

		</form>
	</center>
	</div></div>

</body>
</html>