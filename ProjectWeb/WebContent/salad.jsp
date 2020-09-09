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

 <link rel="stylesheet" href="css/css/style.css">

</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
	<section class="banner-area relative" id="home" >
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-start">
				<div class="banner-content col-lg-8 col-md-12">
					<h4 class="text-white text-uppercase">Wide Options of Choice</h4>
					<h1 class="text-uppercase">Market Fresh Salads</h1>
					
					</p>
					<a href="#dish" class="primary-btn header-btn text-uppercase">Check
						Our Menu</a>
				</div>
			</div>
		</div>
	</section>
<section class="top-dish-area section-gap" id="dish">
<h1 align="center">Market Fresh Salads</h1>

<form action="CartControl" method="get">
<div class="grid-row">
				<c:forEach var="row" items="${DAO.getList()}">
					<c:set var="type" value="${row.type.trim()}" />

					<c:choose>
						<c:when test="${type=='salad'}">

  <div class="product">
    <div class="product--card">
      <a class="product--image" href="detail.jsp?id=${row.id}" title="View">
        <img class="img-responsive" src="${row.image}">
        <span class="tags"></span>
      </a>
     <center>
      <div class="product--brand">
     </br> <a href="#" title="View">  <h4 style="color: blue;" class="text-uppercase">${row.name}</h4></a>
      </div></center>
      <a class="product--price" href="#" title="View">
        <span class="product--price-inner">
          <div class="price--sell-price" align="center" style="color: red;">${row.price}</div>
        </span>
      </a>
      <a type="submit" href="CartControl?index=<c:out value = "${row.id}"/>&action=Add" class=" header-btn text-uppercase" style="background-color: red;height: 34px;color: white;font-weight: bolder;text-align: center;">Add to order</a>
    </div>
  </div>
  
  			</c:when>
					</c:choose>
				</c:forEach>
			</form>
  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>