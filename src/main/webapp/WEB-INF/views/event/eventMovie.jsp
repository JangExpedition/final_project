<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="이벤트|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/eventMovie.css" />


<div id="contents">
    <div class="tit-heading-wrap tit-evt">
        <h3>EVENT</h3>
    </div>

    <div class="evt-nav-area">
        <ul class="evt-tab-menu">
            <li><a href="${ pageContext.request.contextPath }/event/eventSpecial.do" title="" class="">SPECIAL</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventMovie.do" title="" class="on">영화/예매</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventMembership.do" title="" class="">멤버십/CLUB</a></li>
            <li><a href="${ pageContext.request.contextPath }/event/eventSale.do" title="" class="">제휴/할인</a></li>
        </ul>
    </div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div class="parent">
								<a href="#" id="btn-add">글쓰기</a>
							</div>
			</sec:authorize>
</div>


<div class="cols-content">
    <div class="col-detail event">
        <ul class="sect-evt-item-list">
            	<li><a id="tile_0" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36805/16798782654030.jpg"
                            alt="[미니게임천국] ★리바운드★ 농놀퐁"></div>
                    <div class="evt-desc">
                        <p class="txt1">[미니게임천국] ★리바운드★ 농놀퐁</p>
                        <p class="txt2">2023.03.27~2023.04.03<span> . </span><em>D-5</em></p>
                    </div>
                </a></li>

            <li><a id="tile_1" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36806/16798850500720.jpg"
                            alt="[던전앤드래곤] IMAX 포스터"></div>
                    <div class="evt-desc">
                        <p class="txt1">[던전앤드래곤] IMAX 포스터</p>
                        <p class="txt2">2023.03.24~2023.04.11</p>
                    </div>
                </a></li>

            <li><a id="tile_2" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36785/16796214180900.jpg"
                            alt="[던전 앤 드래곤: 도적들의 명예] 4DX 포스터"></div>
                    <div class="evt-desc">
                        <p class="txt1">[던전 앤 드래곤: 도적들의 명예] 4DX 포스터</p>
                        <p class="txt2">2023.03.24~2023.04.11</p>
                    </div>
                </a></li>

            <li><a id="tile_3" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36709/16787831324010.jpg"
                            alt="[모나리자와 블러드문]필름마크"></div>
                    <div class="evt-desc">
                        <p class="txt1">[모나리자와 블러드문] 필름마크</p>
                        <p class="txt2">2023.03.15~2023.03.31<span> . </span><em>D-2</em></p>
                    </div>
                </a></li>

            <li><a id="tile_4" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36787/16796216130140.jpg"
                            alt="[던전 앤 드래곤: 도적들의 명예] SX 포스터"></div>
                    <div class="evt-desc">
                        <p class="txt1">[던전 앤 드래곤:도적들의 명예] SX 포스터</p>
                        <p class="txt2">2023.03.24~2023.04.11</p>
                    </div>
                </a></li>

            <li><a id="tile_5" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36748/16793001671680.jpg"
                            alt="[스즈메의 문단속] 4DX 특별 포스터"></div>
                    <div class="evt-desc">
                        <p class="txt1">[스즈메의 문단속] 4DX 특별 포스터</p>
                        <p class="txt2">2023.03.20~2023.03.31<span> . </span><em>D-2</em></p>
                    </div>
                </a></li>

            <li><a id="tile_6" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36649/16782560914720.jpg"
                            alt="[샤잠! 신들의 분노] 필름마크"></div>
                    <div class="evt-desc">
                        <p class="txt1">[샤잠! 신들의 분노]
                            필름마크</p>
                        <p class="txt2">2023.03.08~2023.03.29<span> . </span><em>종료임박</em></p>
                    </div>
                </a></li>

            <li><a id="tile_7" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36822/16799808061380.jpg"
                            alt="<스즈메의 문단속> CGV 단독 신규 굿즈 출시!"></div>
                    <div class="evt-desc">
                        <p class="txt1">&lt;스즈메의 문단속&gt;
                            CGV 단독 신규 굿즈 출시!</p>
                        <p class="txt2">2023.03.28~2023.04.27</p>
                    </div>
                </a></li>

            <li><a id="tile_8" href="">
                    <div class="evt-thumb"><img
                            src="https://img.cgv.co.kr/WebApp/contents/eventV4/36823/16799890693780.jpg"
                            alt="2023 LCK SPRING 결승"></div>
                    <div class="evt-desc">
                        <p class="txt1"></p>
                        <p class="txt2"></p>
                    </div>
                </a></li>
        </ul>
    </div>
</div>

<script>
document.querySelector("#btn-add").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/event/eventForm.do';
});

</script>
</body>
</html>