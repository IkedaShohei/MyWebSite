<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>カート画面</title>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarNav">
				<div class="mr-auto">
					<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/index">Home </a>
				</div>
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${udb == null}">
							<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Regist">新規登録</a>
				      		</li>
				      	</c:when>
				      	<c:when test="${udb != null}">
				      		<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/UserData?userId=${udb.userId}">${udb.name}さん</a>
				      		</li>
				      	</c:when>
					</c:choose>
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Cart">カート</a>
		      		</li>
		      		<c:choose>
		      			<c:when test="${udb == null}">
		      				<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Login">ログイン</a>
				      		</li>
		      			</c:when>
		      			<c:when test="${udb != null}">
				      		<li class="nav-item">
				      			<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Logout">ログアウト</a>
				      		</li>
				      	</c:when>
				    </c:choose>
		    	</ul>
		    </div>
		</div>
 	</nav>

 		<div class="container">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">買い物かご</h5>
			</div>
			<form action="http://localhost:8080/PersonalDevelopment/ItemDeleteInCart" method="POST">
				<div class="row mb-5">
					<div class="col-md-1"></div>
					<button class="btn-primary rounded-pill col-md-4 text-center">削除</button>
					<div class="col-md-1"></div>
					<div class="col-md-1"></div>
					<a href="http://localhost:8080/PersonalDevelopment/Buy" class="btn-primary rounded-pill col-md-4 text-center">レジに進む</a>
					<div class="col-md-1"></div>
				</div>

					<div class="row center">
						<p class="text-center col s12 light m-5">${cartActionMessage}</p>
					</div>

				<div class="row">
					<c:forEach var="idb" items="${cart}" varStatus="status">
						<div class="card w-25 col-2 m-1">
							<a href="http://localhost:8080/PersonalDevelopment/Item?item_id=${idb.itemId}">
						 	<img class="card-img-top" src="image/${idb.fileName}" alt="No image">
						 	</a>
						 	<div class="card-body">
						 		<div class="row">
							  		<p class="col-5">${idb.name}</p>
							  		<p class="col-7">${idb.price}円</p>
							  	</div>
							    <span><input type="checkbox" name="delete_item_id_list" value="${idb.itemId}"> <label for="$">削除</label></span>
							</div>
						</div>
					</c:forEach>
				</div>
			</form>
		</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>