<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" media="all" type="text/css" href="${ pageContext.request.contextPath }/resources/css/eventDetail.css"/>


<div id="contents">
	<div class="cols-content">
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit"></h2>
				<p class="stit"><br /></p>
			</div> 
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${event.category.krName} ${event.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day"></em></span>
								<fmt:parseDate value="${event.createdAt}" pattern="yyyy-MM-dd" var="createdAt" />
								<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd" />
					</li>
				</ul>
				
				<div class="view_area">
					<img src="${ pageContext.request.contextPath }/resources/upload/event/${event.attachments[0].renamedFilename }"/>
					<p id="text">${event.content} 

					<div class="dir-prev">
					    <a id="list" href="${pageContext.request.contextPath}/event/events.do?category=SPECIAL">
					        <img class="list2" src="${pageContext.request.contextPath}/resources/images/list.png">
					    </a>
					</div>
				</div>
				<div class="button-group">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="button1">
						<form:form name="eventDeleteFrm"
							action="${pageContext.request.contextPath}/event/deleteEvent.do" method="post"
							onsubmit="return confirm('해당 게시물을 삭제하시겠습니까?')">
							<input type="hidden" name="no" value="${event.no}" />
							<input type="submit" class="round inblack" id="btn_delete" value="삭제" />
						</form:form>
					</div>
					<div class="button2">
		  				<form:form name="eventUpdateFrm" action="${pageContext.request.contextPath}/event/eventUpdate.do" method="get">
						    <input type="hidden" name="no" value="${event.no}" />
						    <input type="submit" class="round inblack" id="btn_update" value="수정" />
					  	</form:form>
					</div>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>