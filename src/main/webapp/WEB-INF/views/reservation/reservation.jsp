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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/reservation.css"/>
<sec:authentication property="principal" var="loginMember"/>
<!-- 예매 섹션 -->
<section class="reservation-section">
	<!-- 예매 초기화 -->
	<div class="reset-wrapper">
		<div class="reset-box">
			<button id="resetBtn" type="button"><i class="fa-solid fa-rotate-right"></i> 예매 다시하기</button>
		</div>
	</div>
	<!-- 예매 구간1 -->
	<div class="steps steps1">
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
			<div id="scheduleList" class="table-body">
			
			</div>
		</div>
	</div>
	<!-- 예매 구간1 -->
	<!-- 예매 구간2 -->
	<div class="steps steps2">
		<div class="table-head">인원/좌석</div>
		<div class="personnelAndSeat">
			<div id="personnel">
				<p id="limitPeopleCnt">* 최대 8명 선택 가능</p>
				<div><div>일반 </div><input class="numberOfPeople" type="number" min="0"/></div>
				<div><div>청소년 </div><input class="numberOfPeople" type="number" min="0"/></div>
				<div><div>경로 </div><input class="numberOfPeople" type="number" min="0"/></div>
			</div>
			<div id="reChecked">
				<div>
					<span id="reCheckedCinema"></span>
					<span id="reCheckedTheater"></span>
					<span></span>
				</div>
				<div>
					<h3 id="reCheckedSchedule"></h3>
				</div>
			</div>
		</div>
		<div class="selectSeat">
			<div id="screen">SCREEN</div>
			<div>
				<div id="seatList">
				
				</div>
			</div>
		</div>
	</div>
	<!-- 예매 구간2 -->
	<!-- 결제 구간 -->
	<div class="steps steps3">
		<div class="table-head">결제내용</div>
		<div id="finalStep">
			<p id="finalCheckCinema" class="finalCheck"></p>
			<p id="finalCheckSchedule" class="finalCheck"></p>
			<p id="finalCheckMovie" class="finalCheck"></p>
			<p id="finalCheckPeople" class="finalCheck"></p>
			<h3 id="finalAmount"></h3>
		</div>
		<div>
			<div id="payBtn"></div>
		</div>
	</div>
	<!-- 결제 구간 -->
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
			<p id="checkSchedule">일시 <span></span></p>			
			<p id="checkTheater">상영관 <span></span></p>			
			<p id="checkPeople">인원 <span></span></p>			
		</div>
		<div id="seatCheck" class="check3">
			<h3>좌석선택</h3>
			<p id="checkSeatNumber">좌석번호 <span></span></p>
		</div>
		<div id="paymentCheck" class="check4">
			<h3>결제</h3>
			<div id="paymentList"></div>
			<p id="checkTotalPayment">총금액 <span></span></p>
		</div>
		<div class="check nextStep">
			<div id="selectSeatBtn" class="nextStepBtn">
				<h3>></h3>
				<p>좌석선택</p>
			</div>
			<div id="selectPaymentBtn" class="nextStepBtn">
				<h3>></h3>
				<p>결제선택</p>
			</div>
		</div>
	</div>
