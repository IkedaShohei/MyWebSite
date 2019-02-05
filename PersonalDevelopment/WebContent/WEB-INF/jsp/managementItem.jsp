<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>ホーム</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">商品情報（管理者用）</h5>
		</div>

		<div class="row center my-4">
			<div class="col-10"></div>
			<a class="btn btn-outline-danger col-2" href="http://localhost:8080/PersonalDevelopment/ItemAdd" role="button">商品の追加</a>
		</div>

		<div>
			<table class="table">
			  <caption>テーブルの表題</caption>
			  <thead>
			    <tr>
			      <th scope="col">商品ID</th>
			      <th scope="col">商品名</th>
			      <th scope="col">商品価格</th>
			      <th scope="col">出品者</th>
			      <th scope="col">メニュー</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="ItemDataBeans" items="${allItemBeansList}">
				    <tr>
				      <td>${ItemDataBeans.itemId}</td>
				      <td>${ItemDataBeans.name}</td>
				      <td>${ItemDataBeans.price}円</td>
				      <td>${ItemDataBeans.addUserName}</td>
				      <td>
						<a class="btn btn-primary rounded-pill" href="http://localhost:8080/PersonalDevelopment/Item?item_id=${ItemDataBeans.itemId}" role="button">詳細</a>
						<a class="btn btn-success rounded-pill" href="http://localhost:8080/PersonalDevelopment/ManagerItemUpdate?itemId=${ItemDataBeans.itemId}" role="button">更新</a>
						<a class="btn btn-danger rounded-pill" href="http://localhost:8080/PersonalDevelopment//ManagerItemDelete?itemId=${ItemDataBeans.itemId}" role="button">削除</a>
				      </td>
				    </tr>
				   </c:forEach>
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