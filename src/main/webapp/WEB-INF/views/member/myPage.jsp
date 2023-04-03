<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="MY J3L PAGE<My J3L|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage.css"/>
<sec:authentication property="principal" var="loginMember"/>
<section id="myPageSection">
	<div id="memberDataWrapper">
		<div id="myData">
			<div id="profileImg">
				<img src="${ pageContext.request.contextPath }/resources/images/${ loginMember.grade }.png">
			</div>
			<div id="personData">
				<div id="idName">
					<h2>${ loginMember.name }님</h2>
					${ loginMember.id }
				</div>
				<div id="grade">
					<p id="checkGradeBenefit" class="pointColor">멤버십 등급별 혜택 확인하기</p>
					<h5>고객님은 ${ loginMember.grade }입니다.</h5>
					<p>현재 보유하신 포인트는 <span class="pointColor">${ loginMember.point }point</span> 입니다.</p>
					<input id="myReservationCheck" type="button" value="예매내역 확인하기"/>
				</div>
			</div>
		</div>
		
		<div id="memberUpdateWrapper">
			<div id="certifiedBox">
				<h4>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h4>
				<p>회원님의 개인정보 보호를 위한 본인 확인 절차이오니, J3L 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
				<br/>
				<div id="" class="step">
					<input id="password" name="password" type="password" placeholder="비밀번호를 입력해주세요."/>
					<p id="passwordErr" class="err"></p>
					<input id="authenticationPwdBtn" value="비밀번호 입력" type="button" class="BtnStyle"/>
				</div>
			</div>
			<div id="userData">
				<h3>기본정보</h3>
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">이름</th>
							<td scope="row">${ loginMember.name }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${ loginMember.id }</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${ loginMember.birth }</td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td>${ loginMember.phone }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="emailVal">${ loginMember.email }<input id="updateEmailBtn" class="updateBtn" type="button" value="변경하기"/></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input id="updatePwdBtn" class="updateBtn" type="button" value="변경하기"/></td>
						</tr>
						<tr>
							<th>회원탈퇴</th>
							<td><input id="deleteMemberBtn" class="updateBtn" type="button" value="회원탈퇴"/></td>
						</tr>
					</tbody>
				</table>
				
				<!-- 이메일 인증 모달창 -->
				<div id="emailModal" class="modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">본인인증</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <img id="emailImg" src="${ pageContext.request.contextPath }/resources/images/email.png"/>
						<div id="step1" class="step">
							<input id="email" name="email" type="email" placeholder="이메일을 입력해주세요."/>
							<p id="emailErr" class="err"></p>
							<input id="authenticationBtn" value="이메일 인증" type="button" class="BtnStyle"/>
						</div>
						<div id="step2" class="step">
							<input id="authenticateCode" type="text" placeholder="인증코드 입력"/>
							<p id="authenticationErr" class="err"></p>
							<input id="authenticationCodeBtn" value="인증 확인" type="button" class="BtnStyle"/>
						</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 이메일 인증 모달창 -->
				
				<!-- 비밀번호 변경 모달 -->
				<div id="passwordUpdateModal" class="modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">본인인증</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <img id="emailImg" src="${ pageContext.request.contextPath }/resources/images/email.png"/>
						<div id="updatePwdWrap" class="step">
							<form:form id="updatePwdFrm" name="updatePwdFrm" method="post" action="${ pageContext.request.contextPath }/member/updatePwd.do">
								<input name="id" value="${ loginMember.id }" type="hidden"/>
								<input id="oldPwd" name="oldPwd" type="password" placeholder="비밀번호를 입력해주세요."/>
								<p id="oldPwdErr" class="err"></p>
								<input id="newPwd" name="password" type="password" placeholder="새로운 비밀번호를 입력해주세요."/>
								<p id="newPwdErr" class="err"></p>
								<input id="newPwdCheck" name="passwordCheck" type="password" placeholder="새로운 비밀번호를 다시 한번 입력해주세요."/>
								<p id="newPwdCheckErr" class="err"></p>
								<input id="updatePwdBtn" value="비밀번호 변경" type="submit" class="BtnStyle"/>
							</form:form>
						</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 비밀번호 변경 모달 -->
				<!-- 회원탈퇴 폼 -->
				<form:form name="deleteMemberFrm" method="post" action="${ pageContext.request.contextPath }/member/withdrawalMember.do">
					<input type="hidden" name="id" value="${ loginMember.id }"/>
				</form:form>
				<script>
				/* 이메일 변경 메서드들 */
				let code = "";
				let newEmail = "";
				
				/* 이메일 변경 모달창 메서드 */
				document.querySelector("#updateEmailBtn").addEventListener("click", (e)=>{
					$("#emailModal").modal("show");
				});
				
				/* 인증코드 발송 메서드 */
				document.querySelector("#authenticationBtn").addEventListener("click", (e)=>{
					
					const nowEmail = document.querySelector("#emailVal").innerText;
					const email = document.querySelector("#email").value;
					const emailErr = document.querySelector("#emailErr");
					
					if(nowEmail === email){
						emailErr.innerHTML = "현재 이메일과 동일합니다.";
				    	return false;
					}
					
					// 이메일 유효성 검사
					if (!/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/.test(email)) {
						emailErr.innerHTML = "유효하지 않는 이메일입니다.";
				    	return false;
				    };
				    
				    $.ajax({
				    	url: "${pageContext.request.contextPath}/member/authentication.do?email=" + email,
				    	success(data){
				    		code = data;
				    		step1.style.display = "none";
				    		step2.style.display = "flex";
				    		newEmail = email;
				    	},
				    	error: console.log
				    });
					
				});

				/* 인증번호 확인 메서드 */
				document.querySelector("#authenticationCodeBtn").addEventListener("click", (e)=>{
					const authenticateCode = document.querySelector("#authenticateCode").value;
					const authenticationErr = document.querySelector("#authenticationErr");
					if(authenticateCode != code){
						authenticationErr.innerHTML = "인증번호가 일치하지 않습니다. 다시 입력해주세요.";
					} else{
						step2.style.display = "none";
						
						// 이메일 변경 메서드
						const id = "<sec:authentication property='principal.username'/>";
						
						const csrfHeader = "${_csrf.headerName}";
				    	const csrfToken = "${_csrf.token}";
				    	const headers = {};
				    	headers[csrfHeader] = csrfToken;
				    	
						$.ajax({
							url: "${pageContext.request.contextPath}/member/updateEmail.do",
							method: "post",
							data: {email : newEmail, id},
							headers,
							success(data){
								const btn = document.querySelector("#updateEmailBtn");
								const emailVal = document.querySelector("#emailVal");
								emailVal.innerText = newEmail;
								emailVal.append(btn);
								$('#emailModal').modal('hide');
								alert("메일을 성공적으로 변경했습니다.");
							},
							error: console.log
						});
					}
				});
				/* 이메일 변경 메서드들 end */
				
				/* 비밀번호 변경 메서드들 */
				document.querySelector("#updatePwdBtn").addEventListener("click", (e)=>{
					$("#passwordUpdateModal").modal("show");
				});
				
				document.updatePwdFrm.addEventListener("submit", (e)=>{
					
					e.preventDefault();
					
					const id = e.target.id.value;					
					const password = e.target.oldPwd.value;
					const newPwd = e.target.password.value;
					const newPwdCheck = e.target.passwordCheck.value;
					const newPwdErr = document.querySelector("#newPwdErr");
					
					const result = certifiedPwd(id, password);
					
					if(result !== "true"){
						document.querySelector("#oldPwdErr").innerHTML = "비밀번호가 일치하지 않습니다.";
						return false;
					}
					
					if(password === newPwd){
				    	newPwdErr.innerHTML = "현재 비밀번호와 동일합니다.";
				        return false;
					}
					
					// 숫자 검사
				    if(!/\d/.test(newPwd)){
				    	newPwdErr.innerHTML = "비밀번호는 하나 이상의 숫자를 반드시 포함해야 합니다.";
				        return false;
				    }
				    
				    // 문자 검사
				    if(!/[a-zㅏ-ㅣㄱ-ㅎ]/i.test(newPwd)){
				    	newPwdErr.innerHTML = "비밀번호는 하나 이상의 문자를 반드시 포함해야 합니다.";
				    	return false;
				    }
				    
				    // 특수문자 검사
				    if(!/[!@#$%^&*()]/.test(newPwd)){
				    	newPwdErr.innerHTML = "비밀번호는 하나 이상의 특수문자를 반드시 포함해야 합니다.";
				    	return false;
				    }
					
					if(!/^[a-zㅏ-ㅣㄱ-ㅎ0-9!@#$%^&*()]{4,}$/i.test(newPwd)){
						newPwdErr.innerHTML = "비밀번호는 영문자/숫자/특수문자로 구성된 4글자이상이어야합니다.";
						return false;
					}
					
					if(newPwd !== newPwdCheck){
						document.querySelector("#newPwdCheckErr").innerHTML = "비밀번호가 일치하지 않습니다.";
						return false;
					}
					
					e.target.submit();
				});
				/* 비밀번호 변경 메서드들 end */
				
				/* 회원탈퇴 메서드 */
				document.querySelector("#deleteMemberBtn").addEventListener("click", (e)=>{
					if(confirm("정말로 탈퇴하시겠습니까?")){
						document.deleteMemberFrm.submit();
					}
				});
				</script> 
			</div>
		</div>
	</div>
	<div id="myReservation">
		<h3>예약내역</h3>
		<p>지난 <span>1개월</span>까지의 예매내역을 확인하실 수 있습니다.</p>
		<table id="myReservationTable" class="myReservationTable">
			<thead>
				<tr>
					<th>상영관</th>
					<th>영화</th>
					<th>장르</th>
					<th>연령제한</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>좌석번호</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
</section>
<div id="gradeCheckBenefitModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">멤버십 등급별 혜택</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="gradeCheckBenefitModalBody" class="modal-body">
      	<table class="gradeBenefitTable">
      		<thead>
      			<tr>
	      			<th>등급</th>
	      			<th>혜택</th>
      			</tr>
      		</thead>
      		<tbody>
      			<tr>
      				<td class="imgTd">
      					<img src="${ pageContext.request.contextPath }/resources/images/FAMILY.png"/>
      				</td>
      				<td rowspan="2">결제금액의 1% 포인트적립</td>
      			</tr>
      			<tr class="borderTr">
      				<td>
      					FAMILY
      				</td>
      			</tr>
      			<tr>
      				<td class="imgTd">
      					<img src="${ pageContext.request.contextPath }/resources/images/SILVER.png"/>
      				</td>
      				<td rowspan="2">결제금액의 3% 포인트적립</td>
      			</tr>
      			<tr class="borderTr">
      				<td>
      					SILVER
      				</td>
      			</tr>
      			<tr>
      				<td class="imgTd">
      					<img src="${ pageContext.request.contextPath }/resources/images/GOLD.png"/>
      				</td>
      				<td rowspan="2">결제금액의 5% 포인트적립</td>
      			</tr>
      			<tr class="borderTr">
      				<td>
      					GOLD
      				</td>
      			</tr>
      			<tr>
      				<td class="imgTd">
      					<img src="${ pageContext.request.contextPath }/resources/images/VIP.png"/>
      				</td>
      				<td rowspan="2">결제금액의 7% 포인트적립</td>
      			</tr>
      			<tr class="borderTr">
      				<td>
      					VIP
      				</td>
      			</tr>
      		</tbody>
      	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
// 비밀번호 인증 메서드
document.querySelector("#authenticationPwdBtn").addEventListener("click", (e)=>{
	
	const id = "<sec:authentication property='principal.username'/>";
	const password = document.querySelector("#password").value;
	
	const result = certifiedPwd(id, password);
	
	if(result === "true"){
		document.querySelector("#certifiedBox").style.display = "none";
		document.querySelector("#userData").style.display = "inline-block";
	}
	else{
		document.querySelector("#passwordErr").innerHTML = "비밀번호가 일치하지 않습니다.";
	}
	
});

// 비밀번호 확인 메서드
const certifiedPwd = (id, password) => {
	let result = "";
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/certified.do",
		async: false, 
		data: {id: id, password: password},
		success(data){
			result = data;
		},
		error: console.log
	});
	
	return result;
}

