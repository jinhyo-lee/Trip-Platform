<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>${place.place_name }</title>
  <!-- Viewport-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Favicon and Touch Icons-->
  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
  <link rel="manifest" href="site.webmanifest">
  <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
  <meta name="msapplication-TileColor" content="#766df4">
  <meta name="theme-color" content="#ffffff">
  <!-- Page loading styles-->
  <style>
    .page-loading {
      position: fixed;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 100%;
      -webkit-transition: all .4s .2s ease-in-out;
      transition: all .4s .2s ease-in-out;
      background-color: #fff;
      opacity: 0;
      visibility: hidden;
      z-index: 9999;
    }
    .page-loading.active {
      opacity: 1;
      visibility: visible;
    }
    .page-loading-inner {
      position: absolute;
      top: 50%;
      left: 0;
      width: 100%;
      text-align: center;
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
      -webkit-transition: opacity .2s ease-in-out;
      transition: opacity .2s ease-in-out;
      opacity: 0;
    }
    .page-loading.active > .page-loading-inner {
      opacity: 1;
    }
    .page-loading-inner > span {
      display: block;
      font-size: 1rem;
      font-weight: normal;
      color: #666276;;
    }
    .page-spinner {
      display: inline-block;
      width: 2.75rem;
      height: 2.75rem;
      margin-bottom: .75rem;
      vertical-align: text-bottom;
      border: .15em solid #bbb7c5;
      border-right-color: transparent;
      border-radius: 50%;
      -webkit-animation: spinner .75s linear infinite;
      animation: spinner .75s linear infinite;
    }
    @-webkit-keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }

  </style>
  <!-- Page loading scripts-->
  <script>
    (function () {
      window.onload = function () {
        var preloader = document.querySelector('.page-loading');
        preloader.classList.remove('active');
        setTimeout(function () {
          preloader.remove();
        }, 2000);
      };
    })();
  </script>
  
  <script type="text/javascript">
  	// Review
	function writes(place_id, page){
		 $('#writeform').load('placeReviewWriteModal?place_id='+place_id+'&page='+page);
	 }
  
  	function modify(place_rev_id, place_id, page){
		 $('#modifyform').load('placeReviewModifyModal?place_rev_id='+place_rev_id+'&place_id='+place_id+'&page='+page);
	 }

	 function reply(place_rev_id, page, place_id){
		 $('#replyform').load('placeReplyWriteModal?place_rev_id='+place_rev_id+'&place_id='+place_id+'&page='+page);
	 }

	function replyList(place_rev_id, place_id, page){ 
		$('#seeMoreOverview_rep'+place_rev_id).load('placeReplyList?place_rev_id='+place_rev_id+'&place_id='+place_id+'&page='+page);	
	}
	
	// QnA
	function qnaWrites(place_id, page){
		 $('#qna-writeform').load('placeQnaWriteModal?place_id='+place_id+'&page='+page);
	 }
 
 	function qnaModify(place_qna_id, place_id, page){
		 $('#qna-modifyform').load('placeQnaModifyModal?place_qna_id='+place_qna_id+'&place_id='+place_id+'&page='+page);
	 }

	 function answer(place_qna_id, page, place_id){
		 $('#answerform').load('placeAnswerWriteModal?place_qna_id='+place_qna_id+'&place_id='+place_id+'&page='+page);
	 }

	function answerList(place_qna_id, place_id, page){ 
		$('#seeMoreOverview_ans'+place_qna_id).load('placeAnswerList?place_qna_id='+place_qna_id+'&place_id='+place_id+'&page='+page);	
	}
  </script>
  
  <!-- Vendor Styles-->
  <link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
  <link rel="stylesheet" media="screen" href="vendor/lightgallery.js/dist/css/lightgallery.min.css"/>
  <link rel="stylesheet" media="screen" href="vendor/tiny-slider/dist/tiny-slider.css"/>
  <link rel="stylesheet" media="screen" href="vendor/flatpickr/dist/flatpickr.min.css"/>
  <link rel="stylesheet" type="text/css" href="css/bbs.css"/>
  <link rel="stylesheet" type="text/css" href="css/bbss.css"/>
  <!-- Main Theme Styles + Bootstrap-->
  <link rel="stylesheet" media="screen" href="css/theme.min.css">
</head>
<!-- Body-->
<body>
<!-- Page loading spinner-->
<div class="page-loading active">
  <div class="page-loading-inner">
    <div class="page-spinner"></div><span>Loading...</span>
  </div>
