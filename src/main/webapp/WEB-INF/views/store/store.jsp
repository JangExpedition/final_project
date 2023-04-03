<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="매점<매점|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/store.css"/>
<section id="storeSection">
	<div id="storeImgContainer">
		<img src="${ pageContext.request.contextPath }/resources/images/popcorn.png">
	</div>
	<div class="snackMenu">
		<div class="snackMenuList">
			<div class="snackCategory">
				<div id="package">패키지</div>
				<div id="combo">콤보</div>
				<div id="popcorn">팝콘</div>
				<div id="drink">음료</div>
				<div id="snack">스낵</div>
			</div>
			<div class="cart">장바구니</div>
		</div>
	</div>
</section>
</body>
</html>