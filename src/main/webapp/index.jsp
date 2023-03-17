<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<!-- index.css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/index.css"/>
<section id="mainSection">
	<div id="previewBox">
		<iframe width="980" height="489" 
		src="https://www.youtube.com/embed/enPPU3GCSEM?autoplay=1&mute=1" 
		title="YouTube video player" 
		frameborder="0" 
		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
		allowfullscreen></iframe>
	</div>
	<div id="movieBox">
		<div id="movieFilterBox">
			<h4 class="movieFilter">무비차트</h4>
			<h4 class="movieFilter">상영예정작</h4>
		</div>
		<div id="movieContainer">
			<div id="movieConveyer">
				<div id="movieCard1" class="movieCard">
					<div id="moviePoster1" class="moviePoster"></div>
					<h4 id="movieName1" class="movieName"></h4>
				</div>
				<div id="movieCard2" class="movieCard">
					<div id="moviePoster2" class="moviePoster"></div>
					<h4 id="movieName2" class="movieName"></h4>
				</div>
				<div id="movieCard3" class="movieCard">
					<div id="moviePoster3" class="moviePoster"></div>
					<h4 id="movieName3" class="movieName"></h4>
				</div>
				<div id="movieCard4" class="movieCard">
					<div id="moviePoster4" class="moviePoster"></div>
					<h4 id="movieName4" class="movieName"></h4>
				</div>
				<div id="movieCard5" class="movieCard">
					<div id="moviePoster5" class="moviePoster"></div>
					<h4 id="movieName5" class="movieName"></h4>
				</div>
				<div id="movieCard6" class="movieCard">
					<div id="moviePoster6" class="moviePoster"></div>
					<h4 id="movieName6" class="movieName"></h4>
				</div>
				<div id="movieCard7" class="movieCard">
					<div id="moviePoster7" class="moviePoster"></div>
					<h4 id="movieName7" class="movieName"></h4>
				</div>
				<div id="movieCard8" class="movieCard">
					<div id="moviePoster8" class="moviePoster"></div>
					<h4 id="movieName8" class="movieName"></h4>
				</div>
				<div id="movieCard9" class="movieCard">
					<div id="moviePoster9" class="moviePoster"></div>
					<h4 id="movieName9" class="movieName"></h4>
				</div>
				<div id="movieCard10" class="movieCard">
					<div id="moviePoster10" class="moviePoster"></div>
					<h4 id="movieName10" class="movieName"></h4>
				</div>
			</div>
		</div>
	</div>
	<div id="eventBox">
	</div>
</section>
<script>
window.onload = () => {
	$.ajax({
		url: "${pageContext.request.contextPath}/movie/selectAllMovieList.do",
		success(data){
			data.forEach((movie, index)=>{
				console.log(movie);
				const moviePoster = document.querySelector("#moviePoster" + (index + 1));
				const movieName = document.querySelector("#movieName" + (index + 1));
				const {renamedFilename} = movie.attachments[0];
				moviePoster.style.backgroundImage = "url('${pageContext.request.contextPath}/resources/upload/movie/" + renamedFilename + "')";
				movieName.innerText = movie.title;
			});
		},
		error: console.log
	});
	
	filterSelected("무비차트");
}

// 영화필터 선택 메서드
document.querySelectorAll(".movieFilter").forEach((movieFilter)=>{
	movieFilter.addEventListener("click", (e)=>{
		filterSelected(e.target.innerText);
	});
});

// 영화필터 선택 효과 메서드
const filterSelected = (name) => {
	document.querySelectorAll(".movieFilter").forEach((movieFilter)=>{
		if(movieFilter.innerText === name){
			movieFilter.classList += " filterSelected";
		}
		else{
			movieFilter.classList = "movieFilter";
		}
	});	
};
</script>
</body>
</html>