</div>
<main class="page-wrapper">
  <!-- Sign In Modal-->
  <%@ include file="../modal.jsp" %>
  <!-- Navbar-->
  <%@ include file="../navbar.jsp" %>
  <!-- Page content-->
  <section class="container mt-5 mb-lg-5 mb-4 pt-5 pb-lg-5">
    <!-- Breadcrumb-->
    <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="main">홈</a></li>
        <li class="breadcrumb-item active" aria-current="page">명소</li>
      </ol>
    </nav>
    <!-- Bookmark-->
    <div class="d-flex justify-content-between align-items-center">
      <ul class="d-flex mb-4 list-unstyled"></ul>
      <div class="text-nowrap">
       <c:if test="${!empty sessionScope.id && isMark == false }">
        	<button class="btn btn-icon  btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button"  title="북마크 추가" onclick="location.href='addPlaceMark?place_id=${place.place_id}&page=${page}&state=cont'"><i class="fi-bookmark"></i></button>
        </c:if>
         <c:if test="${!empty sessionScope.id && isMark == true }">
        	<button class="btn btn-icon  btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button"  title="북마크 삭제" onclick="location.href='addPlaceMark?place_id=${place.place_id}&page=${page}&state=cont'"><i class="fi-bookmark-filled"></i></button>
         </c:if>   
         <c:if test="${sessionScope.id eq 'admin'}">
        <div class="dropdown d-inline-block">
          <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-dots-vertical"></i></button>
          <div class="dropdown-menu dropdown-menu-end my-1">
            <button class="dropdown-item" type="button" onclick="location.href='placeDetail?place_id=${place.place_id}&page=${page}&state=modify'"><i class="fi-edit opacity-60 me-2"></i>수정</button>
            <button class="dropdown-item" type="button" href="#place-delete-modal" data-bs-toggle="modal" data-bs-dismiss="modal"><i class="fi-trash opacity-60 me-2"></i>삭제</button>
          </div>
        </div>
        </c:if>
      </div>
    </div>
    <div class="row gy-5 pt-lg-2">
      <div class="col-lg-5">
        <div class="d-flex flex-column">
          <div class="order-lg-1 order-2">
            <div class="card py-2 px-sm-4 px-3 shadow-sm">
              <div class="card-body mx-n2">
                <!-- Place info-->
                <div class="d-flex align-items-start mb-3 pb-0 border-bottom">
                  <div class="ps-2 ms-1">
                    <h3 class="h4 mb-2">${place.place_name } <i class="fi-star-filled mt-n1 me-1 text-warning align-middle opacity-70"></i><b>${place.place_rate } </b></h3>
                    <ul class="list-unstyled d-flex flex-wrap fs-md row-cols-md-1">
                      <li class="me-2 mb-2 pe-1"><i class="fi-museum mt-n1 me-1 align-middle opacity-70"></i>${place.place_act } | ${place.place_type }</li>
                      <li class="me-2 mb-2 pe-1"><i class="fi-map-pin mt-n1 me-1 align-middle opacity-70"></i>주소 : ${place.place_addr }</li>
                      <li class="me-2 mb-2 pe-1"><i class="fi-phone mt-n1 me-1 align-middle opacity-70"></i>연락처 : ${place.place_tel }</li>
                      <li class="me-2 mb-2 pe-1"><i class="fi-clock mt-n1 me-1 align-middle opacity-70"></i>영업시간 : ${place.place_hour }</li>
                    </ul>
                  </div>
                </div>
                <!-- Place contacts-->
                <div class="mb-0 pb-0">
                  <h4 class="h4 mb-4">상세 정보</h4>
                  <ul class="list-unstyled d-flex flex-wrap row-cols-md-1">
                    <li class="h6 col"><i class="fi-car mt-n1 me-1 align-middle opacity-70"></i>이동 안내 및 소개</li>
                    <p class="mb-3">${content }</p>
                  </ul>
                </div>
              </div>
            </div>
            <div class="card border-0 bg-secondary mb-4">
            </div>
          </div>
        </div>
      </div>
      <!-- Sidebar with details-->
      <aside class="col-lg-7">
        <!-- Carousel with slides count-->
        <div class="order-lg-1 order-2">
          <div class="tns-carousel-wrapper">
            <div class="tns-slides-count text-light"><i class="fi-image fs-lg me-2"></i>
              <div class="ps-1"><span class="tns-current-slide fs-5 fw-bold"></span><span class="fs-5 fw-bold">/</span><span class="tns-total-slides fs-5 fw-bold"></span></div>
            </div>
            <div class="tns-carousel-inner" data-carousel-options="{&quot;navAsThumbnails&quot;: true, &quot;navContainer&quot;: &quot;#thumbnails&quot;, &quot;gutter&quot;: 12, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false},&quot;500&quot;:{&quot;controls&quot;: true}}}">
              <c:forTokens var="photo" items="${place.place_photo}" delims="," begin="0" end="4">
                <div><img class="rounded-3" src="upload/${photo}" alt="Image" style="width:800px; height: 500px;"/></div>
              </c:forTokens>
            </div>
          </div>
          <!-- Thumbnails nav-->
          <ul class="tns-thumbnails mb-4" id="thumbnails">
            <c:forTokens var="photo" items="${place.place_photo}" delims="," begin="0" end="4">
              <li class="tns-thumbnail"><img src="upload/${photo}" alt="Thumbnail" style="width:160px; height: 100px;"></li>
            </c:forTokens>
          </ul>
        </div>
      </aside>
      <section class="container mb-5 pb-1">
        <div class="row">
          <div class="col-md-7 mb-md-0 mb-4">
          <!-- Nearby -->
          <div class="col-lg-12">
            <div class="d-flex align-items-center justify-content-between mb-4 pb-2">
              <h4 class="mb-0">인근 지역</h4>
            </div>
              <h6 class="mb-5"><i class="fi-map-pin"></i>&ensp;${city }</h6>
              <div class="row">
              <div class="col-sm-6">
                <!-- Item-->
                <c:set var="query" value="${queryList }"/>
                <c:if test="${!empty query[0]}">
                <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[0].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="placeDetail?place_id=${query[0].place_id}&page=${page}&state=cont">${query[0].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[0].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[0].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[0].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
                <!-- Item-->
               <c:if test="${!empty query[1]}">
               <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[1].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="placeDetail?place_id=${query[1].place_id}&page=${page}&state=cont">${query[1].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[1].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[1].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[1].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
                <!-- Item -->
                <c:if test="${!empty query[2]}">
                <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[2].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="foodDetail?food_id=${query[2].place_id}&page=${page}&state=cont">${query[2].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[2].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[2].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[2].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
              </div>
              <div class="col-sm-6">
                <!-- Item -->
                <c:if test="${!empty query[3]}">
                <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[3].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="foodDetail?food_id=${query[3].place_id}&page=${page}&state=cont">${query[3].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[3].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[3].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[3].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
               <!-- Item -->
               <c:if test="${!empty query[4]}">
               <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[4].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="roomDetail?room_id=${query[4].place_id}&page=${page}&state=cont">${query[4].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[4].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[4].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[4].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
               <!-- Item -->
               <c:if test="${!empty query[5]}">
               <div class="d-flex align-items-start position-relative mb-4"><c:forTokens var="photo" items="${query[5].place_photo}" delims="," begin="0" end="0"><img class="flex-shrink-0 me-3 rounded-3" src="upload/${photo }" alt="Brand logo" style="width: 100px; height: 100px; object-fit: cover;">
                  </c:forTokens><div>
                    <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="roomDetail?room_id=${query[5].place_id}&page=${page}&state=cont">${query[5].place_name }</a></h3>
                    <ul class="list-unstyled mb-0 fs-xs">
                      <li><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>${query[5].place_rate }</b></li>
                      <li><i class="fi-info-circle mt-n1 me-1 fs-base text-muted align-middle"></i>${query[5].place_type }</li>
                      <li><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>${query[5].place_addr }</li>
                    </ul>
                  </div>
                </div>
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <!-- Map-->
        <div class="col-lg-4 col-md-5 ms-lg-0 pb-1">
          <div class="pt-2">
            <div id="map" style="width:450px;height:500px;"></div>
          </div>
        </div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab28a8b644806d9fac34e182130efaef&libraries=services"></script>
        <script>
          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 영역
                  mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                  };
          
          var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성
          
          var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성

          geocoder.addressSearch('${place.place_addr}', function(result, status) { // 주소로 좌표를 검색

            if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료 시
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

              var marker = new kakao.maps.Marker({ // 결과값으로 받은 위치를 마커로 표시
                map: map,
                position: coords
              });
             
              var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우로 장소에 대한 설명을 표시
                content: '<div style="width:150px;text-align:center;padding:6px 0;">${place.place_name }</div>'
              });
              infowindow.open(map, marker);

              map.setCenter(coords); // 지도의 중심을 결과값으로 받은 위치로 이동
            }
          });
        </script>
        </div>
      </section>
    </div>
  </section>
</main>
<!-- Review -->
<%@ include file="../place_review/place_review_list.jsp" %>
<!-- Footer-->
<%@ include file="../footer.jsp" %>
<!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
<!-- Vendor scrits: js libraries and plugins-->
<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="vendor/simplebar/dist/simplebar.min.js"></script>
<script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
<script src="vendor/lg-fullscreen.js/dist/lg-fullscreen.min.js"></script>
<script src="vendor/lg-zoom.js/dist/lg-zoom.min.js"></script>
<script src="vendor/lg-thumbnail.js/dist/lg-thumbnail.min.js"></script>
<script src="vendor/flatpickr/dist/flatpickr.min.js"></script>
<script src="vendor/tiny-slider/dist/min/tiny-slider.js"></script>
<!-- Main theme script-->
<script src="js/theme.min.js"></script>
</body>
</html>