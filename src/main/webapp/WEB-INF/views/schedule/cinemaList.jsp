<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>




<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css" />
<div id="contents">
	<div>
		<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	</div>

	<div>
		<div class="cols-content">


			<div class="col-detail">
				<div class="customer_top">
					<h2 class="tit">상영 관리</h2>
				</div>

				<br>


				<form:form action="${pageContext.request.contextPath}/schedule/searchCinema" method="get" class="mb-3">
					<div class="input-group">
						<input type="hidden" name="searchType" value="name" />
						<input type="text" class="form-control" id="myElement" placeholder="영화관  검색"
							aria-label="Recipient's username" aria-describedby="button-addon2" name="name" />
						<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</form:form>

				<div class="c_tab_wrap">
				</div>
				<div class="tbl_area">
					<table class="tbl_notice_list">
						<thead>
							<tr>
								<th scope="col">지점명</th>
								<th scope="col">주소</th>
								<th scope="col">영화 제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cinemaList}" var="cinema">
								<tr data-name="${cinema.name}">
									<td>${cinema.name}</td>
									<td>${cinema.address}</td>
								</tr>
							</c:forEach>
							<c:forEach items="${movieList}" var="movie">
								<tr>
									<td>${movie.title}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	document.querySelectorAll("tr[data-name]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const name = tr.dataset.name;
			console.log(name);
			location.href = '${pageContext.request.contextPath}/schedule/cinemaDetail.do';
		});
	});
</script>
</body>

</html>