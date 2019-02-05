<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>管理者ページ</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">管理者ページ</h5>
		</div>
		<div class="row">
			<div class="col s2">
				<div class="brank"></div>
			</div>
				<a class="col s3 btn btn-outline-primary" href="http://localhost:8080/PersonalDevelopment/ManagementUser" role="button">ユーザー詳細</a>
			<div class="col s2">
				<div class="brank"></div>
			</div>
				<a class="col s3 btn btn-outline-primary" href="http://localhost:8080/PersonalDevelopment/ManagementItem" role="button">商品一覧</a>
			<div class="col s2">
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