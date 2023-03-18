<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/question.css"/>    
   
	

<div id="contents">
  <div class="cols-content">
	    <div class="col-aside">
	    		<h2>
	        		고객센터 메뉴</h2>
		    		<div class="snb">
				        <ul class="ul1">
				            <li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
				            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
				            <li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
				            <li class='on'><a href="${ pageContext.request.contextPath }/question/question.do">이메일 문의<i></i></a></li>
				        </ul>
				    </div>
		</div>
		<div class="col-detail">
			<div class="email_list_area">
				<div class="customer_top">
					<h2 class="tit">이메일 문의</h2>
					<p class="stit">자주찾는 질문에서 원하는 답변을 찾지 못하셨군요 <br />
					불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
				</div>
					
					<form:form name="questionFrm" action="${pageContext.request.contextPath}/question/questionEnroll.do" method="post">
                    <input type="hidden" id="hIsTemp" name="hIsTemp" value="N" />
                    <input type="hidden" id="hIdx" name="hIdx" value="" />
                    <fieldset>
						<legend>이메일 문의</legend>
						<div class="tbl_area">
							<p class="tbl_info_txt">체크(<em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수" /></em>)된 항목은 필수 입력 사항입니다.</p>
				
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
								<colgroup>
									<col style="width:96px" />
                                    <col style="width:303px" />
                                    <col style="width:96px" />
                                    <col style="width:303px" />
								</colgroup>
								<tbody>
                                    <tr>
										<th scope="row"><label for="name">이름<img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></label></th>
										<td colspan="3">
											<input type="text" id="name" name="name" class="inp01" style="width: 200px;" />
										</td>
									</tr>
									<tr>
										<th scope="row">휴대전화<img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></th>
										<td>
											<input type="text" id="phone" name="phone" style="width: 200px;" />
										</td>
                                            
										<th scope="row">이메일<img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></th>
										<td>
											<input type="text" id="email" name="email" style="width: 250px;" />
										</td>
                                           
									</tr>
                                    <tr class="check_info">
                                        <td colspan="4">
                                            <div>
                                                <strong>※  문의에 대한 빠른 답변을 원하신다면 모든 항목을 입력해주세요</strong>  
                                            </div>
                                            <div class="desc_miso">
                                                <p class="desc_txt1">고객님의 문의에 답변하는 직원은 <em>고객 여러분의 가족 중 한 사람</em>일 수 있습니다.</p>
                                                <p class="desc_txt2">저희 J3L은 고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 고객상담직원을 보호하기 위해<br />관련 법에 따라 수사기관에 필요한 조치를요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</p>
                                            </div>
                                        </td>
                                    </tr>
									<tr>
										<th scope="row">문의유형 <img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></th>
										<td colspan="3">
											<select class="form-select" name="type">
										      <option value="MUNEE" >문의</option>
										      <option value="BULMAN" >불만</option>
										      <option value="CHINGCHAN" >칭찬</option>
										      <option value="JAEAN">제안</option>
										      <option value="BUNSILMOOL">분실물</option>
			    							</select>
										</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<th scope="row"><label for="title">제목<img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" class="inp01" style="width: 672px;" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="inp_textbox">내용<img src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png"/></label></th>
										<td colspan="3">
											<textarea cols="60" rows="5" id="content" name="content"  class="inp_txtbox01" style=" height:94px !important;"
											placeholder="※문의 내용 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다."></textarea>
											<p class="byte_info"><span id="sp_ad_content_size_1"></span><span><span id="sp_ad_content_size_2"></span></span></p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="box-btn qna_email">
							<a style="margin-left:5px" href="${pageContext.request.contextPath }/faq/main.do" class="round gray"><span style="padding:0 14px;">취소</span></a>
                            <button style="width:80px" class="round inred" type="submit" id="emailsubmit" ><span>등록하기</span></button>
						</div>
					</fieldset>
				  </form:form>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>