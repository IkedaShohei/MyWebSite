<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>ホーム</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />


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