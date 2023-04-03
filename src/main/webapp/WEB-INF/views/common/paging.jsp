<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/paging.css"/>
<body>


<%-- 페이지 번호 계산 --%>
<c:set var="currentPage" value="${not empty param.page ? param.page : 1}"/>
<c:set var="pageSize" value="${10}"/>
<c:set var="startPage" value="${(currentPage - 1) / 10 * 10 + 1}"/>
<c:set var="endPage" value="${(startPage + 9) > param.totalPages ? param.totalPages : (startPage + 9)}"/>

<%-- 페이지 링크 생성 --%>
<c:url var="prevPageLink" value="${param.nowURL}">
    <c:param name="page" value="${currentPage - 1}"/>
</c:url>

<c:url var="nextPageLink" value="${param.nowURL}">
    <c:param name="page" value="${currentPage + 1}"/>
</c:url>

<c:url var="lastPageLink" value="${param.nowURL}">
    <c:param name="page" value="${param.totalPages}"/>
</c:url>

<%-- 페이지 링크 표시 --%>
<div class="contentss">
    <c:if test="${currentPage > 1}">
        <a class="btn-paging prev" href="${prevPageLink}">이전</a>
    </c:if>

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
        <c:url var="pageLink" value="${param.nowURL}">
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

    <c:if test="${currentPage < param.totalPages}">
        <a href="${nextPageLink}" class="btn-paging next" >다음</a>
    </c:if>

    <c:if test="${currentPage != param.totalPages}">
        <a href="${lastPageLink}" class="btn-paging end" >마지막</a>
    </c:if>
</div>

</body>
</html>