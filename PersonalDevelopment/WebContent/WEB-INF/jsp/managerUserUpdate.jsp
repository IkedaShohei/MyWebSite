<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>ユーザー情報</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 		<div class="container">
 		<div class="row">
 			<div class="col-2"></div>
 			<div class="col-8">
 				<form action = "http://localhost:8080/PersonalDevelopment/ManagerUserUpdate" method="post">
	 				<div class="text-danger">
						<c:if test="${errMsgPass != null}" >
								  ${errMsgPass}
						</c:if>
					</div>
			 		<div class="card card-body bg-light my-3 mx-auto w-75 text-center ">
			 			<div class="row">
			 				<div class="col">
			 					<p>ログインID</p>
			 					<p>名前</p>
			 					<p>住所</p>
			 					<p>パスワード</p>
			 					<p>パスワード(確認用)</p>
			 				</div>
			 				<div class="col">
			 					<p>${udb.loginId}</p>
			 					<input type="hidden" value="${udb.loginId}" name="loginId">
			 					<input class="mb-2" type="text" value="${udb.name}" name="name" required>
			 					<input class="mb-2" type="text" value="${udb.adress}" name="adress" required>
			 					<input class="mb-2" type="password" value="" name="password" required>
			 					<input class="mb-2" type="password" value="" name="passwordConfirm" required>
			 				</div>
			 			</div>

			 			<div class="row mt-3">
			 				<span class="col"></span>
			 				<button class="col btn btn-primary rounded-pill" type="submit">更新</button>
			 				<span class="col"></span>
			 			</div>
			 		</div>
			 	</form>
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