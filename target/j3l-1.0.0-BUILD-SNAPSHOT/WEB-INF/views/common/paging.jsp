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
<c:choose>
    <%--1 ~ pageSize--%>
    <c:when test="${currentPage < pageSize+1}">
        <c:set var="startPage" value="1"/>
        <c:set var="endPage" value="${pageSize}"/>
    </c:when>
    <c:otherwise>
        <fmt:parseNumber var="currentBlock" integerOnly="true" value="${(currentPage-1)/pageSize}"/>
        <c:set var="startPage" value="${pageSize * (currentBlock) +1}"/>
        <c:set var="endPage" value="${pageSize * (currentBlock+1)}"/>
    </c:otherwise>
</c:choose>

<c:if test="${endPage > param.totalPages}">
    <c:set var="startPage" value="${1}"/>
    <c:set var="endPage" value="${param.totalPages}"/>
</c:if>

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

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
        <c:url var="pageLink" value="${param.nowURL}">
            <c:param name="page" value="${page}"/>
        </c:url>

        <c:choose>
            <c:when test="${page == currentPage}">
                <b class="first">${page}</b>
            </c:when>
            <c:otherwise>
                <a class="number" href="${pageLink}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${currentPage != param.totalPages}">
        <a href="${lastPageLink}" class="btn-paging end">마지막</a>
    </c:if>
</div>

</body>
</html>