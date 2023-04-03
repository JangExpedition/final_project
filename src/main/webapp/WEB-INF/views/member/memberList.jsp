<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css"/>

<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<h2>
				고객센터 메뉴</h2>
			<div class="snb">
				<ul class="ul1">
					<li class='on'><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a>
					</li>
					<li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의
							관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule.do">상영
							관리<i></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">회원 관리</h2>
			</div>

			<br>

			<form:form action="${pageContext.request.contextPath}/member/searchMember" method="get" class="mb-3">
    <div class="input-group">
        <select name="searchType" id="selsearchfield" class="c_select">
            <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>이름</option>
            <option value="id" ${param.searchType == 'id' ? 'selected' : ''}>아이디</option>
            <option value="phone" ${param.searchType == 'phone' ? 'selected' : ''}>전화번호</option>
        </select>
        <input type="text" class="form-control" id="myElement" placeholder="회원명 검색"
            aria-label="Recipient's username" aria-describedby="button-addon2" name="keyword" />
        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
    </div>
</form:form>

			<div class="c_tab_wrap">
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">나이</th>
							<th scope="col">생년월일</th>
							<th scope="col">가입일</th>
							<th scope="col">추방</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${members}" var="member">
							<tr>
								<td>${member.id }</td>
								<td>${member.name}</td>
								<td>${member.email}</td>
								<td>${member.phone}</td>
								<td>${member.age}세</td>
								<td>${member.birth}</td>
								<td>
									<fmt:parseDate value="${member.enrollDate}" pattern="yyyy-MM-dd" var="enrollDate" />
									<fmt:formatDate value="${enrollDate}" pattern="yy/MM/dd" />
								</td>
								<td>
									<form:form action="${pageContext.request.contextPath}/member/deleteMember.do"
										method="post" onsubmit="return confirm('해당 회원을 탈퇴시키시겠습니까?')">
										<input type="hidden" name="id" value="${member.id}">
										<button type="submit"><i class="fas fa-user-times"></i></button>
									</form:form>
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
<c:url var="prevPageLink" value="/member/memberList.do">
    <c:param name="page" value="${currentPage - 1}"/>
</c:url>

<c:url var="nextPageLink" value="/member/memberList.do">
    <c:param name="page" value="${currentPage + 1}"/>
</c:url>

<c:url var="lastPageLink" value="/member/memberList.do">
    <c:param name="page" value="${totalPages}"/>
</c:url>	

<%-- 페이지 링크 표시 --%>
<div class="contentss">
    <c:if test="${currentPage > 1}">
        <a class="btn-paging prev" href="${prevPageLink}">이전</a>
    </c:if>

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
    <c:url var="pageLink" value="/member/memberList.do">
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

</body>
</html>