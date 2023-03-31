<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="무비차트<무비차트|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movieInfo.css"/>
<section class="movieInfoSection">
	<div class="movieInfoWrapper">
		<div class="moviePoster">
			<img src="${ pageContext.request.contextPath }/resources/upload/movie/${ movie.attachments[0].renamedFilename }">
		</div>
		<div class="movieData">
			<h3>${ movie.title }</h3>
			<p>감독 : ${ movie.director } / 배우 : ${ movie.actors == null ? '' : movie.actors }</p>
			<p>장르 : ${ movie.genre.krName }</p>
			<p>
				<c:if test="${ movie.limitAge == 0 }">
					전체이용가, ${ movie.runningTime }분
				</c:if>
				<c:if test="${ movie.limitAge != 0 }">
					${ movie.limitAge }세이용가, ${ movie.runningTime }분
				</c:if>
			</p>
			<input class="reservationBtn" type="button" value="예매하기" data-movie-no="${ movie.no }"/>
		</div>
	</div>
	<div class="synopsisBox">
		${ movie.synopsis }
	</div>
</section>
<script>
	document.querySelector(".reservationBtn").addEventListener("click", ()=>{
		location.href = "${pageContext.request.contextPath}/reservation/reservation.do";
	});
</script>
</body>
</html>