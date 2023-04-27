<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<head>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/cinemaDetail.css" />

	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/admin2.js"></script>

<body>
	<div id="contents">
		<div class="cols-content">
			<div class="col-aside">
				<h2>
					고객센터 메뉴</h2>
				<div class="snb">
					<ul class="ul1">
						<li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원
								관리<i></i></a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a>
						</li>
						<li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의
								관리<i></i></a></li>
						<li class='on'><a href="${ pageContext.request.contextPath }/schedule/cinemaList.do">상영
								관리<i></i></a></li>
					</ul>
				</div>
			</div>

			<div id="calendar">

				<div id="calendar_header">
					<i class="icon-chevron-left"></i>
					<h1></h1>
					<i class="icon-chevron-right"></i>
				</div>

				<div id="calendar_weekdays"></div>
				<div id="calendar_content"></div>
			</div>
		</div>
	</div>

	<script>
		const calendarContent = document.getElementById('calendar_content');
		calendarContent.addEventListener('click', function () {
			window.location.href = '${pageContext.request.contextPath}/schedule/insertSchedule.do';
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>