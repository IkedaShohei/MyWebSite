<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>ユーザー情報登録完了</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ユーザー情報登録完了</h5>
		</div>

		<div class="row">
			<div class="col s3">
				<div class="brank"></div>
			</div>
			<div class="col s6">
				<p class="center-align">
				<a class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" href="http://localhost:8080/PersonalDevelopment/Login" type="submit" name="action">ログイン画面へ</a>
				</p>
			</div>
			<div class="col s3">
				<div class="brank"></div>
			</div>
		</div>
	</div>

	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>