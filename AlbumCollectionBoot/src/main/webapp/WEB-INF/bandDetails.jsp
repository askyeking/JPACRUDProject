<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="css/main.css">
</head>
<body>


<div class="container">
	<c:choose>
		<c:when test="${empty band }">
			<h1>Band not found</h1>
			<h5><a class="btn btn-primary" href="home.do">Home</a></h5>
		</c:when>
		<c:otherwise>
		<div class="row">
			<div class="col-4">
				<span class="badge bg-success">${band.name }</span><br>
				<img alt="Picture for ${band.name }" src="${band.imageUrl }"><br>
				<h5><a class="btn btn-primary" href="home.do">Home</a></h5>
			</div>
		
			<div class="col-8">
			<br><br>
				<table class="table table-sm table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>Name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="album" items="${band.albums}">
							<tr>
							<td> <a href="showAlbum.do?bandId=${album.id }"> ${album.title } </a></td>
							</tr>
						</c:forEach>
					</tbody>
  		
				</table> 
			</div>
		</div>
		</c:otherwise>
	</c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>