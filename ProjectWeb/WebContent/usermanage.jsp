<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="dao.UserDAO"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>User Management</title>
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
<jsp:include page="managemenu.jsp"></jsp:include>
<div class="w3-main" style="margin-left:250px;margin-right:40px">
	<div class="container"> 
		</br><h2 align="center">User Management</h2> </br>
		<div class="row"> 
			<div class="col-md-12"> 
						
				<div class="panel panel-primary" style="width: 1050px">
						<div class="panel-heading" style="background-color: grey;">
						<h3 class="panel-title">User</h3> 
						
					</div> 
					<div class="panel-body"> <input class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Từ khóa" type="text"> 
					</div> 
					
			
					<table class="table table-hover" id="dev-table"> 
						<thead> 
							<tr> 
								
								<th>ID</th> 
								<th>Name</th> 
								<th>Password</th> 
								<th>Delete</th>
						
							</tr> 
						</thead> 
						<tbody>
						<c:forEach var = "row" items = "${UserDAO.getListUser()}">
						<tr> 
							<td><c:out value = "${row.id}"/></td> 
							<td><c:out value = "${row.name}"/></td> 
							<td><c:out value = "${row.pass}"/></td>  
							<c:choose>
							
							<c:when test="${row.name.trim() != 'admin'}">
							<td><a href="UserControl?id=${row.id}&action=Delete"><button class="btn btn-danger">Delete</button></a></td>
							
						</c:when></c:choose></tr> 
					 </c:forEach>
						
					</tbody></table> 
				</div> 
			</div> 
		</div>
		
	
	</div>
	</div>
	
	</body>
	</html>