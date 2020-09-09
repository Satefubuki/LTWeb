<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%ServletContext FunctionContext = getServletContext();
    FunctionContext.setAttribute("function", "Delete");
    	ServletContext contextID = getServletContext();
    	contextID.setAttribute("id", request.getParameter("id"));
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Management</title>
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
<jsp:include page="menu.jsp"></jsp:include>
<section class="top-dish-area section-gap" id="dish">
	<div class="container"> 
		<h2 align="center">Management</h2> 
		<div class="row"> 
			<div class="col-md-12"> 
						<a href="add.jsp"><button class="btn btn-success">Add to menu</button></a>
				<div class="panel panel-primary"> 
					<div class="panel-heading"> 
						<h3 class="panel-title">Dish</h3> 
						
					</div> 
					<div class="panel-body"> <input class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Từ khóa" type="text"> 
					</div> 
					
					<sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
         url = "jdbc:sqlserver://localhost:1433;databaseName=BAY"
         user = "sa"  password = "12345"/>
          <sql:query dataSource = "${snapshot}" var = "result">
          select * from food;
         </sql:query>
					<table class="table table-hover" id="dev-table"> 
						<thead> 
							<tr> 
								<th>Type</th> 
								<th>ID</th> 
								<th>Name</th> 
								<th>Image</th> 
								<th>Description</th>
								<th>Price</th> 
								<th>Delete</th>
								<th>Edit</th>
							</tr> 
						</thead> 
						<tbody>
						<c:forEach var = "row" items = "${result.rows}">
						<tr> 
							<td><c:out value = "${row.type}"/></td> 
							<td><c:out value = "${row.id}"/></td> 
							<td><c:out value = "${row.name}"/></td> 
							<td>  <img style="width: 40px;height: 60px" src="<c:out value = "${row.image}"/>"></td> 
							<td><c:out value = "${row.description}"/></td> 
							<td><c:out value = "${row.price}"/></td> 
							<td><a href="Control?id=<c:out value = "${row.id}"/>&action=Delete"><button class="btn btn-warning">Delete</button></a></td>
							<td><a href="edit.jsp?id=<c:out value = "${row.id}"/>"><button class="btn btn-primary">Edit</button></a></td>
						</tr> 
					 </c:forEach>
						
					</tbody></table> 
				</div> 
			</div> 
		</div>
		
	
	</section>	
	</div>
	
	</body>
	</html>