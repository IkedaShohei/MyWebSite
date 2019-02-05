<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>ログイン</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ログイン</h5>
		</div>
		<c:if test="${errMsg != null}" >
			<div class="row center">
				<h5 class="text-center text-danger col s12 light m-5">${errMsg}</h5>
			</div>
		</c:if>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="" method="POST">
								<div class="row">
										<div class="input-field col s10 offset-s1 mb-3">
											<input value="${udb.loginId}" name="login_id" type="text" placeholder="ログインID" required>
										</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input  name="password" type="password" placeholder="パスワード" required>
									</div>
								</div>
								<div class="row">
									<div class="col s5">
										<div class="brank"></div>
									</div>
									<div class="col s2">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">ログイン</button>
										</p>
									</div>
									<div class="col s5">
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