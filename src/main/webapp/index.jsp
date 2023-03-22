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
			
			</div>
		</div>
	</div>
	<div id="eventBox">
	</div>
</section>

<script>
window.onload = () => {
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
	
	console.log(name);
	
	document.querySelectorAll(".movieFilter").forEach((movieFilter)=>{
		if(movieFilter.innerText === name){
			movieFilter.classList += " filterSelected";
		}
		else{
			movieFilter.classList = "movieFilter";
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/movie/selectAllMovieList.do",
			data: {name: name},
			success(data){
				
				
				const movieConveyer = document.querySelector("#movieConveyer");
				movieConveyer.innerHTML = "";
				
				data.forEach((movie, index)=>{
					
					const movieCard = document.createElement("div");
					const moviePoster = document.createElement("div");
					const movieLimitAge = document.createElement("span");
					const movieName = document.createElement("h4");
					const movieRank = document.createElement("h1");
					
					const {renamedFilename} = movie.attachments[0];
					
					moviePoster.style.backgroundImage = 
						"linear-gradient(to bottom, #00000000, #000000cc), url('${pageContext.request.contextPath}/resources/upload/movie/" + renamedFilename + "')";
					movieName.innerText = movie.title;
					movieRank.innerText = index + 1;
					
					movieCard.classList = "movieCard";
					moviePoster.classList = "moviePoster";
					movieLimitAge.classList = "movieLimitAge badge";
					movieName.classList = "movieName";
					movieRank.classList = "movieRank";
					
					switch(movie.limitAge){
					case 0 : movieLimitAge.classList += " badge-success"; movieLimitAge.innerText = "All"; break; 
					case 12 : movieLimitAge.classList += " badge-primary"; movieLimitAge.innerText = movie.limitAge; break; 
					case 15 : movieLimitAge.classList += " badge-warning"; movieLimitAge.innerText = movie.limitAge; break; 
					case 18 : movieLimitAge.classList += " badge-danger"; movieLimitAge.innerText = movie.limitAge; break; 
					}
					
					moviePoster.append(movieLimitAge);
					moviePoster.append(movieRank);
					
					movieCard.append(moviePoster);
					movieCard.append(movieName);
					
					movieConveyer.append(movieCard);
				}); // forEach end
			},
			error: console.log
		}); // ajax end
		
	});	
};
</script>
</body>
</html>