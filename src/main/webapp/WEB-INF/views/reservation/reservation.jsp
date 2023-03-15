<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/reservation.css"/>
<!-- 예매 섹션 -->
<section class="reservation-section">
	<!-- 예매 초기화 -->
	<div class="reset-wrapper">
		<div class="reset-box">
			<button id="resetBtn" type="button"><i class="fa-solid fa-rotate-right"></i> 예매 다시하기</button>
		</div>
	</div>
	<!-- 예매 구간 -->
	<div class="steps">
		<!-- 영화선택 구간 -->
		<div class="step">
			<div class="table-head">영화</div>
			<div class="table-body">
				<div class="movie-filter">
					<span class="filter non-click">예매율순</span>
					<span class="filter non-click">가나다순</span>
				</div>
				<div class="movie-list">
				<c:forEach items="${ movieList }" var="movie">
				
				</c:forEach>
				</div>
			</div>
		</div>
		<!-- 영화선택 구간 -->
		<!-- 극장선택 구간 -->
		<div class="step">
			<div class="table-head">극장</div>
			<div class="table-body flex-box">
				<div class="location-box">
					<c:forEach items="${ locationList }" var="location">
						<div class="location-tr">
							${ location }
						</div>
					</c:forEach>
				</div>
				<div class="cinema-box"></div>
			</div>
		</div>
		<!-- 극장선택 구간 -->
		<div class="step step3">
			<div class="table-head">날짜</div>
		</div>
		<div class="step step4">
			<div class="table-head">시간</div>
		</div>
	</div>
	<!-- 예매 구간 -->
</section>
<!-- 예매 섹션 -->
<!-- 예매확인 섹션 -->
<section class="reservation-check-section">
	<div class="check-box">
		<div class="check">
		</div>
		<div class="check">
		</div>
		<div class="check check3">
		</div>
		<div class="check check4">
		</div>
	</div>
</section>
<!-- 예매확인 섹션 -->
<script>
document.querySelectorAll(".filter").forEach((span)=>{
	span.addEventListener("click", (e)=>{
		console.log("awejfio");
		e.target.className += 'click';
	});
});
</script>
</body>
</html>