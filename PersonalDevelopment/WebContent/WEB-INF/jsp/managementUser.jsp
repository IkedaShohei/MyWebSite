<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ユーザー情報（管理者用）</h5>
		</div>

		<div>
			<table class="table">
				<caption>テーブルの表題</caption>
				<thead>
					<tr>
						<th>ID</th>
				      	<th scope="col">名前</th>
					    <th scope="col">住所</th>
					    <th scope="col">ログインID</th>
					    <th scope="col">メニュー</th>
					</tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="userDataBeans" items="${userDataBeansList}">
					    <tr>
					      <th scope="row">${userDataBeans.userId}</th>
					      <td>${userDataBeans.name}</td>
					      <td>${userDataBeans.adress}</td>
					      <td>${userDataBeans.loginId}</td>
					      <td>
							<a class="btn btn-primary rounded-pill" href="http://localhost:8080/PersonalDevelopment/UserDataDetail?userId=${userDataBeans.userId}" role="button">詳細</a>
							<a class="btn btn-success rounded-pill" href="http://localhost:8080/PersonalDevelopment/ManagerUserUpdate?userId=${userDataBeans.userId}" role="button">更新</a>
							<a class="btn btn-danger rounded-pill" href="http://localhost:8080/PersonalDevelopment/UserDeleteConfirm?userId=${userDataBeans.userId}" role="button">削除</a>
					      </td>
					    </tr>
					</c:forEach>
				 </tbody>
			</table>
		</div>
	</div>

	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>