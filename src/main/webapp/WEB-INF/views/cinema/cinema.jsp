<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="극장|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/cinema.css" />
<section id="cinemaSection">
	<div id="cinemaBox">
		<div id="location">
			<div id="locationBox">
				<c:forEach items="${ locationList }" var="location">
					<div class="locationName">${ location.locationName.krName }</div>
				</c:forEach>
			</div>
			<div id="cinemaList">
				<ul>
					<c:forEach items="${ cinemaList }" var="cinema">
						<li class="cinemaName" data-location="${ cinema.locationName.krName }">${ cinema.name }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<h2 id="cinemaTitle"></h2>
		<div id="cinemaImg">
			<div id="cinemaInfo">
				<p id="cinemaAddr">
				<div id="test">
					<p>임시관 임시석</p>
					<c:forEach items="${ noticeList }" var="notice">
						<div class="notice">
							<div class="title">${ notice.title }</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>
</section>
<script>
	window.onload = () => {
		selectLocation("서울");
		selectCinema("서울", "강남점");
	}

	// 지역선택 메서드
	document.querySelectorAll(".locationName").forEach((locationName) => {
		locationName.addEventListener("click", () => {
			selectLocation(locationName.innerText);
		});
	});

	// 영화관 선택 메서드
	document.querySelectorAll(".cinemaName").forEach((cinemaName) => {
		cinemaName.addEventListener("click", () => {
			selectCinema(cinemaName.dataset.location, cinemaName.innerText);
		});
	});

	// 지역선택 효과 메서드
	const selectLocation = (location) => {

		document.querySelectorAll(".locationName").forEach((locationName) => {
			if (locationName.innerText == location) {
				locationName.className += " selected";
			}
			else {
				locationName.className = "locationName";
			}
		});

		document.querySelectorAll(".cinemaName").forEach((cinemaName) => {

			if (cinemaName.dataset.location == location) {
				cinemaName.style.display = "list-item";
			}
			else {
				cinemaName.style.display = "none";
			}

		});
	};

	// 영화관 선택 효과 메서드
	const selectCinema = (location, name) => {

		document.querySelectorAll(".cinemaName").forEach((cinemaName) => {

			if (cinemaName.innerText == name) {
				cinemaName.className += " selected";
			}
			else {
				cinemaName.className = "cinemaName";
			}
		});


		$.ajax({
			url: "${pageContext.request.contextPath}/cinema/selectOneCinema.do",
			data: { name },
			success(data) {
				const { name, locationName, address } = data;
				document.querySelector("#cinemaTitle").innerText = name;
				document.querySelector("#cinemaImg").style.backgroundImage = "url('../resources/images/" + name + ".jpeg')";

				const noticeElem = document.createElement("span");
				noticeElem.innerText = "공지사항";
				noticeElem.style.float = "right";

				const cinemaAddrElem = document.querySelector("#cinemaAddr");
				cinemaAddrElem.innerText = address;
				cinemaAddrElem.appendChild(noticeElem);
			},
			error: console.log
		});
	};



	const titleElement = document.querySelector('.title');


	titleElement.addEventListener('click', () => {

		window.location.href = '${pageContext.request.contextPath}/notice/noticeDetail.do?no=85';
	});
</script>
</body>
</html>