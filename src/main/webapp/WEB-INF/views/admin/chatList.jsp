<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="채팅관리" name="title"/>
</jsp:include>
<style>
tr[data-chatroom-id] { cursor: pointer; }
</style>
<table class="table text-center">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">회원아이디</th>
      <th scope="col">메세지</th>
      <th scope="col">안읽은 메세지수</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="chatLog">
  		<tr data-chatroom-id="${chatLog.chatroomId}">
  			<td class="chatroomId">${chatLog.chatroomId}</td>
  			<td class="memberId">${chatLog.memberId}</td>
  			<td class="msg">${chatLog.msg}</td>
  			<td class="unreadCount">
  				<span class="badge badge-danger ${chatLog.unreadCount eq 0 ? 'd-none' : ''}">${chatLog.unreadCount}</span>
  			</td>
  		</tr>
  	</c:forEach>
  </tbody>
</table>
<script>
document.querySelectorAll("tr[data-chatroom-id]").forEach((tr) => {
	tr.addEventListener('click', (e) => {
		console.log(e.target);
		let parentTr = e.target;
		while(parentTr.tagName !== 'TR')
			parentTr = parentTr.parentElement;
		
		console.log(parentTr);
		
		const chatroomId = parentTr.dataset.chatroomId;
		
		const url = `${pageContext.request.contextPath}/admin/chat.do?chatroomId=\${chatroomId}`;
		const name = chatroomId; // popup의 window이름. 브라우져가 탭,팝업윈도우를 관리하는 이름
		const spec = "width=500px, height=500px";
		open(url, name, spec);
		
	});
});

setTimeout(() => {

	/**
	 * 각 채팅방의 메세지가 목록에도 전달되어 최근메세지를 확인할 수 있도록 한다.
	 */
	stompClient.subscribe('/app/admin/chatList', (message) => {
		console.log('/app/admin/chatList : ', message);
		
		const {chatroomId, memberId, msg, time, type} = JSON.parse(message.body);
		
		let tr = document.querySelector(`tr[data-chatroom-id="\${chatroomId}"]`);
		
		switch(type){
		case "LAST_CHECK" : 
			const span = tr.querySelector(".unreadCount span");
			span.innerHTML = 0;
			span.classList.add("d-none");
			break;
		case "CHAT" : 
			// 기존채팅방의 메세지인 경우
			if(tr){
				tr.querySelector(".msg").innerHTML = msg;
				
				// 일반회원의 메세지인 경우만 unreadCount 증가
				if(memberId !== 'admin'){					
					const span = tr.querySelector(".unreadCount span");
					span.classList.remove("d-none");
					let unreadCount = Number(span.innerHTML);
					span.innerHTML = unreadCount + 1;
				}
			}
			// 신규채팅방의 메세지인 경우
			else {
				/*
					<tr data-chatroom-id="">
			  			<td class="chatroomId"></td>
			  			<td class="memberId"></td>
			  			<td class="msg"></td>
			  			<td class="unreadCount"></td>
			  		</tr>
	  			*/
				tr = document.createElement("tr");
	  			tr.dataset.chatroomId = chatroomId;
	  			
	  			const td1 = document.createElement("td");
	  			td1.classList.add("chatroomId");
	  			td1.innerHTML = chatroomId;
	  			const td2 = document.createElement("td");
	  			td2.classList.add("memberId");
	  			td2.innerHTML = memberId;
	  			const td3 = document.createElement("td");
	  			td3.classList.add("msg");
	  			td3.innerHTML = msg;
	  			const td4 = document.createElement("td");
	  			td4.classList.add("unreadCount");
	  			td4.innerHTML = "<span class='badge badge-count'>1</span>";
	  			
	  			tr.append(td1, td2, td3, td4);
				
			}
			
			const tbody = document.querySelector("table tbody");
			tbody.insertAdjacentElement('afterbegin', tr);
			
			break;
		} // end of switch
		
	});
	
}, 500);



</script>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>