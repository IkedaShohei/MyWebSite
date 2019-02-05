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
		<div class="card">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">購入履歴詳細</h5>
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
						<td>${bdb.createDate}</td>
						<td>${bdb.deliveryMethodName}</td>
						<td>${bdb.totalPrice}円</td>
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
					<c:forEach var="buyDetailItem" items="${buyDetailItemList}" >
						<tr>
							<td class="center">${buyDetailItem.name}</td>
							<td class="center">${buyDetailItem.price}円</td>
						</tr>
					</c:forEach>
						<tr>
							<td class="center">${bdb.deliveryMethodName}</td>
							<td class="center">${bdb.deliveryMethodPrice}円</td>
						</tr>
				</tbody>
		  	</table>
		  </div>
	</div>

</body>
</html>