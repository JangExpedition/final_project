<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/reservation.css"/>
<!-- 예매 섹션 -->
<section class="reservation-section">
	<!-- 예매 초기화 -->
	<div class="reset-wrapper">
		<div class="reset-box">
			<button id="resetBtn" type="button"><i class="fa-solid fa-rotate-right"></i> 예매 다시하기</button>
		</div>
	</div>
	<!-- 예매 구간 -->
	<div class="steps">
		<!-- 영화선택 구간 -->
		<div class="step">
			<div class="table-head">영화</div>
			<div class="table-body">
				<div class="movie-filter">
					<span class="filter non-click">예매율순</span>
					<span class="filter non-click">가나다순</span>
				</div>
				<div id="movieList" class="movie-list">
				
				</div>
			</div>
		</div>
		<!-- 영화선택 구간 -->
		<!-- 극장선택 구간 -->
		<div class="step">
			<div class="table-head">극장</div>
			<div class="table-body flex-box">
				<div class="location-box">
					<c:forEach items="${ locationList }" var="location">
						<div class="location-tr">
							${ location.locationName.krName }
						</div>
					</c:forEach>
				</div>
				<div class="cinema-box">
					<c:forEach items="${ cinemaList }" var="cinema">
						<div class="cinemaName" data-location="${ cinema.locationName.krName }">${ cinema.name }</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 극장선택 구간 -->
		<div class="step step3">
			<div class="table-head">날짜</div>
			<div id="dayList" class="table-body">
			
			</div>
		</div>
		<div class="step step4">
			<div class="table-head">시간</div>
		</div>
	</div>
	<!-- 예매 구간 -->
</section>
<!-- 예매 섹션 -->
<!-- 예매확인 섹션 -->
<section class="reservation-check-section">
	<div class="check-box">
		<div id="MovieCheck" class="check1">
			<h3>영화선택</h3>
			<input id="reservationMovieNo" type="hidden"/>
			<img id="moviePoster" src="">
			<p id="reservationMovieTitle"></p>
		</div>
		<div id="CheckInfo" class="check2">
			<h3>극장선택</h3>
			<p id="checkCinema">극장 <span></span></p>			
			<p id="checkScheduel">일시 <span></span></p>			
			<p id="checkTheater">상영관 <span></span></p>			
		</div>
		<div class="check3">
		</div>
		<div class="check4">
		</div>
	</div>
