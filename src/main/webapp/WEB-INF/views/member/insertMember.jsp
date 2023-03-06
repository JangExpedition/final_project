<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입<회원서비스|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/insertMember.css"/>
<section id="insertMemberSection">
	<h1>J3L 회원가입</h1>
	<p id="enrollIntro">회원가입으로 혜택도 받고! 포인트도 쌓고!</p>
	<div id="duplicationCheck">
		<div>
			<h4>회원가입 여부 안내</h4>
			<br/>
			<ul>
				<li>기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를 정확하게 확인하실 수 있습니다. <span id="pointColor">입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.</span></li>
				<li>전자상거래에 의거하여 만 14세 미만의 어린이/학생의 회원가입을 제한합니다.</li>
			</ul>
		</div>
		<div>
			<form action="${ pageContext.request.contextPath }/member/duplicationCheck.do" id="duplicationFrm" name="duplicationFrm">
				<input name="name" type="text" placeholder="이름을 입력해주세요."/>
				<input name="_birth" type="text" placeholder="생년월일 8자리를 입력해주세요."/>
				<input name="phone" type="text" placeholder="휴대전화 뒤 7~8자리를 입력해주세요 (010 제외)"/>
				<input id="submitBtn" type="submit" value="가입여부 확인"/>
			</form>
		</div>
	</div>
</section>
<script>
document.duplicationFrm.addEventListener("submit", (e)=>{
	e.preventDefault();
	const err = document.createElement("p");
    err.style.color = "red";
    err.style.fontSize = "10px";
    const memberName = e.target.name;
    const _birth = e.target._birth;
    const phone = e.target.phone;
	
	// 이름검사 : 한글2글자 이상만 허용. 
    if(!/^[가-힣]{2,}$/.test(memberName.value)){
        err.innerText = "한글 2글자이상 입력해주세요.";
        memberName.insertAdjacentElement("afterend", err);
        return false;
    }
    
    // 생년월일 검사
    if(!/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/g.test(_birth.value)){
        err.innerText = "잘못된 생년월일입니다.";
        _birth.insertAdjacentElement("afterend", err);
        return false;
    }
    
    // 휴대폰번호 유효성검사
   	if(!/^[0-9]{8}$/.test(phone.value)){
   		err.innerText = "잘못된 휴대폰 번호입니다.";
        phone.insertAdjacentElement("afterend", err);
        return false;
   	}
    
	e.target.submit();
});
</script>
</body>
</html>