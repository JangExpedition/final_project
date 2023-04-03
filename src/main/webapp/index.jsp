<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
 <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
 
<!-- index.css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/index.css"/>
</head>

<section id="mainSection">
	<div id="previewBox">
		<iframe width="980" height="489" src="https://www.youtube.com/embed/enPPU3GCSEM?autoplay=1&mute=1"
			title="YouTube video player" frameborder="0"
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
		<div class="slider__container">
			<div class="slider__header">
				<h2>EVENT</h2>
				<div class="silder_main">
					<button class="slider__autoplay on">
						<img id="pause" src="${ pageContext.request.contextPath }/resources/images/pause.png"
							alt="pause btn" />
						<img id="play" src="${ pageContext.request.contextPath }/resources/images/play.png"
							alt="pause btn" />
					</button>
					<a href="${ pageContext.request.contextPath }/event/events.do?category=SPECIAL" id="btn_allView_Event"
						class="btn_allView">전체보기</a>
				</div>
			</div>
		</div>
		
		<div class="slider">
			<c:forEach items="${eventList}" var="event">
				<div class="slider__content">
					<img src="${ pageContext.request.contextPath }
					/resources/upload/event/${event.attachments[0].renamedFilename }" alt=""/>
					<p>${event.title}</p>
					<p>${event.startDate}</p>
				</div>
			</c:forEach>
		</div>
		
		<div>
    		<div class="slider__container"></div>		
		</div>
  		
  		
	</div>
</section>

<script>
window.onload = () => {
	filterSelected("무비차트");
	
	/* $.ajax({
		  url : "${ pageContext.request.contextPath }/event/selectAllEventList.do",
		  data: {},
		  success(data){
			  
			console.log(data);

		    
			const content = document.querySelector(".slider__container");

		    content.innerHTML = `
		        <div class="slider__header">
		          <h2>EVENT</h2>
		          <button class="slider__autoplay on">
		            <img id="pause" src="./pause.png" alt="pause btn" />
		            <img id="play" src="./play.png" alt="pause btn" />
		          </button>
		        </div>
		        `;
		        
		        
		        
			content.innerHTML += `
		        <div class="slider">
		          <div class="slider__content">
		            <img src="./test.jpeg" alt="" />
		            <p>[테스트] 111</p>
		            <p>2023-04-02</p>
		        </div>
		    `;
		    
		    
			},
			error: console.log
		}); */
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
					
					moviePoster.dataset.movieNo = movie.no;
					
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


	    
// 효과 설정
$(document).ready(function () {
  $(".slider").slick({
    autoplay: true,
    autoplaySpeed: 1000,
    slidesToShow: 3,
    slidesToScroll: 1,
  });
});

// on/off 버튼
const autoBtn = document.querySelector(".slider__autoplay");
const pauseImg = document.querySelector(".slider__autoplay #pause");
const playImg = document.querySelector(".slider__autoplay #play");

autoBtn.addEventListener("click", () => {
  console.log(autoBtn.classList);
  if (autoBtn.classList.contains("on")) {
    $(".slider").slick("slickPause");
    autoBtn.classList.remove("on");
    pauseImg.style.display = "none";
    playImg.style.display = "block";
  } else {
    $(".slider").slick("slickPlay");
    autoBtn.classList.add("on");
    pauseImg.style.display = "block";
    playImg.style.display = "none";
  }
});

};

$(document).on("click", ".moviePoster", function(e){
	
	let parentDiv = e.target;
	while(parentDiv.tagName !== 'DIV')
		parentDiv = parentDiv.parentElement;
	
	location.href="${pageContext.request.contextPath}/movie/movieInfo.do?no=" + parentDiv.dataset.movieNo;
	
});
</script>
</body>
</html>