// 예약내역 확인 메서드
document.querySelector("#myReservationCheck").addEventListener("click", (e)=>{
	
	$.ajax({
		url: "${pageContext.request.contextPath}/reservation/getMyReservation.do",
		data: {id : "${loginMember.id}"},
		success(myScheduleList){
			myScheduleList.forEach((mySchedule)=>{
				console.log(mySchedule);
				const {cinemaName, endTime, genre, id, limitAge, runningTime, seatNo, startTime, theaterNo, title} = mySchedule;
				
				const tbody = document.querySelector("#myReservationTable tbody");
				
				const tr = document.createElement("tr");
				const cinemaTd = document.createElement("td");
				cinemaTd.innerText = cinemaName + " " + theaterNo + "관";
				const movieTd = document.createElement("td");
				movieTd.innerText = title;
				const genreTd = document.createElement("td");
				genreTd.innerText = genre;
				const limitAgeTd = document.createElement("td");
				limitAgeTd.innerText = limitAge == 0 ? "전체이용가" : limitAge + "세 이용가";
				const startTimeTd = document.createElement("td");
				startTimeTd.innerHTML = startTime.slice(0, 10) + "</br>" + startTime.slice(11);
				const endTimeTd = document.createElement("td");
				endTimeTd.innerHTML = endTime.slice(0, 10) + "</br>" + endTime.slice(11);
				const seatTd = document.createElement("td");
				seatTd.innerText = seatNo;
				tr.append(cinemaTd, movieTd, genreTd, limitAgeTd, startTimeTd, endTimeTd, seatTd);
				tbody.append(tr);
			});
		},
		error: console.log
	});
	
	document.querySelector("#myReservation").style.display = "inline-block";
});

document.querySelector("#checkGradeBenefit").addEventListener("click", (e)=>{
	$("#gradeCheckBenefitModal").modal("show");
});
</script>
</body>
</html>