<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>更新内容確認画面</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">更新内容確認</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="http://localhost:8080/PersonalDevelopment/UserDataUpdateConfirm" method="POST">
								<div class="row">
									<input type="hidden" value="${udb.userId}" name="userId">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<div class="col"></div>
											<span class="col">ログインID</span>
											<span class="col">${udb.loginId}</span>
											<input type="hidden" value="${udb.loginId}" name="loginId">
											<div class="col"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<div class="col"></div>
											<span class="col">名前</span>
											<span class="col">${udb.name}</span>
											<input type="hidden" value="${udb.name}" name="name">
											<div class="col"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<div class="col"></div>
											<span class="col">住所</span>
											<span class="col">${udb.adress}</span>
											<input type="hidden" value="${udb.adress}" name="adress">
											<div class="col"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<p></p>
										<input type="hidden" value="${udb.password}" name="password">
									</div>
								</div>
								<p class="">上記内容で更新してよろしいでしょうか?</p>
								<div class="row">
									<div class="col s2">
										<div class="brank"></div>
									</div>
									<div class="col s3">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit"  name="submit" value="更新">更新</button>
										</p>
									</div>
									<div class="col s2">
										<div class="brank"></div>
									</div>
									<div class="col s3">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit"  name="submit" value="修正">修正</button>
										</p>
									</div>
									<div class="col s2">
										<div class="brank"></div>
									</div>
								</div>
						</form>
					</div>
				</div>
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