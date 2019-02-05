<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>削除確認</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ユーザー削除確認</h5>
		</div>

		<form action="http://localhost:8080/PersonalDevelopment/ManagerItemDelete" method="post">
			<div class="container text-center mb-5">
				<p>${idb.name}を</p>
				<p>削除してよろしいですか。</p>
				<input type="hidden" name="itemId" value="${idb.itemId}">
			</div>


			<div class="row">
				<div class="col s2">
					<div class="brank"></div>
				</div>
				<div class="col s3">
					<p class="center-align">
					<a class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2"  href="http://localhost:8080/PersonalDevelopment/ManagementItem" role="button">キャンセル</a>
					</p>
				</div>
				<div class="col s2">
					<div class="brank"></div>
				</div>
				<div class="col s3">
					<p class="center-align">
					<button class="btn btn-danger rounded-pill btn-sm  col s8 offset-s2" type="submit">削除</button>
					</p>
				</div>
				<div class="col s2">
					<div class="brank"></div>
				</div>
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