<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/AdminMenu.css"/>

<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<h2>
				고객센터 메뉴</h2>
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는 질문<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a>
					</li>
					<li class='on'><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a>
					</li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역
							확인<i></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>