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
				<div id="ALL" class="menuCategory <c:if test="${ empty param.category }">red</c:if>">
				전체</div>
				<div id="COMBO" class="menuCategory <c:if test="${ param.category eq 'COMBO' }">red</c:if>">
				콤보</div>
				<div id="POPCORN" class="menuCategory <c:if test="${ param.category eq 'POPCORN' }">red</c:if>">
				팝콘</div>
				<div id="DRINK" class="menuCategory <c:if test="${ param.category eq 'DRINK' }">red</c:if>">
				음료</div>
				<div id="SNACK" class="menuCategory <c:if test="${ param.category eq 'SNACK' }">red</c:if>">
				스낵</div>
			</div>
			<div class="cart">장바구니</div>
		</div>
	</div>
	<div class="snackList">
		<c:forEach items="${ storeList }" var="store" varStatus="vs">
			<c:if test="${ vs.index == 0 || vs.index % 4 == 0 }">
				<div class="oneStoreLine">
			</c:if>
				<div class="oneMenu">
					<div class="menuImg">
						<img class="menuImgFile" src="${ pageContext.request.contextPath }/resources/upload/store/${ store.renamedFilename }"/>
						<h3 class="inputCart">담기</h3>
					</div>
					<p class="menuName">${ store.name }</p>
					<p class="menuPrice"><fmt:formatNumber value="${ store.price }" pattern="#,###"/> 원</p>
				</div>
			<c:if test="${ vs.index % 4 == 3 }">
				</div>
			</c:if>
		</c:forEach>
	</div>
</section>
<script>
// 메뉴 카테고리 선택 메서드
document.querySelectorAll(".menuCategory").forEach((menuCategory)=>{
	menuCategory.addEventListener("click", (e)=>{
		let category = e.target.id;
		
		if(category === 'ALL')
			location.href = "${pageContext.request.contextPath}/store/store.do";
		else
			location.href = "${pageContext.request.contextPath}/store/store.do?category=" + category;
			
				
	});
});

// 메뉴 담기 클릭 메서드
document.querySelectorAll(".menuImg").forEach((menu)=>{
	menu.addEventListener("click", (e)=>{
		let parentDiv = e.target;
		while(parentDiv.tageName !== "DIV")
			parentDiv = e.target.parentElement;
		
		inputCart(parentDiv);
	});
});

const inputCart = (menu) => {
	console.log(menu);	
};

</script>
</body>
</html>