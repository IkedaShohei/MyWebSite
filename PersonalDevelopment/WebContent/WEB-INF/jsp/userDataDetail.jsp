<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>ホーム</title>
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
 		<div class="row">
 			<div class="col-2"></div>
 			<div class="col-8">
			 		<div class="card card-body bg-light my-3 mx-auto w-75 text-center ">
			 			<div class="row">
			 				<div class="col">
			 					<p>ユーザーID</p>
			 					<p>名前</p>
			 					<p>住所</p>
			 					<p>ログインID</p>
			 					<p>アカウント作成日</p>
			 					<p>アカウント更新日</p>
			 				</div>
			 				<div class="col">
			 					<p>${udb.userId}</p>
			 					<p>${udb.name}</p>
			 					<p>${udb.adress}</p>
			 					<p>${udb.loginId}</p>
			 					<p><fmt:formatDate value="${udb.createDate}" pattern="yyyy年MM月dd日" /></p>
			 					<p><fmt:formatDate value="${udb.updateDate}" pattern="yyyy年MM月dd日" /></p>
			 				</div>
			 			</div>

			 			<div class="row mt-3">
			 				<span class="col"></span>
			 				<a class="col btn btn-primary rounded-pill" href="http://localhost:8080/PersonalDevelopment/ManagementUser" role="button">戻る</a>
			 				<span class="col"></span>
			 			</div>
			 		</div>
		 	</div>
		 	<div class="col-2"></div>
		</div>
 	</div>



 	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>