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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movie.css"/>
<section id="movieSection">
	<div id="movieChart">
		<div id="movieChartTitle">
			<h1>무비차트</h1>
		</div>
		<div id="movieFilterBox">
			<label><input id="onScreenFilter" type="checkBox" ${ checked == 1 ? 'checked' : '' }/> 현재 상영작만 보기</label>
		</div>
		<div class="oneLine">
			<c:forEach items="${ movieList }" var="movie" varStatus="vs">
				<c:choose>
					<c:when test="${ vs.count >= 1 && vs.count <= 3 }">
						<div class="oneMovie">
							<div class="movieRank top3">
								No.${ vs.count }
							</div>
							<div class="moviePoster" data-movie-no="${ movie.no }">
								<c:choose>
									<c:when test="${ movie.limitAge == 0 }">
										<span class="badge badge-success">All</span>
									</c:when>
									<c:when test="${ movie.limitAge == 12 }">
										<span class="badge badge-primary">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 15 }">
										<span class="badge badge-warning">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 18 }">
										<span class="badge badge-danger">${ movie.limitAge }</span>
									</c:when>
								</c:choose>
								<img src="${ pageContext.request.contextPath }/resources/upload/movie/${ movie.attachments[0].renamedFilename }">
							</div>
							<p class="movieTitle">${ movie.title }</p>
							<p class="movieOpenDt">${ movie.openDt } 개봉</p>
							<div class="goReservation">
								<input class="reservationBtn" type="button" value="예매하기" data-movie-no="${ movie.no }"/>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
		<div class="oneLine">
			<c:forEach items="${ movieList }" var="movie" varStatus="vs">
				<c:choose>
					<c:when test="${ vs.count >= 4 && vs.count <= 7 }">
						<div class="oneMovie" >
							<div class="movieRank">
								No.${ vs.count }
							</div>
							<div class="moviePoster" data-movie-no="${ movie.no }">
								<c:choose>
									<c:when test="${ movie.limitAge == 0 }">
										<span class="badge badge-success">All</span>
									</c:when>
									<c:when test="${ movie.limitAge == 12 }">
										<span class="badge badge-primary">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 15 }">
										<span class="badge badge-warning">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 18 }">
										<span class="badge badge-danger">${ movie.limitAge }</span>
									</c:when>
								</c:choose>
								<img src="${ pageContext.request.contextPath }/resources/upload/movie/${ movie.attachments[0].renamedFilename }">
							</div>
							<p class="movieTitle">${ movie.title }</p>
							<p class="movieOpenDt">${ movie.openDt } 개봉</p>
							<div class="goReservation">
								<input class="reservationBtn" type="button" value="예매하기" data-movie-no="${ movie.no }"/>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
		<div class="oneLine">
			<c:forEach items="${ movieList }" var="movie" varStatus="vs">
				<c:choose>
					<c:when test="${ vs.count >= 8 && vs.count <= 11 }">
						<div class="oneMovie" >
							<div class="movieRank">
								No.${ vs.count }
							</div>
							<div class="moviePoster" data-movie-no="${ movie.no }">
								<c:choose>
									<c:when test="${ movie.limitAge == 0 }">
										<span class="badge badge-success">All</span>
									</c:when>
									<c:when test="${ movie.limitAge == 12 }">
										<span class="badge badge-primary">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 15 }">
										<span class="badge badge-warning">${ movie.limitAge }</span>
									</c:when>
									<c:when test="${ movie.limitAge == 18 }">
										<span class="badge badge-danger">${ movie.limitAge }</span>
									</c:when>
								</c:choose>
								<img src="${ pageContext.request.contextPath }/resources/upload/movie/${ movie.attachments[0].renamedFilename }">
							</div>
							<p class="movieTitle">${ movie.title }</p>
							<p class="movieOpenDt">${ movie.openDt } 개봉</p>
							<div class="goReservation">
								<input class="reservationBtn" type="button" value="예매하기" data-movie-no="${ movie.no }"/>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
	</div>
</section>
<form name="onScreenFilterFrm" action="${pageContext.request.contextPath}/movie/onScreenFilter.do">
	<input type="hidden" name="checked"/>
</form>
<script>
$("#onScreenFilter").change(function(){
   	const form = document.onScreenFilterFrm;
    if($("#onScreenFilter").is(":checked")){
    	form.checked.value = "1"
    	form.submit();
    }else{
    	form.checked.value = "0"
    	form.submit();
    }
});

document.querySelectorAll(".reservationBtn").forEach((reservationBtn)=>{
	
	reservationBtn.addEventListener("click", (e)=>{
		location.href="${pageContext.request.contextPath}/reservation/reservation.do";
	});
	
});

document.querySelectorAll(".moviePoster").forEach((moviePoster)=>{
	
	moviePoster.addEventListener("click", (e)=>{
		
		let parentDiv = e.target;
		while(parentDiv.tagName !== 'DIV')
			parentDiv = parentDiv.parentElement;
		
		location.href="${pageContext.request.contextPath}/movie/movieInfo.do?no=" + parentDiv.dataset.movieNo;
	});
});
</script>
</body>
</html>