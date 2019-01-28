<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>入力内容確認</title>
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
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Login">ログイン</a>
		      		</li>
		    	</ul>
		    </div>
		</div>
 	</nav>

 	<div class="container">
 		<form action="http://localhost:8080/PersonalDevelopment/itemSearchResult" method="post">
 			<div class="form-group">
	   			<label for="exampleInputRetrieval">検索</label>
	    		<input type="text" class="form-control" name="searchWord" value="${searchWord}" placeholder="検索">
	    		<small class="text-muted">欲しい商品を検索してください。</small>
	  		</div>
 		</form>
		<div class="center">
			<h5 class="text-center">検索結果</h5>
			<p class="text-center">
				検索結果${itemCount}件
			</p>
		</div>

		<div class="container">
			<p class="text-center m-xl-5">ここに検索結果を表示</p>
			<c:if test="${itemList != null}">
				<div class="row">
					<!-- <div class="col-2"> -->
						<c:forEach var="idb" items="${itemList}">
							<div class="card col-2 m-1">
								<a href="http://localhost:8080/PersonalDevelopment/Item?item_id=${idb.itemId}">
							    <img class="card-img-top" alt="noimage" src="image/${idb.fileName}">
							    </a>
								    <div class="card-body">
								    	<h5 class="card-title">${idb.name}</h5>
										<p>${idb.price}円</p>
								    </div>
							</div>
						</c:forEach>
					<!-- </div> -->
				</div>
			</c:if>
		</div>
	</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>