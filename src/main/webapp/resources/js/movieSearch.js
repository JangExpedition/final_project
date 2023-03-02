        'use strict';
((global = window, doc = document) => {
  var namespace = 'DOM';

  //-------------------------------------
  // HELPER FUNCTIONS
  // querySelector
  function el(target, parent) {
    typeof parent === 'string' ? parent = el(parent) : parent = parent;
    return (parent || doc).querySelector(target);
  }

  // querySelectorAll
  function els(target, parent) {
    typeof parent === 'string' ? parent = el(parent) : parent = parent;
    return (parent || doc).querySelectorAll(target);
  }

  //------------ 
  // css 속성 확인해주는 helper 함수
  function getStyle(target, pseudo, property) {
    var target;
    typeof target === 'string' ? target = global.getComputedStyle(el(target), pseudo) : target = global.getComputedStyle(target, pseudo);
    return target.getPropertyValue(property);
  }

  //------------
  // css 속성 바꿔주는 helper 함수
  function setStyle(target, property, value) {
    var set_style;
    typeof target === 'string' ? set_style = el(target).style.setProperty(property, value) : set_style = target.style.setProperty(property, value);
    return set_style;
  }
  //------------

  //------------
  // css class 추가 && 제거
  function toggleClass(target, name) {
    // 해당 요소의 classList를 확인해서
    var target_class;
    // target 값이 문자열이면 target 요소를 선택한 후 classList 반환
    typeof target === 'string' ? target_class = el(target).classList : target_class = target.classList;
    // 클랙스 리스트에 name값이 없으면 클래스 리스트에 추가해주고 있으면 리스트에서 제거
    target_class.contains(name) !== true ? target_class.add(name) : target_class.remove(name);
  }

  //------------
  // css class 추가
  function addClass(target, name) {
    var target_class;
    // 해당 요소의 classList를 확인해서
    typeof target === 'string' ? target_class = el(target).classList : target_class = target.classList;
    // 클래스 리스트에 추가
    target_class.add(name);
  }

  //------------
  // css class 제거
  function removeClass(target, name) {
    var target_class;
    // 해당 요소의 classList를 확인해서
    typeof target === 'string' ? target_class = el(target).classList : target_class = target.classList;
    // 클래스 리스트에 제거
    target_class.remove(name);
  }

  Object.defineProperty(global, namespace, { value: {} });

  [
  el, els,
  setStyle, getStyle,
  toggleClass, addClass, removeClass].
  forEach(function (fn) {
    global[namespace][fn.name] = fn;
  });

  Object.freeze(global[namespace]);

})();

