<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니<장바구니|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/cart.css"/>
<section class="cartSection">
	<table class="table cartListTable">
		<thead>
			<tr>
				<th colspan="2">상품명</th>
				<th>금액</th>
				<th>수량</th>
				<th>총금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ cartList }" var="cart">
			<tr data-cart-no="${ cart.no }">
				<td colspan="2">
					<img class="storeImg" src="${ pageContext.request.contextPath }/resources/upload/store/${ cart.renamedFilename }">
					${ cart.storeName }
				</td>
				<td>${ cart.storePrice }</td>
				<td><input class="storeCountInput" value="${ cart.storeCount }" type="number" min="1"/></td>
				<td>${ cart.storePrice * cart.storeCount }</td>
				<td><input class="deleteBtn" type="button" value="삭제"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</section>
<script>
// 장바구니 삭제 메서드
document.querySelectorAll(".deleteBtn").forEach((deleteBtn)=>{
	deleteBtn.addEventListener("click", (e)=>{
		
		if(confirm("정말로 삭제하시겠습니까?")){
			
			let parentTr = e.target;
			
			while(parentTr.tagName !== "TR")
				parentTr = parentTr.parentElement;

			const no = parentTr.dataset.cartNo;
			
			const csrfHeader = "${_csrf.headerName}";
			const csrfToken = "${_csrf.token}";
			const headers = {};
			headers[csrfHeader] = csrfToken;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/cart/deleteCart.do",
				method: "POST",
				data: {no},
				headers,
				success(data){
				},
				error: console.log
			});
			
			parentTr.remove();
			
		}
		
	});
});

// 장바구니 메뉴 수량 변경 메서드
document.querySelectorAll(".storeCountInput").forEach((storeCountInput)=>{
	storeCountInput.addEventListener("change", (e)=>{
		
		const count = e.target.value;
		
		let parentTr = e.target;
		
		while(parentTr.tagName !== "TR")
			parentTr = parentTr.parentElement;

		const no = parentTr.dataset.cartNo;
		
		const csrfHeader = "${_csrf.headerName}";
		const csrfToken = "${_csrf.token}";
		const headers = {};
		headers[csrfHeader] = csrfToken;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/cart/updateCart.do",
			method: "POST",
			data: {no, count},
			headers,
			success(data){
			},
			error: console.log
		});
		
		parentTr.remove();
		
	}
	});
});
</script>
</body>
</html>