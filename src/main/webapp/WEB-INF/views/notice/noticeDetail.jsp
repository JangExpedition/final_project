<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" media="all" type="text/css" href="${ pageContext.request.contextPath }/resources/css/noticeDetail.css"/>


<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<h2>고객센터 메뉴</h2>
			<div class="snb">
				<ul>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
					<li class='on'><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인<i></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">자주찾는 질문</h2>
				<p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. <br />궁금하신 내용에 대해 검색해보세요.</p>
			</div>
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${notice.classifyy.koreanNamee} ${notice.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day">
								<fmt:parseDate value="${notice.createdAt}" pattern="yyyy-MM-dd" var="createdAt" />
								<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd" />
					</li>
				</ul>


				<div class="view_area">
					<p id="text">${notice.content}</p>
				</div>
				<div class="button-group">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="button2">
						<form:form name="noticeDeleteFrm"
							action="${pageContext.request.contextPath}/notice/deleteNotice.do" method="post"
							onsubmit="return confirm('해당 게시물을 삭제하시겠습니까?')">
							<input type="hidden" name="no" value="${notice.no}" />
							<input type="submit" class="round inblack" id="btn_delete" value="삭제" />
						</form:form>
					</div>
					</sec:authorize>
					<div class="button">
						<a href="${pageContext.request.contextPath}/notice/noticeList.do">
							<button type="button" class="round inblack" id="btn_list">
								<span>목록으로</span>
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>