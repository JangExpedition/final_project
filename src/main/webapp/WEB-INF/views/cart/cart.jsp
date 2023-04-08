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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<sec:authentication property="principal" var="loginMember"/>
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
			<tr class="oneCart" data-cart-no="${ cart.no }" data-store-price="${ cart.storePrice }">
				<td class="storeName" data-store-name="${ cart.storeName }" colspan="2">
					<img class="storeImg" src="${ pageContext.request.contextPath }/resources/upload/store/${ cart.renamedFilename }">
					${ cart.storeName }
				</td>
				<td>${ cart.storePrice }</td>
				<td><input class="storeCountInput" value="${ cart.storeCount }" type="number" min="1"/></td>
				<td class="totalPriceTd" data-cart-no="${ cart.no }">${ cart.storePrice * cart.storeCount }</td>
				<td><input class="deleteBtn" class="btnStyle" type="button" value="삭제"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table class="selectCinemaTable table">
		<thead>
			<tr>
				<th>
					수령하실 영화관을 선택해주세요.
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<select id="selectCinema">
						<option value="none">영화관을 선택해주세요.</option>
						<c:forEach items="${ cinemaList }" var="cinema">
							<option value="${ cinema.name }">${ cinema.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="table totalPriceTable">
		<thead>
			<tr>
				<th>총 상품 금액</th>
				<th>할인금액</th>
				<th>총 결제금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="beforeDiscountPrice"></td>
				<td class="pointTd">
					<input id="point" type="number" min="0" max="${ loginMember.point }" placeholder="포인트를 사용하시겠습니까? 보유포인트 : ${ loginMember.point }" />
					<input id="pointAll" type="button" class="btnStyle" value="모두 사용하기" />
				</td>
				<td id="totalPrice"></td>
			</tr>
		</tbody>
	</table>
	<div id="payBtn"></div>
</section>
<script>
window.onload = () =>{
	calTotalPrice();
}

// 최종 결제금액 초기값 세팅 메서드
const calTotalPrice = () =>{
	
	let totalPrice = 0;
	
	document.querySelectorAll(".totalPriceTd").forEach((totalPriceTd)=>{
		totalPrice += Number(totalPriceTd.innerText);	
	});
	
	document.querySelector("#beforeDiscountPrice").innerText = totalPrice.toLocaleString() + "원";
	document.querySelector("#totalPrice").innerText = totalPrice.toLocaleString() + "원";
}

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
				const price = parentTr.dataset.storePrice;
				
				document.querySelectorAll(".totalPriceTd").forEach((totalPriceTd)=>{
					if(totalPriceTd.dataset.cartNo === no){
						totalPriceTd.innerText = price * count; 
					}
				});
				
			},
			error: console.log
		});
		
	});
});

//수령 영화관 변경 메서드
document.querySelector("#selectCinema").addEventListener("change", (e)=>{
	if(e.target.value !== "none"){
		document.querySelector(".totalPriceTable").style.display = "table";
		document.querySelector("#payBtn").style.display = "inline-block";
	}
	else{
		document.querySelector(".totalPriceTable").style.display = "none";
		document.querySelector("#payBtn").style.display = "none";
	}
});

//포인트 사용 메서드
document.querySelector("#point").addEventListener("change", (e)=>{
	usePoint();
});

// 포인트 모두 사용하기 버튼 클릭 메서드
document.querySelector("#pointAll").addEventListener("click", (e)=>{
	document.querySelector("#point").value = ${loginMember.point};
	usePoint();
});

// 총 결제금액에서 사용 포인트 차감 메서드
const usePoint = () => {
	const point = document.querySelector("#point").value;
	if(point > ${ loginMember.point }){
		alert("현재 보유하신 포인트보다 많이 입력됐습니다.")
		point = "";
	}
	else{
		document.querySelector("#totalPrice").innerText
			= (document.querySelector("#beforeDiscountPrice").innerText.replace(/,/, '').replace(/원/g, '')
				- point).toLocaleString() + "원";
	}
};

// 결제 키값 생성 메서드
const createRandomNumber = (min, max) => {
	let key = (Math.floor(Math.random() * (max - min + 1)) + min).toString();
	
	const csrfToken = "${_csrf.token}";
	
	return key.substring(0,3) + csrfToken + key.substring(4);
};

//결제 메서드
document.querySelector("#payBtn").addEventListener("click", (e)=>{
	
	const totalPrice = document.querySelector("#totalPrice").innerText.replace(/,/, '').replace(/원/g, '');
	const id = "<sec:authentication property='principal.username'/>";
	const usePoint = document.querySelector("#point").value == "" ? 0 : document.querySelector("#point").value;
	const pickupZone = document.querySelector("#selectCinema").value;
	
	let productName = "";
	
	document.querySelectorAll(".storeName").forEach((storeName)=>{
		productName += storeName.dataset.storeName;
	});
	
	const csrfHeader = "${_csrf.headerName}";
	const csrfToken = "${_csrf.token}";
	const headers = {};
	headers[csrfHeader] = csrfToken;
	
	const key = createRandomNumber(10000, 99999);
	
	IMP.init("imp28385606");
	
	IMP.request_pay({
	    pg : "kakaopay",
	    pay_method : 'card',
	    merchant_uid: key,
	    name : productName,
	    amount : totalPrice,
	    buyer_email : '${loginMember.email}',
	    buyer_name : '${loginMember.id}',
	    buyer_tel : '${loginMember.phone}'
	}, function(rsp) { 
    	
		if(rsp.success) {
			
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/cart/cartPayment.do",
	    		type: 'POST',
	    		traditional: true,
	    		dataType: 'json',
	    		data: {id, totalPrice, usePoint, pickupZone},
	    		headers,
	    		success(data) {
					let msg = data.msg;
	    			
	    			alert(msg);
	    			
	    			location.href = "${pageContext.request.contextPath}";
	    		}
	    	});
	    } 
		else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	}); // 카카오페이 결제 end
  
}); // 결제 메서드 end
</script>
</body>
</html>