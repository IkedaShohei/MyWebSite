<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>商品の追加</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">商品の追加</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form enctype="multipart/form-data" action="http://localhost:8080/PersonalDevelopment/ItemAdd" method="POST">
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input class="w-100" value="" name="itemName" type="text" placeholder="商品名" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<textarea class="w-100" name="itemDetail" placeholder="商品詳細" required></textarea>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input value="" name="itemPrice" type="text" placeholder="価格" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input value="" name="itemStock" type="text" placeholder="在庫数" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="custom-file">
	   										<input type="file" value="" name="fileName" class="custom-file-input" aria-describedby="inputGroupFileAddon01">
	   										<label class="custom-file-label" for="inputGroupFile01">商品の画像ファイルを選択してください</label>
   										</div>
									</div>
								</div>
											<input type="hidden" value="${udb.userId}" name="userId">
								<div class="row">
									<div class="col s5">
										<div class="brank"></div>
									</div>
									<div class="col s2">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">確認</button>
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