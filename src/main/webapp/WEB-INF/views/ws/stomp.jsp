<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Stomp" name="title"/>
</jsp:include>
<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message...">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="data"></ul>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
/**
 * Stomp
 * - websocket 베이스로 작동하는 Message Broker 
 * - client에 stomp.js 추가
 * - server측에서 stomp 설정
 * - 접속세션관리가 아닌 publisher/subscriber패턴으로 세션관리
 */
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
const stompClient = Stomp.over(ws);

/**
 * 연결 성공시 호출!
 */
stompClient.connect({}, (frame) => {
	console.log("연결 성공!", frame);
	
	// url 구독신청
	stompClient.subscribe('/topic/a', (message) => {
		// /topic/a 메세지를 받았을때 처리 핸들러
		console.log('/topic/a : ', message);
		
		// #data에 li태그로 추가
		const {body} = message;
		const payload = JSON.parse(body);
		console.log(payload);
		
		const {from, msg, time, type} = payload;
		const container = document.querySelector("#data");
		container.innerHTML += `
			<li class="list-group-item" title="\${new Date(time)}">
				\${from} : \${msg}
			</li>
		`;
		
		
	});
	
	/**
	 * MessageMappingHandler 요청주소 그대로 구독하기
	 */
	stompClient.subscribe('/app/b', (message) => {
		// /app/b 메세지를 받았을때 처리 핸들러
		console.log('/app/b : ', message);
	});

});

document.querySelector("#sendBtn").addEventListener("click", (e) => {
	const message = document.querySelector("#message");
	if(!message.value) return;
	
	const username = "<sec:authorize access='isAuthenticated()'><sec:authentication property='principal.username'/></sec:authorize>"; 
	const payload = {
		from : username ? username : '익명',
		msg : message.value,
		time : Date.now(),
		type : "MESSAGE"
	};
	
	// stompClient.send("/topic/a", {}, JSON.stringify(payload)); // SimpleBroker 처리
	// stompClient.send("/app/a", {}, JSON.stringify(payload)); // MessageMappingHandler가 선처리후 SimpleBroker 처리
	stompClient.send("/app/b", {}, JSON.stringify(payload)); // MessageMappingHandler가 선처리후 SimpleBroker 처리
	
	message.value = "";
	message.focus();
});
 

 
</script>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
