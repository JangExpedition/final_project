<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieDetail.css" />


<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
					<li class='on'><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule.do">상영 관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/store/snackEnroll.do">메뉴 관리<i></i></a></li>
				</ul>
			</div>
		</div>

		<h1>영화 정보 수정/삭제</h1>
		<table class="ttbl">
			<tr>
				<td class="tit">제목</td>
				<td><input type="text" placeholder="제목" name="title" class="input_txt" maxlength="30"
						value="${movie.title}" required></td>
			</tr>
			<tr>
				<td class="tit">출연진</td>
				<td><input type="text" placeholder="출연진" name="actors" id="actors" class="input_txt"
						value="${movie.actors}" required></td>
			</tr>
			<tr>
				<td class="tit">감독</td>
				<td>
					<input type="text" placeholder="감독" name="director" class="input_txt" value="${movie.director}"
						required />
				</td>
			</tr>
			<tr>
				<td class="tit">개봉일</td>
				<td>
					<input type="text" placeholder="개봉일" name="openDt" class="input_txt" value="${movie.openDt}"
						required />
				</td>
			</tr>
			<tr>
				<td class="tit">러닝타임</td>
				<td>
					<input type="text" placeholder="러닝타임" name="runningTime" class="input_txt"
						value="${movie.runningTime}분" required />
				</td>
			</tr>
			<tr>
				<td class="tit">장르</td>
				<td>
					<input type="checkbox" value="ACTION" ${movie.genre.krName=='액션' ? 'checked' : '' }
						name="genre" />액션
					<input type="checkbox" value="COMEDY" ${movie.genre.krName=='코미디' ? 'checked' : '' }
						name="genre" />코미디
					<input type="checkbox" value="ROMANCE" ${movie.genre.krName=='로맨스' ? 'checked' : '' }
						name="genre" />로맨스
					<input type="checkbox" value="ANIMATION" ${movie.genre.krName=='애니메이션' ? 'checked' : '' }
						name="genre" />애니메이션
					<input type="checkbox" value="HORROR" ${movie.genre.krName=='호러' ? 'checked' : '' }
						name="genre" />호러
					<input type="checkbox" value="DOCUMENTARY" ${movie.genre.krName=='다큐멘터리' ? 'checked' : '' }
						name="genre" />다큐
					<input type="checkbox" value="DRAMA" ${movie.genre.krName=='드라마' ? 'checked' : '' }
						name="genre" />드라마
				</td>
			</tr>
			<tr>
				<td class="tit">연령</td>
				<td>
					<select name="limitAge">
						<option value="0" ${movie.limitAge=='0' ? 'selected' : '' }>전체이용가
						</option>
						<option value="12" ${movie.limitAge=='12' ? 'selected' : '' }>12세이용가
						</option>
						<option value="15" ${movie.limitAge=='15' ? 'selected' : '' }>15세이용가
						</option>
						<option value="18" ${movie.limitAge=='18' ? 'selected' : '' }>청소년관람불가
						</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="tit">첨부파일</td>
				<td>
					<input type="file" name="upFile" id="upFile" multiple />
				</td>
			</tr>
			<tr>
				<td class="tit">시놉시스</td>
				<td>
					<textarea name="synopsis" placeholder="시놉시스">${movie.synopsis}</textarea>
				</td>
			</tr>
		</table>
		<div class="fn1">
			<form:form name="movieUpdateFrm" action="${pageContext.request.contextPath}/movie/updateMovie.do"
				method="POST">
				<input type="submit" value="수정" />
			</form:form>
			<form:form name="movieDeleteFrm" action="${pageContext.request.contextPath}/movie/deleteMovie.do"
				method="post">
				<input type="hidden" name="no" value="${movie.no}">
				<input type="submit" value="삭제" />
			</form:form>
		</div>
	</div>
</div>
</body>
</html>