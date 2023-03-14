<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Websocket" name="title"/>
</jsp:include>
<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="data"></ul>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
/*
 * WebSocket 
 * 
 * Sock.js
 * - websocket을 지원하지 않는 브라우져에서도 양방향 통신을 지원할수 있도록 함. 
 * - WebSocket객체 대신 polling등의 대체방식을 사용하도록 처리
 * - 클라이언트측에는 sock.js 추가
 * - 서버측에도 sockjs 설정 필수
 * - http프로토콜로 최초접근후 ws통신 가능할때 ws로 프로토콜 업그레이드
 */
// const ws = new WebSocket(`ws://\${location.host}${pageContext.request.contextPath}/echo`); // /echo 서버측 엔드포인트
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/echo`); // /echo 서버측 엔드포인트
ws.onopen = (e) => {
	console.log('open : ', e);
};
ws.onmessage = (e) => {
	console.log('message : ', e);
	const {data : payload} = e;
	document.querySelector("#data").innerHTML += `<li class='list-group-item'>\${payload}</li>`;
};
ws.onerror = (e) => {
	console.log('error : ', e);
};
ws.onclose = (e) => {
	console.log('close : ', e);
};

/**
 * 메세지 전송
 */
document.querySelector("#sendBtn").addEventListener('click', (e) => {
	const message = document.querySelector("#message");
	if(!message.value) return;
	
	ws.send(message.value);
	
	message.value = "";
	message.focus();
});


</script>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>