</section>
<!-- 예매확인 섹션 -->
<script>
window.onload = () =>{
	filterEffect("예매율순");
	selectLocation("서울");
	
	const today = new Date();
	
	const yearArr = [];
	const monthArr = [];
	const date = [];
	const days = [];
	
	for(let i = 0; i < 21; i++){
		
		let day = null;
		if(i === 0){
			day = new Date(today.setDate(today.getDate()));
		}
		else{
			day = new Date(today.setDate(today.getDate() + 1));
		}
		
		yearArr.push(day.getFullYear());
		monthArr.push(day.getMonth()+1);
		date.push(day.getDate());
		days.push(day.getDay());
	}
	
	// 요일 지정
	const weekday = [];
	
	days.forEach((day)=>{
		switch(day){
		case 0 : weekday.push("일"); break;
		case 1 : weekday.push("월"); break;
		case 2 : weekday.push("화"); break;
		case 3 : weekday.push("수"); break;
		case 4 : weekday.push("목"); break;
		case 5 : weekday.push("금"); break;
		case 6 : weekday.push("토"); break;
		}	
	});
	
	// 중복제거
	const years = [];
	const months = [];
	
	yearArr.forEach((year)=>{
		if(!years.includes(year))
			years.push(year);
	});
	
	monthArr.forEach((month)=>{
		if(!months.includes(month))
			months.push(month);
	});
	
	const dayList = document.querySelector("#dayList");
	
	// 년도가 하나인 경우
	if(years.length === 1){
		
		// 년도가 하나이면서 월도 하나인 경우
		if(months.length === 1){
			
			dayList.innerHTML = `
			<div>
				<p class="reservationYear">\${ years[0] }</p>
			</div>
			`;
			
			for(let i = 0; i < date.length; i++){
				if(i === 0){
					dayList.innerHTML += `
					<div>
						<h1 class="reservationMonth">\${ months[0] }</h1>
						<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else {
					dayList.innerHTML += `
						<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
						<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					</div>
					`;
				}
			};
			
		}
		// 년도가 하나이면서 월은 두개인 경우
		else{
		
			dayList.innerHTML = `
			<div>
				<p class="reservationYear">\${ years[0] }</p>
			</div>
			`;
			
			for(let i = 0; i < date.length; i++){
				if(i === 0){
					dayList.innerHTML += `
					<div>
						<h1 class="reservationMonth">\${ months[0] }</h1>
						<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else if(date[i] > date[i-1]){
					dayList.innerHTML += `
						<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else{
					dayList.innerHTML += `
							<h1 class="reservationMonth">\${ months[1] }</h1>
							<p class="reservationDay"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
						</div>
						`;
				}
			};
		}
		
	}
	else{
		// 귀찮..
	}
	
	// 토요일, 일요일 색상 변경
	document.querySelectorAll(".reservationDay").forEach((reservationDay)=>{
		if(reservationDay.firstChild.innerText === "토")
			reservationDay.style.color = "#31597e";
		if(reservationDay.firstChild.innerText === "일")
			reservationDay.style.color = "#ad2727";
	});
}

// 영화 필터 선택 메서드
document.querySelectorAll(".filter").forEach((filter)=>{
	filter.addEventListener("click", (e)=>{
		filterEffect(e.target.innerText);
	});
});

//영화 필터 효과 메서드
const filterEffect = (filterName) =>{
	
	document.querySelectorAll(".filter").forEach((filter)=>{
		
			if(filter.innerText == filterName){
				filter.className += 'click';
			}
			else{
				filter.className = "filter non-click";	
			}
			
			$.ajax({
				url: "${pageContext.request.contextPath}/reservation/selectAllMovieOrderBy.do",
				data: {filterName},
				success(data){
					
					const movieList = document.querySelector("#movieList");
					
					movieList.innerHTML = "";
					
					data.forEach((movie)=>{
						
						const {title, limitAge, attachments, no} = movie;
						
						const movieTitle = document.createElement("div");
						movieTitle.classList = "movieTitle";
						movieTitle.dataset.movieNo = no;
						movieTitle.dataset.moviePoster = attachments[0].renamedFilename;
						
						const span = document.createElement("span");
						span.classList = "badge";
						switch(limitAge){
						case 0 : span.classList = " badge-success"; span.innerText = "All"; break; 
						case 12 : span.classList = " badge-primary"; span.innerText = limitAge; break; 
						case 15 : span.classList = " badge-warning"; span.innerText = limitAge; break; 
						case 18 : span.classList = " badge-danger"; span.innerText = limitAge; break; 
						}
						
						movieTitle.append(span);
						movieTitle.append(title);
						movieList.append(movieTitle);
						
					});
					
				},
				error: console.log
			});
			
	});
	
};

// 영화 선택 메서드
$(document).on("click", ".movieTitle", function(e){
	selectMovie(e.target);
});

// 영화선택 효과 메서드
const selectMovie = (movie) => {
	
	document.querySelectorAll(".movieTitle").forEach((movieTitle)=>{
		
		if(movie.dataset.movieNo === movieTitle.dataset.movieNo){
			movieTitle.classList += " movieTitleSelected";
		}
		else{
			movieTitle.classList = "movieTitle";
		}
	});
	
	document.querySelector("#MovieCheck h3").style.display = "none";
	
	document.querySelector("#reservationMovieNo").value = movie.dataset.movieNo;
	
	const poster = document.querySelector("#moviePoster");
	poster.style.display = "inline";
	poster.src = "${pageContext.request.contextPath}/resources/upload/movie/" + movie.dataset.moviePoster;
	
	const title = document.querySelector("#reservationMovieTitle");
	title.innerHTML = movie.innerHTML;
	title.style.display = "inline";
	
}

//지역선택 메서드
document.querySelectorAll(".location-tr").forEach((locationName)=>{
	locationName.addEventListener("click", ()=>{
		selectLocation(locationName.innerText);
	});
});

// 지역선택 효과 메서드
const selectLocation = (location) => {
	
	document.querySelectorAll(".location-tr").forEach((locationName)=>{
		if(locationName.innerText == location){
			locationName.className += " selected";
		}
		else{
			locationName.className = "location-tr";
		}
	});
	
	document.querySelectorAll(".cinemaName").forEach((cinemaName)=>{
		
		if(cinemaName.dataset.location == location){
			cinemaName.style.display = "inline-block";
		}
		else{
			cinemaName.style.display = "none";
		}
		
	});
};

//영화관 선택 메서드
document.querySelectorAll(".cinemaName").forEach((cinemaName)=>{
	cinemaName.addEventListener("click", (e)=>{
		selectCinema(cinemaName.dataset.location, cinemaName.innerText, e.target);
	});
});

// 영화관 선택 효과 메서드
const selectCinema = (location, name, target) => {
	
	document.querySelectorAll(".cinemaName").forEach((cinemaName)=>{
		
		if(cinemaName.innerText == name){
			cinemaName.className += " selectedCinema";
		}
		else{
			cinemaName.className = "cinemaName";
		}
		
	});
	
	document.querySelector("#CheckInfo h3").style.display = "none";
	document.querySelectorAll("#CheckInfo p").forEach((p)=>{
		p.style.display = "inline";
	});
	document.querySelector("#checkCinema span").innerText =  target.innerText;
};
</script>
</body>
</html>