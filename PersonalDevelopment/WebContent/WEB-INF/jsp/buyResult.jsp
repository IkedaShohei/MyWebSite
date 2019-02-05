<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>購入確認画面</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />


 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">購入が完了しました</h5>
		</div>

		<div class="row mb-5">
			<div class="col-sm"></div>
			<a href ="http://localhost:8080/PersonalDevelopment/itemSearchResult">
			<button class="btn-primary rounded-pill col-sm">引き続き買い物</button>
			</a>
			<div class="col-sm"></div>
			<div class="col-sm"></div>
			<a href ="http://localhost:8080/PersonalDevelopment/UserData?userId=${udb.userId}">
			<button class="btn-primary rounded-pill col-sm">ユーザー情報へ</button>
			</a>
			<div class="col-sm"></div>
		</div>

		<div class="card">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">購入詳細</h5>
			</div>

			<table class="table mb-5">
				<thead>
					<tr>
						<th></th>
						<th scope="col">購入日時</th>
						<th scope="col">配送方法</th>
						<th scope="col">合計金額</th>
						</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"></th>
						<td><fmt:formatDate value="${resultBDB.createDate}" pattern="yyyy年MM月dd日" /></td>
						<td>${resultBDB.deliveryMethodName}</td>
						<td>${resultBDB.totalPrice}円</td>
				    </tr>
				</tbody>
		  	</table>

			<table class="table mb-0 text-center">
				<thead>
					<tr>
						<th scope="col">商品名</th>
						<th scope="col">単価</th>
						</tr>
				</thead>
				<tbody>
					<c:forEach var="buyIDB" items="${buyIDBList}" >
						<tr>
							<td class="center">${buyIDB.name}</td>
							<td class="center">${buyIDB.price}円</td>
						</tr>
					</c:forEach>
						<tr>
							<td class="center">${resultBDB.deliveryMethodName}</td>
							<td class="center">${resultBDB.deliveryMethodPrice}円</td>
						</tr>
					<!-- <tr>
						<th scope="row">1</th>
						<td>商品名のセル</td>
						<td>単価のセル</td>
				    </tr>
				    <tr>
						<th scope="row"></th>
						<td>配送方法</td>
						<td>配送料金</td>
				    </tr> -->
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