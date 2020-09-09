<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/png" href="img/res.png" />

<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Home - Group21</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.8/css/all.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.0/semantic.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<!--
			CSS
			============================================= -->


<style type="text/css">
 @import url(https://fonts.googleapis.com/css?family=Open+Sans);
#circle-shape-example { 
  font-family: Open Sans, sans-serif; 
  margin: 2rem; 
}
#circle-shape-example p { 
  line-height: 1.8; 
}
#circle-shape-example .curve { 

  width: 350px;
  height:350px;
  float: left;
  margin-right:2rem; 
  border-radius: 250px;
  -webkit-shape-outside:circle();
  shape-outside:circle();
}
</style>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
	<section class="banner-area relative" id="home" >
		
	</section>
<section class="top-dish-area section-gap" id="dish">
<c:forEach var="row" items="${DAO.getList()}">
				<c:choose>
					<c:when test="${row.id.equals(param.id)}">
 <div id="circle-shape-example">
  <img src="${row.image}" alt="A photograph of sliced kiwifruit on a while plate" class="curve"><h1>${row.name}</h1>

  <p>${row.description}
</div>
</br>
<a href="CartControl?index=${row.id}&action=Add" class="primary-btn header-btn text-uppercase">Add to Order</a>
</c:when>
				</c:choose>
			</c:forEach>
</section>
	</br></br></br></br></br></br></br>
	
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://demosthenes.info/assets/scripts/extras/shapes.js'></script>

  

    <script  src="js/index2.js"></script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>