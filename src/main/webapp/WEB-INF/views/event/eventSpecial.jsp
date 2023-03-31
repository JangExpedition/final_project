<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="이벤트|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/eventSpecial.css"/>


<div id="contents">
    <div class="tit-heading-wrap tit-evt">
        <h3>EVENT</h3>
    </div>

    <div class="evt-nav-area">
        <ul class="evt-tab-menu">
            <li><a href="${ pageContext.request.contextPath }/event/eventSpecial.do" class="on">SPECIAL</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventMovie.do" title="" class="">영화/예매</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventMembership.do" title="" class="">멤버십/CLUB</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventSale.do" title="" class="">제휴/할인</a></li>
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
            <li>
                <a id="tile_${status.index}" href="">
                    <div data-no="${event.no}" class="evt-thumb">
                        <img src="${ pageContext.request.contextPath }/resources/upload/event/${event.attachments[0].renamedFilename }"
                             alt="썸네일"/>
                        <div class="evt-desc">
                            <p class="txt1">${ event.title }</p>
                            <p class="txt2">${ event.content }<span></span><em></em></p>
                            
                        </div>
                    </div>
                </a>
            </li>
            </c:forEach>
        </ul> 
    </div>
</div>
<script>
    document.querySelector("#btn-add").addEventListener('click', (e) => {
        location.href = '${pageContext.request.contextPath}/event/eventForm.do';
    });

    document.querySelectorAll("ul[data-no]").forEach((ul) => {
        ul.addEventListener('click', (e) => {
            const no = ul.dataset.no;
            console.log(no);
            location.href = '${pageContext.request.contextPath}/event/eventDetail.do?no=' + no;
        });
    });

</script>
</body>
</html>