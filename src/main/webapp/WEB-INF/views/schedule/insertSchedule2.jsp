<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/insertSchedule.css" />

<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<div class="snb">
				<ul class="ul1">
					<li class=''><a
							href="${ pageContext.request.contextPath }/member/memberList.do">회원
							관리<i></i></a></li>
					<li class=''><a
							href="${ pageContext.request.contextPath }/movie/movieList.do">영화
							관리<i></i></a></li>
					<li class=''><a
							href="${ pageContext.request.contextPath }/question/questionList.do">문의
							관리<i></i></a></li>
					<li class='on'><a
							href="${ pageContext.request.contextPath }/schedule/insertSchedule2.do">상영
							관리<i></i></a></li>
				</ul>
			</div>
		</div>

		<form:form action="${ pageContext.request.contextPath }/schedule/insertSchedule.do"
			method="post">
			<h1>상영 등록</h1>
			<table class="ttbl">
				<tr>
					<td class="tit">상영관</td>
					<td>
						<select name="theaterNo">
							<c:forEach items="${ theaterList }" var="theater">
								<option value="${ theater.no }">${ theater.cinemaName } ${
									theater.theaterNo }관</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tit">영화명</td>
					<td>
						<select id="movieSelect" name="movieNo">
							<c:forEach items="${ movieList }" var="movie">
								<option value="${ movie.no }">${ movie.title }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tit">시작 시간</td>
					<td>
						<input id="startTime" name="startTime" type="datetime-local" />
					</td>
				</tr>
				<tr>
					<td class="tit">끝나는 시간</td>
					<td>
						<input id="endTime" name="endTime" type="datetime-local" />
					</td>
				</tr>
				<tr>
					<td class="tit">등록</td>
					<td>
						<input type="submit" value="등록" />
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</div>




<script>
	const startTime = document.querySelector("#startTime");
	let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
	startTime.setAttribute("min", date);

	// 시작시간 입력시 종료시간 자동계산 메서드
	const movieSelect = document.querySelector("#movieSelect");
	startTime.addEventListener("change", (e) => {
		const movieNo = movieSelect.value;

		$.ajax({
			url: "${pageContext.request.contextPath}/schedule/getMovieRunningTime.do",
			data: { movieNo },
			success(runningTime) {

				document.querySelector("#endTime").value = new Date(new Date(e.target.value).getTime()
					+ runningTime * 60000
					- new Date().getTimezoneOffset() * 60000
				).toISOString().slice(0, 16);
			},
			error: console.log
		});
	});
</script>
</body>
</html>