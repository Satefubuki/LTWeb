<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" type="image/png" href="img/res.png" />
<title>Add</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body style="color: red;">
	<jsp:include page="managemenu.jsp"></jsp:include>
	<div class="w3-main" style="margin-left:250px;margin-right:40px">
		<div class="container">
		
		</br><h2 align="center" style="color: black;">Add Food</h2></br>
		<center>
			<form class="form-horizontal" action="Control?action=Add"
				method="post">
				<label class="control-label col-sm-4" style="color: black;">Type</label>
				<div class="form-group">
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
					<label class="control-label col-sm-4" style="color: black;">ID</label>
					<div class="col-sm-5">
						<input type="text" style="width: 500px" class="form-control"
							name="id" value="${requestScope.id}">
					</div>

				</div>
				<c:choose>
					<c:when test="${requestScope.id_err != null}">
						<c:out value="${requestScope.id_err}" />
						<br />
					</c:when>
				</c:choose>
				<div class="form-group">
					<label class="control-label col-sm-4" style="color: black;">Name</label>
					<div class="col-sm-5">
						<input type="text" style="width: 500px" class="form-control" id=""
							name="name" value="${requestScope.name}">
					</div>
				</div>
				<c:choose>
					<c:when test="${requestScope.name.equals('')}">
						<c:out value="${requestScope.name_err}" />

					</c:when>
				</c:choose>

				<%-- <div class="form-group">
				<label class="control-label col-sm-4" style="color: black;">Image</label>
				<div class="col-sm-5">
					<input type="text" style="width: 500px" class="form-control" id="" 
						name="image"
						value="${requestScope.image}">
				</div>
			</div>
			<c:choose>
    <c:when test="${requestScope.image.equals('')}">
      <c:out value = "${requestScope.image_err}"/>
        <br />
    </c:when>      
</c:choose> --%>
				<div class="form-group">
					<label class="control-label col-sm-4" style="color: black;">Description</label>
					<div class="col-sm-5">
						<input type="textarea" style="width: 500px" class="form-control"
							name="des" value="${requestScope.des}">
					</div>
				</div>
				<c:choose>
					<c:when test="${requestScope.des.equals('')}">
						<c:out value="${requestScope.des_err}" />
						<br />
					</c:when>
				</c:choose>
				<div class="form-group">
					<label class="control-label col-sm-4" style="color: black;">Price</label>
					<div class="col-sm-5">
						<input type="text" style="width: 500px" class="form-control"
							name="price" value="${requestScope.price}">
					</div>
				</div>
				<c:choose>
					<c:when test="${requestScope.price_err != null}">
						<c:out value="${requestScope.price_err}" />
						<br />
					</c:when>
				</c:choose>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" style="width: 200px"
							class="btn btn-danger">Add to
							Menu</button>
					</div>
				</div>
			</form>
		</center>
	</div></div>

</body>
</html>