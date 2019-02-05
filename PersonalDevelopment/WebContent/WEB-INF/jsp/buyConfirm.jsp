<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>購入確認画面</title>
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
			<h5 class="text-center col s12 light m-5">購入</h5>
		</div>

		<table class="table mb-0">
			<thead>
				<tr>
					<th></th>
					<th scope="col">商品名</th>
					<th scope="col">単価</th>
					<th scope="col">小計</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cartInItem" items="${cart}" >
					<tr>
						<th scope="row">・</th>
						<td>${cartInItem.name}</td>
						<td>${cartInItem.price}円</td>
						<td>${cartInItem.price}円</td>
					</tr>
				</c:forEach>
					<tr>
						<th scope="row">・</th>
						<td>${bdb.deliveryMethodName}</td>
						<td></td>
						<td>${bdb.deliveryMethodPrice}円</td>
					</tr>
					<tr>
						<th></th>
						<td></td>
						<td>合計</td>
						<td>${bdb.totalPrice}円</td>
					</tr>
			</tbody>
	  	</table>
	  	<form action="http://localhost:8080/PersonalDevelopment/BuyResult" method="post">
			<div class="row">
				<div class="col-sm"></div>
				<button class="btn-primary rounded-pill col-sm m-5">購入</button>
				<div class="col-sm"></div>
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