<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<link rel="stylesheet" media="all" type="text/css" href="${ pageContext.request.contextPath }/resources/css/noticeForm.css"/>  


<div id="contaniner">
  <div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			    <h2>
			        고객센터 메뉴</h2>
			    <div class="snb">
			        <ul>
			            <li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
			            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
			            <li class='on'><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>          
			            <li class=''><a href="${ pageContext.request.contextPath }/question/question.do">이메일 문의<i></i></a></li>
			        </ul>
			    </div>
		</div>
			    <form:form name="faqFrm" action="${pageContext.request.contextPath}/notice/noticeEnroll.do" method="post">
                    <input type="hidden" id="hIsTemp" name="hIsTemp" value="N" />
                    <input type="hidden" id="hIdx" name="hIdx" value="" />
                    <fieldset>
						<legend>이메일 문의</legend>
						<div class="tbl_area">
							<p class="tbl_info_txt"><em></em></p>
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
								<colgroup>
									<col style="width:96px" />
                                    <col style="width:303px" />
                                    <col style="width:96px" />
                                    <col style="width:303px" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="inp_title">제목 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수" /></em></label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" class="inp01" style="width: 672px;" />
										</td>
									</tr>
									
									<tr>
										<th scope="row">구분  <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수" /></em></th>
										<td colspan="3">
											<select class="form-select" name="classifyy">
										      <option value="JUMGUM" selected>점검</option>
										      <option value="GITA" selected>기타</option>
										      <option value="HAENGSA" selected>행사</option>
										      <option value="EVENT">이벤트</option>
										      <option value="GKJANG">극장</option>
			    							</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="inp_textbox">내용 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수" /></em></label></th>
										<td colspan="3">
											<textarea cols="60" rows="5" id="content" name="content"  class="inp_txtbox01" onkeyup="javascript:checkByte(this,5000,'sp_ad_content_size_1', 'sp_ad_content_size_2');" ></textarea>
											<p class="byte_info"><span id="sp_ad_content_size_1"></span><span><span id="sp_ad_content_size_2"></span></span></p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br>
						</br>
						<div class="box-btn qna">
							<a style="margin-left:5px" href="${pageContext.request.contextPath}/notice/noticeList.do" class="round gray"><span style="padding:0 14px;">취소</span></a>
                            <button style="width:80px" class="round inred" type="submit" id="emailsubmit" ><span>등록하기</span></button>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
</div>
</body>
<!-- <script>
document.getElementById("emailsubmit").addEventListener("click", function() {
	  var title = document.getElementById("title").value;
	  if (title.trim() == "") {
	    alert("제목을 입력하세요.");
	    return false;
	  }
	});
</script> -->
</html>