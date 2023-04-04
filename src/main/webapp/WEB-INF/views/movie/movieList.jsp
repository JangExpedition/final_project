<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieList.css"/>


<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<h2>
				고객센터 메뉴</h2>
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
					<li class='on'><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule.do">상영 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/store/snackEnroll.do">메뉴 관리<i></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-detail">
			<div class="movieForm">
				<div class="customer_top">
					<h2 class="tit">영화 관리</h2>
				</div>

				<br>

				<form:form action="${pageContext.request.contextPath}/movie/searchMovie" method="get" class="mb-3">
					<div class="input-group">
						<input type="hidden" name="searchType" value="title" />
						<input type="text" class="form-control" id="myElement" placeholder="영화 검색"
							aria-label="Recipient's username" aria-describedby="button-addon2" name="title" />
						<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</form:form>

				<div class="parent">
					<a href="#" id="btn-add">영화 등록</a>
				</div>

				<div class="c_tab_wrap">
				</div>
				<div class="tbl_area">
					<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">장르</th>
								<th scope="col">출연진</th>
								<th scope="col">감독</th>
								<th scope="col">연령</th>
								<th scope="col">러닝타임</th>
								<th scope="col">개봉일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${movieList}" var="movie">
								<tr data-no="${movie.no}">
									<td>${movie.no}</td>
									<td>${movie.title}</td>
									<td>${movie.genre.krName}</td>
									<td class="actors">${movie.actors}</td>
									<td>${movie.director}</td>
									<td>${movie.limitAge}세</td>
									<td>${movie.runningTime}분</td>
									<td>${movie.openDt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 페이지 번호 계산 --%>
<c:set var="currentPage" value="${not empty param.page ? param.page : 1}"/>
<c:set var="pageSize" value="${5}"/>
<c:set var="startPage" value="${(currentPage - 1) / 10 * 10 + 1}"/>
<c:set var="endPage" value="${(startPage + 5) > totalPages ? totalPages : (startPage + 5)}"/>

<%-- 페이지 링크 생성 --%>
<c:url var="prevPageLink" value="/movie/movieList.do">
    <c:param name="page" value="${currentPage - 1}"/>
</c:url>

<c:url var="nextPageLink" value="/movie/movieList.do">
    <c:param name="page" value="${currentPage + 1}"/>
</c:url>

<c:url var="lastPageLink" value="/movie/movieList.do">
    <c:param name="page" value="${totalPages}"/>
</c:url>	

<%-- 페이지 링크 표시 --%>
<div class="contentss">
    <c:if test="${currentPage > 1}">
        <a class="btn-paging prev" href="${prevPageLink}">이전</a>
    </c:if>

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
    <c:url var="pageLink" value="/movie/movieList.do">
        <c:param name="page" value="${page}"/>
    </c:url>

    <c:choose>
        <c:when  test="${page == currentPage}">
            <b class="first">${page}</b>
        </c:when>
        <c:otherwise>
            <a class="number" href="${pageLink}">${page}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="${nextPageLink}" class="btn-paging next" >다음</a>
    </c:if>

    <c:if test="${currentPage != totalPages}">
        <a href="${lastPageLink}" class="btn-paging end" >마지막</a>
    </c:if>
</div>


<script>
	document.querySelector("#btn-add").addEventListener('click', (e) => {
		location.href = '${pageContext.request.contextPath}/movie/movieForm.do';
	});

	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const no = tr.dataset.no;
			console.log(no);
			location.href = '${pageContext.request.contextPath}/movie/movieDetail.do?no=' + no;
		});
	});
</script>

</body>
</html>