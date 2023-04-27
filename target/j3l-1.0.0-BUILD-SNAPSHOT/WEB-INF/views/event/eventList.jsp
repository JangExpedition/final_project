<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="이벤트|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/eventSpecial.css"/>
<body>


<div id="contents">
    <div class="tit-heading-wrap tit-evt">
        <h3>EVENT</h3>
    </div>

    <div class="evt-nav-area">
        <ul class="evt-tab-menu">
            <li>
                <a href="${ pageContext.request.contextPath }/event/events.do?category=SPECIAL"
                   class="<c:if test="${category.name() == 'SPECIAL'}">on</c:if>">SPECIAL</a>
            </li>
            <li>
                <a href="${ pageContext.request.contextPath }/event/events.do?category=MOVIEYEME" title=""
                   class="<c:if test="${category.name() == 'MOVIEYEME'}">on</c:if>">영화/예매</a>
            </li>
            <li>
                <a href="${ pageContext.request.contextPath }/event/events.do?category=MEMBERSHIP" title=""
                   class="<c:if test="${category.name() == 'MEMBERSHIP'}">on</c:if>">멤버십/CLUB</a>
            </li>
            <li>
                <a href="${ pageContext.request.contextPath }/event/events.do?category=JAEHYUSALE" title=""
                   class="<c:if test="${category.name() == 'JAEHYUSALE'}">on</c:if>">제휴/할인</a>
            </li>
        </ul>
    </div>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <div class="parent">
            <a href="#" id="btn-add">글쓰기</a>
        </div>
    </sec:authorize>
</div>


<div class="cols-content">
    <div class="col-detail event">
        <ul class="sect-evt-item-list">
            <c:forEach items="${eventList}" var="event" varStatus="status">
                <li data-no="${event.no}">
                    <a id="tile_${status.index}" href="eventDetail.do?no=${event.no}">
                        <div class="evt-thumb">
                            <img src="${ pageContext.request.contextPath }/resources/upload/event/${event.attachments[0].renamedFilename }"/>
                            <div class="evt-desc">
                                <p class="txt1">${ event.title }</p>
                                <p>
									<fmt:parseDate value="${event.createdAt}" pattern="yyyy-MM-dd" var="createdAt" />
									<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd" />
								</p>
                            </div>
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/paging.jsp">
    <jsp:param value="${page}" name="page"/>
    <jsp:param value="${totalPages}" name="totalPages"/>
    <jsp:param value="/event/events.do?category=${category}" name="nowURL"/>
</jsp:include>


<script>
    document.querySelector("#btn-add").addEventListener('click', (e) => {
        location.href = '${pageContext.request.contextPath}/event/eventForm.do';
    });

    document.querySelectorAll("li[data-no]").forEach((li) => {
        li.addEventListener('click', (e) => {
            const no = li.dataset.no;
            console.log(no);
            location.href = '${pageContext.request.contextPath}/event/eventDetail.do?no=' + no;
        });
    });

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>