</section>
<!-- 예매확인 섹션 -->
<script>
let isSelected1 = false;
let isSelected2 = false;
let isSelected3 = false;


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
		const monthStr = ("0" + month).slice(-2);
		if(!months.includes(monthStr))
			months.push(monthStr);
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
						<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[0]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else {
					dayList.innerHTML += `
						<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[0]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
						<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[0]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
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
						<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[0]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else if(date[i] > date[i-1]){
					dayList.innerHTML += `
						<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[0]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
					`;
				}
				else{
					dayList.innerHTML += `
							<h1 class="reservationMonth">\${ months[1] }</h1>
							<p class="reservationDay" data-reservationDay="\${years[0]}-\${months[1]}-\${date[i]}(\${ weekday[i] })"><span class="reservationWeekday">\${ weekday[i] }</span><span class="reservationDate">\${ date[i] }</span></p>
						</div>
						`;
				}
			};
		}
		
	}
	// 년도가 2개이면서 월이 2개인 경우
	else{
		// 귀찮.. 나중에
	}
	
	// 토요일, 일요일 색상 변경
	document.querySelectorAll(".reservationDay").forEach((reservationDay)=>{
		if(reservationDay.firstChild.innerText === "토")
			reservationDay.style.color = "#31597e";
		if(reservationDay.firstChild.innerText === "일")
			reservationDay.style.color = "#ad2727";
	});
}

// 리셋 버튼 메서드
document.querySelector("#resetBtn").addEventListener("click", (e)=>{
	location.href = "${pageContext.request.contextPath}/reservation/reservation.do";
});

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
						
						const {title, limitAge, attachments, no, startTime, endTime} = movie;
						
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
	
	isSelected1 = true;
	
	if(isSelected1 && isSelected2 && isSelected3){
		getSchedule();
	}
	
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
	
	isSelected2 = true;
	
	if(isSelected1 && isSelected2 && isSelected3){
		getSchedule();
	}
	
};

// 날짜 선택 메서드
$(document).on("click", ".reservationDay", function(e){
	let parentP = e.target;
	while(parentP.tagName !== 'P')
		parentP = parentP.parentElement;
	
	selectReservationDay(parentP)
});

// 날짜 선택 효과 메서드
const selectReservationDay = (reservationDay) =>{
	
	document.querySelectorAll(".reservationDay").forEach((rd)=>{
		
		if(rd.dataset.reservationday === reservationDay.dataset.reservationday){
			rd.className = "reservationDay selectedDay";
		}
		else{
			rd.className = "reservationDay";
		}
	});
	
	document.querySelector("#CheckInfo h3").style.display = "none";
	document.querySelectorAll("#CheckInfo p").forEach((p)=>{
		p.style.display = "inline";
	});
	document.querySelector("#checkSchedule > span").innerText = reservationDay.dataset.reservationday; 
	
	isSelected3 = true;
	
	if(isSelected1 && isSelected2 && isSelected3){
		getSchedule();
	}
	
};

// 상영스케쥴 가져오기 메서드
const getSchedule = () => {

	const movieNo = document.querySelector(".movieTitleSelected").dataset.movieNo;
	const cinemaName = document.querySelector(".selectedCinema").innerText;
	const reservationDay = document.querySelector(".selectedDay").dataset.reservationday.slice(0,10);

	$.ajax({
		url: "${pageContext.request.contextPath}/reservation/selectTheaterList.do",
		data: {cinemaName},
		success(theaterList){
			
			const sche = document.querySelector("#scheduleList");
			
			scheduleList.innerHTML = "";
			
			theaterList.forEach((theater)=>{
				
				$.ajax({
					url: "${pageContext.request.contextPath}/reservation/selectScheduleList.do",
					data: {movieNo, theaterNo : theater.no, reservationDay},
					success(scheduleList){
						
						if(scheduleList.length > 0){
							
							const div = document.createElement("div");
							div.className = "oneTheater";
							const p = document.createElement("p");
							p.className = "theaterName";
							p.innerText = theater.theaterNo + "관";
							const scheduleListDiv = document.createElement("div");
							scheduleListDiv.className = "scheduleList";
							div.append(p);
							div.append(scheduleListDiv);
							sche.append(div);
						
							scheduleList.forEach((schedule)=>{
								const {no, startTime, endTime} = schedule;
								const scheduleDiv = document.createElement("div");
								scheduleDiv.innerText = startTime.substr(11);
								
								let nowTime = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(11, 16);
								
								scheduleDiv.dataset.endTime = endTime.substr(11);
								scheduleDiv.dataset.theaterNo = theater.theaterNo;
								scheduleDiv.dataset.scheduleNo = no;
								
								if(scheduleDiv.innerText < nowTime){
									scheduleDiv.className = "schduleEnd";
								}
								else{
									scheduleDiv.className = "scheduleTime";
								}
								
								scheduleListDiv.append(scheduleDiv);
							}); // scheduleList forEach end
						} // if end
					}, // second ajax success end
					error: console.log
				}); // second ajax end
			}); // theaterList forEach end
		}, // first ajax success end
		error: console.log
	}); // first ajax end
}; // 상영스케쥴 가져오기 메서드 end

// 상영 스케쥴 선택 메서드
$(document).on("click", ".scheduleTime", function(e){
	selectSchedule(e.target);
});

// 상영 스케쥴 선택 효과 메서드
const selectSchedule = (schedule) => {
	
	document.querySelectorAll(".scheduleTime").forEach((scheduleTime)=>{
		if(scheduleTime.dataset.theaterNo === schedule.dataset.theaterNo && scheduleTime.innerText === schedule.innerText){
			scheduleTime.classList.add("scheduleSelected");
		}
		else{
			if(scheduleTime.classList.contains("scheduleSelected"))
				scheduleTime.classList.remove("scheduleSelected");
		}
	});
	
	const scheduleData = document.querySelector("#checkSchedule span");
	const scheduleDate = scheduleData.innerText.slice(0, 13);
	const title = document.querySelector("#reservationMovieTitle");
	scheduleData.innerText = scheduleDate + " " + schedule.innerText;
	title.dataset.endTime = schedule.dataset.endTime;
	document.querySelector("#checkTheater span").innerText = schedule.dataset.theaterNo + "관";
	document.querySelector("#checkSchedule span").dataset.scheduleNo = schedule.dataset.scheduleNo;
	document.querySelector("#selectSeatBtn").style.display = "flex";
}; // 상영 스케쥴 선택 효과 메서드 end

// 좌석선택 버튼 클릭 메서드
document.querySelector("#selectSeatBtn").addEventListener("click", (e)=>{
	// 다음 페이지 넘기기
	document.querySelector(".steps1").style.display = "none";
	document.querySelector(".steps2").style.display = "flex";
	
	// 예약내역 재확인 정보 입력
	document.querySelector("#reCheckedCinema").innerText = document.querySelector("#checkCinema span").innerText;
	document.querySelector("#reCheckedTheater").innerText = document.querySelector("#checkTheater span").innerText; 
	document.querySelector("#reCheckedSchedule").innerText = document.querySelector("#checkSchedule span").innerText
															+ " ~ " 
															+ document.querySelector("#reservationMovieTitle").dataset.endTime;
	
	// 상영관 예약된 좌석 정보 가져오기
	const scheduleNo = document.querySelector("#checkSchedule span").dataset.scheduleNo;
	$.ajax({
		url: "${pageContext.request.contextPath}/reservation/selectAllSeat.do",
		data: {scheduleNo},
		success(notAllowSeatList){
			
			const notAllowSeatNo = [];
			
			for(let i = 0; i < notAllowSeatList.length; i++){
				notAllowSeatNo[i] = notAllowSeatList[i].seatNo;
			}
		
			const seatList = document.querySelector("#seatList");
			
			for(let i = 65; i <= 77; i++){
				const row = document.createElement("div");
				row.className = "row";
				const rowName = document.createElement("div");
				rowName.className = "rowName";
				rowName.innerText = String.fromCharCode(i);
				row.append(rowName);
				
				for(let j = 1; j <= 15; j++){
					
					const seat = document.createElement("div");
					seat.className = "seat";
					seat.dataset.seatNo = String.fromCharCode(i) + j;
					seat.innerText = j;
					
					// 이미 예약된 좌석인 경우
					if(notAllowSeatNo.includes(seat.dataset.seatNo))
						seat.className = "notAllow";
					
					row.append(seat);
					
				} // second for end
				
				seatList.append(row);
				
			} // first for end
		},
		error: console.log
	}); // ajax end
	
	document.querySelector("#selectSeatBtn").style.display = "none";
	
}); // 좌석선택 버튼 클릭 메서드 end

// 인원 수 선택 메서드
document.querySelectorAll(".numberOfPeople").forEach((numberOfPeople)=>{
	numberOfPeople.addEventListener("change", (e)=>{
		
		// 인원수 제한 점검
		cntPeople(e.target);
		
		// 예약정보 확인에 넣기
		checkPeople();
		
		// 결제창 넘어가기 버튼 활성화 메서드
		selectPaymentBtnActivation();
		
	});
});

// 인원수 제한 메서드
const cntPeople = (target) => {
	let cntPeople = 0;
	
	document.querySelectorAll(".numberOfPeople").forEach((np)=>{
		cntPeople += Number(np.value);
	});
	
	if(cntPeople > 8){
		alert("최대 8명까지만 가능합니다.");
		target.value -= 1;
	}
};

// 인원 예약정보 확인 메서드
const checkPeople = () => {
	
	const checkPeople = document.querySelector("#checkPeople span");
	
	checkPeople.innerText = "";
	
	document.querySelectorAll(".numberOfPeople").forEach((np)=>{
		
		let general = "";
		let teenager = "";
		let oldman = "";
		
		if(np.value > 0){
			
			switch(np.previousSibling.innerText){
			case "일반" : general = "일반 " + np.value + "명 "; break;
			case "청소년" : teenager = "청소년 " + np.value + "명 "; break;
			case "경로" : oldman = "경로 " + np.value + "명 "; break;
			};
		}
		
		if(general != ""){
			checkPeople.innerText += checkPeople.innerText.length > 0 ? ", " + general : general;
		}
		else if(teenager != ""){
			checkPeople.innerText += checkPeople.innerText.length > 0 ? ", " + teenager : teenager;
		}
		else if(oldman != ""){
			checkPeople.innerText += checkPeople.innerText.length > 0 ? ", " + oldman : oldman;
		}
	}); // forEach end
}; // 인원 예약정보 확인 메서드 end

// 좌석 선택 메서드
$(document).on("click", ".seat", function(e){
	selectSeat(e.target);
});

// 좌석 선택 효과 메서드
const selectSeat = (seat) => {
	
	let cntPeople = 0;
	
	document.querySelectorAll(".numberOfPeople").forEach((np)=>{
		cntPeople += Number(np.value);
	});
	
	if(cntPeople === 0){
		alert("먼저 인원수 설정을 해주세요.");
		return;
	}
	
	// 선택 좌석 취소
	if(seat.classList.contains("seatSelected"))
		seat.classList.remove("seatSelected");
	else
		seat.classList.add("seatSelected");
	
	let seatSelectedCnt = 0;
	
	document.querySelectorAll(".seatSelected").forEach((seatSelected)=>{
		seatSelectedCnt++;
	});
	
	if(cntPeople < seatSelectedCnt){
		alert("설정한 인원 수보다 많습니다.");
		seat.classList.remove("seatSelected");
		return;
	}
	
	const checkSeatNumber = document.querySelector("#checkSeatNumber span");
	checkSeatNumber.innerText = "";
	document.querySelector("#seatCheck h3").style.display = "none";
	document.querySelector("#checkSeatNumber").style.display = "inline-block";
	document.querySelectorAll(".seatSelected").forEach((seatSelected)=>{
		checkSeatNumber.innerText += checkSeatNumber.innerText.length > 0 ? ", " + seatSelected.dataset.seatNo : seatSelected.dataset.seatNo;
	});
	
	// 결제금액 계산 및 효과 메서드
	totalPayment();
	
	// 결제창 넘어가기 버튼 활성화 메서드
	selectPaymentBtnActivation();
	
}; // 좌석 선택 효과 메서드 end

// 총결제 금액 계산 및 효과 메서드
const totalPayment = () => {
	
	document.querySelector("#paymentCheck h3").style.display = "none";
	const checkTotalPayment = document.querySelector("#checkTotalPayment");
	checkTotalPayment.style.display = "inline-block";
	
	let totalPayment = 0;
	
	let generalCnt = 0;
	let teenagerCnt = 0;
	let oldmanCnt = 0;
		
	document.querySelectorAll(".numberOfPeople").forEach((np)=>{
			
			if(np.value > 0){
				switch(np.previousSibling.innerText){
				case "일반" : generalCnt = np.value; break;
				case "청소년" : teenagerCnt = np.value; break;
				case "경로" : oldmanCnt = np.value; break;
				};
			}
	});
	
	let selectCnt = 0;
	document.querySelectorAll(".seatSelected").forEach((seatSelected)=>{
		selectCnt++;
	});
	
	const paymentList = document.querySelector("#paymentList");
	paymentList.innerText = "";
		
	if(generalCnt > 0){
		const generalP = document.createElement("p");
		generalP.innerText = "일반 ";
		const generalSpan = document.createElement("span");
		generalSpan.innerText = "14,000원 X " + generalCnt;
		generalP.append(generalSpan);
		paymentList.append(generalP);
		totalPayment += 14000 * generalCnt;
	}
	if(teenagerCnt > 0){
		const teenagerP = document.createElement("p");
		teenagerP.innerText = "청소년 ";
		const teenagerSpan = document.createElement("span");
		teenagerSpan.innerText = "11,000원 X " + teenagerCnt;
		teenagerP.append(teenagerSpan);
		paymentList.append(teenagerP);
		totalPayment += 11000 * teenagerCnt;
	}
	if(oldmanCnt > 0){
		const oldmanP = document.createElement("p");
		oldmanP.innerText = "경로 ";
		const oldmanSpan = document.createElement("span");
		oldmanSpan.innerText = "7,000원 X " + oldmanCnt;
		oldmanP.append(oldmanSpan);
		paymentList.append(oldmanP);
		totalPayment += 7000 * oldmanCnt;
	}
	
	document.querySelector("#checkTotalPayment span").innerText = totalPayment.toLocaleString() + "원";
	
}; // 총결제 금액 계산 및 효과 메서드 end

// 결제창 넘어가기 버튼 활성화 메서드
const selectPaymentBtnActivation = () => {
	
	const selectPaymentBtn = document.querySelector("#selectPaymentBtn");
	
	let numberOfPeopleCnt = 0;

	document.querySelectorAll(".numberOfPeople").forEach((np)=>{
		numberOfPeopleCnt += Number(np.value);
	});
	
	let selectSeatCnt = 0;
	
	document.querySelectorAll(".seatSelected").forEach((seatSelected)=>{
		selectSeatCnt++;
	});
	
	if(numberOfPeopleCnt !== 0 && numberOfPeopleCnt === selectSeatCnt)
		selectPaymentBtn.style.display = "flex";
	else if(numberOfPeopleCnt !== selectSeatCnt)
		selectPaymentBtn.style.display = "none";
	
}; // 결제창 넘어가기 버튼 활성화 메서드 end

// 결제선택 버튼 클릭 메서드
document.querySelector("#selectPaymentBtn").addEventListener("click", (e)=>{
	document.querySelector(".steps2").style.display = "none";
	document.querySelector(".steps3").style.display = "flex";
	document.querySelector("#selectPaymentBtn").style.display = "none";
	document.querySelector("#finalCheckCinema").innerText = document.querySelector("#checkCinema span").innerText + document.querySelector("#checkTheater span").innerText;
	document.querySelector("#finalCheckSchedule").innerText = document.querySelector("#checkSchedule span").innerText;
	document.querySelector("#finalCheckMovie").innerHTML = document.querySelector("#reservationMovieTitle").innerHTML;
	document.querySelector("#finalCheckPeople").innerText = document.querySelector("#checkPeople span").innerText;
	document.querySelector("#finalAmount").innerText = document.querySelector("#checkTotalPayment span").innerText.toLocaleString();
});

// 결제 메서드
document.querySelector("#payBtn").addEventListener("click", (e)=>{
	
	const payMethod = $(":input:radio[class=payRadio]:checked").val();
	const totalPayAmount = document.querySelector("#checkTotalPayment span").innerText;
	const productName = document.querySelector("#reservationMovieTitle").innerText + " X " 
						+ document.querySelector("#checkPeople span").innerText
						+ "(" + document.querySelector("#checkSeatNumber span").innerText + ")";
	
	const scheduleNo = document.querySelector("#checkSchedule span").dataset.scheduleNo;
	const seatArr = document.querySelector("#checkSeatNumber span").innerText.split(', ');
	const id = "${loginMember.id}";
	
	IMP.init("imp28385606");
	
	IMP.request_pay({
	    pg : payMethod,
	    pay_method : 'card',
	    merchant_uid: scheduleNo + document.querySelector("#checkSeatNumber span").innerText,
	    name : productName,
	    amount : totalPayAmount,
	    buyer_email : '${loginMember.email}',
	    buyer_name : '${loginMember.id}',
	    buyer_tel : '${loginMember.phone}'
	}, function(rsp) { 

		const csrfHeader = "${_csrf.headerName}";
    	const csrfToken = "${_csrf.token}";
    	const headers = {};
    	headers[csrfHeader] = csrfToken;
    	
		if(rsp.success) {
			
			console.log(rsp);
			
	    	$.ajax({
	    		url: "${pageContext.request.contextPath}/reservation/reservationComplete.do",
	    		type: 'POST',
	    		traditional: true,
	    		dataType: 'json',
	    		data: {scheduleNo, seatArr, id},
	    		headers,
	    		success(data) {
	    		    console.log(data);
	    		    let msg = data.msg;
	    			
	    			alert(msg);
	    			
	    			location.href = "${pageContext.request.contextPath}";
	    		}
	    	});
	    } 
		else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	}); // 카카오페이 결제 end
  
}); // 결제 메서드 end
</script>
<c:if test="${not empty movieNo}">
	<script>
		document.querySelectorAll(".movieTitle").forEach((movieTitle)=>{
			console.log(movieTitle.dataset.movieNo);
			if(movieTitle.dataset.movieNo == ${movieNo}){
				console.log("asdfodsjof");
			}
		});
	</script>
</c:if>
</body>
</html>