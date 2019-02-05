<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>入力内容確認</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

 	<div class="container">
 		<form action="http://localhost:8080/PersonalDevelopment/itemSearchResult" method="post">
 			<div class="form-group">
	   			<label for="exampleInputRetrieval">検索</label>
	    		<input type="text" class="form-control" name="searchWord" value="${searchWord}" placeholder="検索">
	    		<small class="text-muted">欲しい商品を検索してください。</small>
	  		</div>
 		</form>
		<div class="center">
			<h5 class="text-center">検索結果</h5>
			<c:if test="${itemCount != null}">
				<p class="text-center">
					検索結果${itemCount}件
				</p>
			</c:if>
		</div>

		<div class="container">
			<!-- <p class="text-center m-xl-5">ここに検索結果を表示</p> -->
			<c:if test="${itemList != null}">
				<div class="row">
					<!-- <div class="col-2"> -->
						<c:forEach var="idb" items="${itemList}">
							<div class="card col-2 m-1">
								<a href="http://localhost:8080/PersonalDevelopment/Item?item_id=${idb.itemId}">
							    <img class="card-img-top" alt="noimage" src="image/${idb.fileName}">
							    </a>
								    <div class="card-body">
								    	<h5 class="card-title">${idb.name}</h5>
										<p>${idb.price}円</p>
								    </div>
							</div>
						</c:forEach>
					<!-- </div> -->
				</div>
			</c:if>
		</div>
	</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>