((global = window, doc = document, { template } = y9, { el, els, addClass, removeClass, toggleClass } = DOM) => {
  const form = el('#form');
  const search = el('#mvs');
  const send_btn = el('#send');
  const input_val = mvs;
  const result_list = el('.result-list');
  let keyword = '';
  let data = {};


  //------------
  // XMLHttpRequest helper 함수
  function newRequest(method, from, callback) {

    let xhr = new XMLHttpRequest();

    xhr.open(method, from);

    xhr.onreadystatechange = () => {
      if ((xhr.status === 200 || xhr.status === 304) && xhr.readyState === 4) {
        // 받은 데이터를 object 형태로 바꿔주고 data 변수에 참조
        data = JSON.parse(xhr.responseText);
        // callback이 함수이면 콜백 함수의 parameter에 data 출력 아니면 함수로 만들어줌
        typeof callback == 'function' ? callback(data) : data => {};
      }
    };
    xhr.send();
  }

  //------------
  // TMDb API에서 이미지 url과 사이즈를 가지고 오는 함수
  let img_config = (() => {
    let config = [];
    let tmdb_config = `https://api.themoviedb.org/3/configuration?api_key=79521dc97b3ea5b6ec99272524dc78f7`;
    newRequest('GET', tmdb_config, data => {
      const configs = data.images;
      const img_url = configs.secure_base_url;
      const size_options = configs.poster_sizes;
      const img_size = size_options[3];
      config = config.push(img_url, img_size);
    });
    return config;
  })();

  //------------
  // 클래스 .result-list안에 있는 모든 li 요소 제거
  function reset() {
    const parent = el('.result-list');
    const list = els('li', parent);
    const loading = el('.loading');

    addClass(loading, 'hide');
    list.forEach(target => parent.removeChild(target));
  }

  //------------
  // TMDb API에서 영화 정보를 가지고 오는 함수
  function getTmdb(key) {
    const lang = 'ko-KR';
    let tmdb_api = 'https://api.themoviedb.org/3/search/movie?api_key=' + userkey + '' +
    '&language=' + lang + '&query=';
    if (key !== '') {
      global.setTimeout(newRequest('GET', tmdb_api + key, renderResult), 2000);
    } else {
      hideLoader();
      alert('못 알아 들었습니다.');
    }

  }

  //------------
  // TMDb API에서 영화 정보를 가지고 올 query keyword setting 해주는 함수
  let setKeyword = (keyword = input_val.value) => {
    // keyword 변수에 있는 값이 빈 문자가 아니면
    // keyword 변수에 input의 value 값의 앞 뒤 공백을 제거 하고 참조
    // keyword 변수에 있는 값이 빈 문자가 맞으면
    // 빈 문자 참조 (그러면 검색이 안됨)
    typeof keyword !== '' ? keyword = input_val.value.trim() : keyword = '';
    // keyword 변수 값을 받은 후 TMDb API에 데이터 요청
    getTmdb(keyword);
  };

  function showLoader() {
    removeClass('.loader', 'hide');
    removeClass('.loading', 'hide');
  }

  function hideLoader() {
    addClass('.loader', 'hide');
    addClass('.loading', 'hide');
  }

  function searchUI() {
    // 서치 아이콘 버튼을 누르면 키워드 가지고 오는 함수 실행
    send_btn.addEventListener('click', () => {
      showLoader();
      setKeyword();
    });

    // 서치 아이콘 버튼을 누르면 키워드 가지고 오는 함수 실행
    send_btn.addEventListener('keydown', e => {
      if (e.keyCode === 13) {
        // 로딩 중 애니메이션 보여줌
        showLoader();
        // setKeyword 함수 실행
        setKeyword();
      }
    });

    // input 필드에 focus 되면
    // header 요소에 active 클래스 추가 (현재 classList에 active 클래스 없음)
    search.addEventListener('focus', () => {toggleClass('header', 'header-active');});

    // input 필드에 focus out 되면
    // header 요소에 active 클래스 제거 (input 필드에 focus 되면서 active 클래스가 classList에 생김)
    search.addEventListener('blur', () => {toggleClass('header', 'header-active');});

    search.addEventListener('keyup', e => {
      switch (e.keyCode) {
        // tab 키를 눌렀다 때면 버튼에 포서스
        case 9:send_btn.focus();
          break;
        // enter 키를 눌렀다 때면 setKeyword 함수 실행
        case 13:
          showLoader();
          // global.setTimeout(setKeyword, 1500);
          setKeyword();
          break;
        // escape 키를 눌렀다 때면 search 창 blur
        case 27:search.blur();}

    });

    form.addEventListener('keydown', e => {
      // enter key를 치면 페이지 새로 고침 되는 현상 막음
      if (e.keyCode === 13) {
        e.preventDefault();
      }
    });
  }

  function noResult() {
    // 서치 결과 리스트를 한번 리셋 해주는 함수를 실행시키고
    reset();
    // 로딩 중 애니메이션 숨김
    hideLoader();
    // header 요소 크기 줄임
    addClass('header', 'header-is_small');

    addClass('.result-list', 'list-active');
    // body 요소에 백그라운드 색상 지정
    addClass('body', 'is-gray');
    // footer 요소 브라우저 끝에 붙게
    addClass('footer', 'at-bottom');
  }

  function noResultReset() {
    removeClass('body', 'is-gray');

    addClass('header', 'header-is_small');

    addClass('.result-list', 'list-active');
  }

  function renderResult(data) {
    let result = data.results;

    // result 배열이 비어있으면
    if (result.length === 0) {

      noResult();
      // .result_list ul의 안쪽 시작점에 새로운 <li> 상성
      result_list.insertAdjacentHTML('afterbegin', '<li class="no-list"><span class="keyword">' + keyword + '</span>에 대한 정보가 없습니다.</li>');

    } else {
      let url = img_config[0];
      let size = img_config[1];

      let html_temp = template(result, item => {
        let title = item.title;
        let poster = item.poster_path;
        let vote_avg = item.vote_average;
        let rel_year = item.release_date;
        let desc = item.overview;

        poster !== null ? poster = url + size + poster : poster = 'https://s33.postimg.cc/fmvvs944v/icon_image.png';
        rel_year !== '' ? rel_year = item.release_date.slice(0, -6) : rel_year = "알 수 없음";

        let template = `
        <li class="mv-info">
          <div class="info-header clearfix">
            <h2 class="mv-title">${title}</h2 >
            <span class="mv-relyear">${rel_year}</span>
            <strong class="mv-rating">평점<span class="a11y-hidden">10점 만점에</span><span class="rating">${vote_avg}</span></strong>
          </div>\
          <div class="info-content clearfix">
            <img class="mv-img" src="${poster}" alt="${title} 포스터">
            <div class="overview">
              <div class="overview-header">
                <h3><span class="a11y-hidden">${title}</span>줄거리</h3>
                <button class="more">미리 알아보기</button>
              </div>
              <p class="hide">${desc}</p>
            </div>
          </div>
        </li>`;

        return template;
      });

      reset();

      noResultReset();

      hideLoader();

      result_list.insertAdjacentHTML('afterbegin', html_temp);

      renderResultUI();
    }
  }

  function renderResultUI() {

    const open_infos = els('.overview-header');
    const info_btns = els('.more');
    const info_btn = el('.more');

    function infoUI() {

      // 브라우저의 가로 폭이 768px 이상이면 영화 미리보기 보여주는 함수
      showInfo();

      global.addEventListener('resize', showInfo);

      function showInfo() {
        // 브라우저의 가로 폭 값을 vw 변수에 참조
        // global = window 
        // window.innerWidth은 모든 브라우저 및 IE9 이상 용 
        // document.documentElement.clientWidth은 IE9 이하
        // vw = global.innerWidth;
        let vw = global.innerWidth;
        // console.log(vw); 
        for (let i = 0, l = open_infos.length; i < l; i++) {if (window.CP.shouldStopExecution(0)) break;
          let overview_p = open_infos[i].nextElementSibling;
          let info_btn = info_btns[i];
          // vw의 값이 768보다 크면 즉, 브라우저의 가로 값이 768px 보다 크면
          if (vw > 768) {
            // 클래스 .overview 에 있는 p 요소의 class명 'hide'를 제거  
            removeClass(overview_p, 'hide');
            addClass(info_btn, 'hide');
          } else {
            addClass(overview_p, 'hide');
            removeClass(info_btn, 'hide');
          }
        }window.CP.exitedLoop(0);
      }

      for (let i = 0, l = open_infos.length; i < l; i++) {if (window.CP.shouldStopExecution(1)) break;
        info_btns[i].addEventListener('click', toggleInfo);
      }window.CP.exitedLoop(1);
    }

    // 영화 미리 알아보기 버튼을 누르면 줄거리 보여주고 숨기는 토글 함수
    function toggleInfo(e) {

      for (let i = 0, l = open_infos.length; i < l; i++) {if (window.CP.shouldStopExecution(2)) break;

        let parent = info_btns[i].parentElement.parentElement;
        let overview = parent;
        let overview_p = el('p', parent);
        let info_btn_data = info_btns[i];

        if (this === el('.more', parent)) {
          toggleClass(overview, 'oh-active');
          toggleClass(overview_p, 'hide');
        } else {
          removeClass(overview, 'oh-active');
          addClass(overview_p, 'hide');
        }

        overview.classList.value !== 'overview oh-active' ? info_btn_data.textContent = '미리 알아보기' : this.textContent = '닫기';
      }window.CP.exitedLoop(2);
    }

    // 이미지에 주소가 없으면 이미지 대체해주는 함수
    function imageNull() {
      const locate = [];
      let info_imgs = els('.mv-img');

      for (let i = 0, l = info_imgs.length; i < l; i++) {if (window.CP.shouldStopExecution(3)) break;

        let img_check = info_imgs[i].getAttribute('src');
        let url_check = img_check.indexOf(img_config[0]);
        if (url_check !== 0) {
          let count = i;
          locate.push(count);
          // count = locate.length;
        }
      }window.CP.exitedLoop(3);

      for (let i = 0, l = locate.length; i < l; i++) {if (window.CP.shouldStopExecution(4)) break;
        let location = locate[i];
        let img_to_change = info_imgs[location];
        addClass(img_to_change, 'img_is-null');
      }window.CP.exitedLoop(4);
    }

    // 줄거리가 빈 문자열로 들어왔을때 대체해주는 함수
    function descNull() {
      const locate = [];

      let info_descs = els('.overview p');
      for (let i = 0, l = info_descs.length; i < l; i++) {if (window.CP.shouldStopExecution(5)) break;
        let desc_check = info_descs[i].innerText;
        if (desc_check === '') {
          let count = i;
          locate.push(count);
        }
      }window.CP.exitedLoop(5);
      for (let i = 0, l = locate.length; i < l; i++) {if (window.CP.shouldStopExecution(6)) break;
        let location = locate[i];
        let desc_to_disable = info_descs[location];
        desc_to_disable.textContent = '앗! 줄거리가 없거나 현재 번역이 안된 컨텐츠 입니다. ㅠㅠ';
      }window.CP.exitedLoop(6);
    }

    // rate의 값이 0일때 대체해주는 함수 
    function rateNull() {
      const locate = [];
      let ratings = els('.rating');
      for (let i = 0, l = ratings.length; i < l; i++) {if (window.CP.shouldStopExecution(7)) break;
        let rate_check = ratings[i].innerText;
        if (rate_check === '0') {
          let count = i;
          locate.push(count);
        }
      }window.CP.exitedLoop(7);
      for (let i = 0, l = locate.length; i < l; i++) {if (window.CP.shouldStopExecution(8)) break;
        let location = locate[i];
        let rate_to_disable = ratings[location];
        addClass(rate_to_disable, 'rate_is-null');
      }window.CP.exitedLoop(8);
    }

    infoUI();
    imageNull();
    descNull();
    rateNull();
  }

  searchUI();

})();