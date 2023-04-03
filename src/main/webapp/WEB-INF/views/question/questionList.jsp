<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/questionList.css"/>

<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<h2>
				고객센터 메뉴</h2>
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a>
					</li>
					<li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
					<li class='on'><a href="${ pageContext.request.contextPath }/question/questionList.do">문의
							관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule.do">상영
							관리<i></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">문의 관리</h2>
			</div>

			<br>

			<div class="c_tab_wrap">
			</div>
			<div class="tbl_area">
				<table class="tbl_notice_list">
					<thead>
						<tr>
							<th scope="col">문의 번호</th>
							<th scope="col">이름</th>
							<th scope="col">문의 유형</th>
							<th scope="col">제목</th>
							<th scope="col">이메일</th>
							<th scope="col">문의일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questionList}" var="question">
							<tr data-no="${question.no}">
								<td>${question.no}</td>
								<td>${question.title}</td>
								<td>${question.type.krName}</td>
								<td>${question.name}</td>
								<td>${question.email}</td>
								<td>
									<fmt:parseDate value="${question.regDate}" pattern="yyyy-MM-dd" var="regDate" />
									<fmt:formatDate value="${regDate}" pattern="yy/MM/dd" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
<c:url var="prevPageLink" value="/question/questionList.do">
    <c:param name="page" value="${currentPage - 1}"/>
</c:url>

<c:url var="nextPageLink" value="/question/questionList.do">
    <c:param name="page" value="${currentPage + 1}"/>
</c:url>

<c:url var="lastPageLink" value="/question/questionList.do">
    <c:param name="page" value="${totalPages}"/>
</c:url>	

<%-- 페이지 링크 표시 --%>
<div class="contentss">
    <c:if test="${currentPage > 1}">
        <a class="btn-paging prev" href="${prevPageLink}">이전</a>
    </c:if>

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
    <c:url var="pageLink" value="/question/questionList.do">
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
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const no = tr.dataset.no;
			console.log(no);
			location.href = '${pageContext.request.contextPath}/question/questionDetail.do?no=' + no;
		});
	});
</script>
</body>
</html>