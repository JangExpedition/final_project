<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/newAccordion.css"/>
<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">

<!-- 데이지UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/1.14.2/full.css">

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 반응형 메타태그 -->
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/>



<div class="flex container mx-auto pt-2">
  <div class="adm-side-bar">
    <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
      <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
        <span>관리자 메뉴</span>
      </div>
      <div class="font-bold flex justify-center">
        <ul class="flex flex-col">
          <li class="p-2">
            <a href="${ pageContext.request.contextPath }">
              메인 메뉴 이동
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              회원 목록 조회
            </a>
          </li>
          <li class="p-2">
            <a href="${pageContext.request.contextPath}/admin/blackList.do"">
              블랙리스트
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              영화 등록
            </a>
          </li>
          <li class="p-2">
            <a href="#">
              공지사항
            </a>
          </li>
        </ul>
      </div>
    </aside>
  </div>
  
         <!-- 탭메뉴 -->
      <ul class="faq_tap_menu">
        <li data-tab="tab1" class="active">신규문의</li>
        <li data-tab="tab2">서비스 기능</li>
        <li data-tab="tab3">관리자 기능</li>
        <li data-tab="tab4">부가 서비스</li>
        <li data-tab="tab5">교육, 고객지원</li>
      </ul>

      <!-- 검색창 -->
<!--       <div class="search_wrap">
        <input type="text" class="search_input" />
        <div class="search_ico">
          <i class="fa-solid fa-magnifying-glass search_ico"></i>
        </div>
      </div> -->


<!-- faq 리스트 -->
        <ul class="faq_list active" id="tab1">
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역1</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc"
                >답변이 표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다.
                길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.</span
              >
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역2</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역3</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역4</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역5</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역6</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역7</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <i class="fa-solid fa-angle-down"></i>
            </div>
          </li>
          <!-- li 끝 -->
        </ul>
        <ul class="faq_list" id="tab2">
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">서비스 기능 탭입니다.</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc"
                >답변이 표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다.
                길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.</span
              >
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역2</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역3</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역4</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역5</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역6</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역7</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
        </ul>
        <ul class="faq_list" id="tab3">
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">관리자 기능 탭입니다</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc"
                >답변이 표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다.
                길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.</span
              >
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역2</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역3</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역4</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역5</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역6</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역7</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
        </ul>
        <ul class="faq_list" id="tab4">
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">부가 서비스 탭입니다.</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc"
                >답변이 표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다.
                길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.</span
              >
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역2</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역3</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역4</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역5</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역6</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역7</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
        </ul>
        <ul class="faq_list" id="tab5">
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">교육, 고객지원 탭입니다.</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc"
                >답변이 표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다.
                길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.답변이 표시됩니다. 길어질 경우
                늘어납니다.답변이 표시됩니다. 길어질 경우 늘어납니다.답변이
                표시됩니다. 길어질 경우 늘어납니다.</span
              >
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역2</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역3</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역4</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역5</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역6</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
          <!-- li 시작 -->
          <li>
            <div class="list q">
              <h4 class="qa">Q</h4>
              <span class="faq_desc">신규문의 질문 영역7</span>
              <div class="expand_arr">
                <i class="fa-solid fa-angle-down"></i>
              </div>
            </div>
            <div class="list a">
              <h4 class="qa">A</h4>
              <span class="faq_desc">답변이 표시됩니다.</span>
            </div>
          </li>
          <!-- li 끝 -->
        </ul>
        
        
        
<script>
/**
 * @description faq 리스트 확장 기능
 */
document.addEventListener("DOMContentLoaded", () => {
  const listExpandBtn = document.querySelectorAll(".list.q");
  listExpandBtn.forEach((el) => {
    el.addEventListener("click", () => {
      let eventTarget = el.closest("li").querySelector(".list.a");

      eventTarget.classList.toggle("active");
    });
  });
});

/**
 * @description faq 탭메뉴
 */
const tabItem = document.querySelectorAll(".faq_tap_menu li");
const tabContent = document.querySelectorAll(".faq_list");

tabItem.forEach((item) => {
  item.addEventListener("click", tabHandler);
});

function tabHandler(item) {
  const tabTarget = item.currentTarget;
  const target = tabTarget.dataset.tab;

  tabItem.forEach((title) => {
    title.classList.remove("active");
  });
  tabContent.forEach((target) => {
    target.classList.remove("active");
  });

  document.querySelector("#" + target).classList.add("active");
  tabTarget.classList.add("active");
}

</script>