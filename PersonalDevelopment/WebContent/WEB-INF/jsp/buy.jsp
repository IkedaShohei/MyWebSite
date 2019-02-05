<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>購入画面</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 	<div class="container">
 		<form action="http://localhost:8080/PersonalDevelopment/BuyComfirm" method="POST">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">カートアイテム</h5>
			</div>

			<table class="table mb-0">
				<thead>
					<tr>
						<th></th>
						<th scope="col">商品名</th>
						<th scope="col">単価</th>
						<th scope="col">小計</th>
						</tr>
				</thead>
				<tbody>
					<c:forEach var="cartInItem" items="${cart}" >
						<tr>
							<th scope="row">・</th>
							<td>${cartInItem.name}</td>
							<td>${cartInItem.price}円</td>
							<td>${cartInItem.price}円</td>
					    </tr>
					  </c:forEach>
					 	<tr>
							<td class="center"></td>
							<td class="center"></td>
							<td class="center">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<label class="input-group-text" for="inputGroupSelect01">配送方法</label>
								</div>
								<select class="custom-select" name="delivery_method_id">
									<c:forEach var="dmdb" items="${dmdbList}" >
								    	<!-- <option selected>配送方法</option> -->
								    	<option value="${dmdb.deliveryMethodId}">${dmdb.name}　${dmdb.price}円</option>
									</c:forEach>
								</select>
							</div>

							<%-- <div class="input-field col s8 offset-s2 ">
									<select name="delivery_method_id">
										<c:forEach var="dmdb" items="${dmdbList}" >
											<option value="${dmdb.id}">${dmdb.name}</option>
										</c:forEach>
									</select> <label>配送方法</label>
								</div> --%>
							</td>
						</tr>
				</tbody>
		  	</table>
			<div class="row">
				<div class="col-sm"></div>
				<button class="btn-primary rounded-pill col-sm m-5">購入確認</button>
				<div class="col-sm"></div>
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