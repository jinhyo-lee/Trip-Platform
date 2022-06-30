<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Food Modify</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/leaflet/dist/leaflet.css"/>
    <link rel="stylesheet" media="screen" href="vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/filepond/dist/filepond.min.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="css/theme.min.css">
  </head>
  <!-- Body-->
  <body class="bg-secondary">
    <!-- Page loading spinner-->
    <div class="page-loading active">
      <div class="page-loading-inner">
        <div class="page-spinner"></div><span>Loading...</span>
      </div>
    </div>
    <main class="page-wrapper">
      <!-- Navbar-->
      <%@ include file="../navbar.jsp" %>
      <!-- Page container-->
      <div class="container mt-5 mb-md-4 py-5">
        <div class="row">
          <!-- Page content-->
          <form enctype="multipart/form-data" action="foodModify" method="post">
           <input type="hidden" name="food_id" value="${food.food_id}" />
  		   <input type="hidden" name="page" value="${page}" />
          <div class="col-lg-8">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-2 pt-lg-3" aria-label="Breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main">홈</a></li>
                <li class="breadcrumb-item active" aria-current="page">식당</li>
              </ol>
            </nav>
            <!-- Title-->
            <div class="mb-4">
              <h1 class="h2 mb-0">식당 글 수정</h1>
            </div>
            <!-- Basic info-->
            <section class="card card-body border-0 shadow-sm p-4 mb-4" id="basic-info">
              <h2 class="h4 mb-4"><i class="fi-info-circle text-primary fs-5 mt-n1 me-2"></i>정보</h2>
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-title">식당 이름 <span class="text-danger">*</span></label>
                  <input class="form-control" type="text" id="food_name" name="food_name" value="${food.food_name}" placeholder="식당 이름을 입력하세요" required><span class="form-text"></span>
                </div>
              <div class="col-sm-6 mb-3">
                <label class="form-label" for="ab-subcategory">유형<span class="text-danger">*</span></label>
                <select class="form-select" id="food_type" name="food_type" value="${food.food_type}" required>
                  <option value="" disabled>유형을 선택하세요</option>
                  <option value="한식당" <c:if test="${food.food_type == '한식당'}">${'selected'} </c:if>>한식당</option>
                  <option value="일식당" <c:if test="${food.food_type == '일식당'}">${'selected'} </c:if>>일식당</option>
                  <option value="중식당" <c:if test="${food.food_type == '중식당'}">${'selected'} </c:if>>중식당</option>
                  <option value="양식당" <c:if test="${food.food_type == '양식당'}">${'selected'} </c:if>>양식당</option>
                  <option value="이국식당" <c:if test="${food.food_type == '이국식당'}">${'selected'} </c:if>>이국식당</option>
                  <option value="해산물집" <c:if test="${food.food_type == '해산물집'}">${'selected'} </c:if>>해산물집</option>
                  <option value="고깃집" <c:if test="${food.food_type == '고깃집'}">${'selected'} </c:if>>고깃집</option>
                  <option value="카페" <c:if test="${food.food_type == '카페'}">${'selected'} </c:if>>카페</option>
                  <option value="베이커리" <c:if test="${food.food_type == '베이커리'}">${'selected'} </c:if>>베이커리</option>
                  <option value="요리주점" <c:if test="${food.food_type == '요리주점'}">${'selected'} </c:if>>요리주점</option>
                  <option value="바" <c:if test="${food.food_type == '바'}">${'selected'} </c:if>>바</option>
                  <option value="기타" <c:if test="${food.food_type == '기타'}">${'selected'} </c:if>>기타</option>
                </select>
              </div>
              <div class="col-sm-6 mb-3">
                <label class="form-label" for="ab-subcategory">종류<span class="text-danger">*</span></label>
                <select class="form-select" id="food_feat" name="food_feat" value="${food.food_feat}" required>
                  <option value="" disabled>종류를 선택하세요</option>
                  <option value="한식" <c:if test="${food.food_feat == '한식'}">${'selected'} </c:if>>한식</option>
                  <option value="일식" <c:if test="${food.food_feat == '일식'}">${'selected'} </c:if>>일식</option>
                  <option value="중식" <c:if test="${food.food_feat == '중식'}">${'selected'} </c:if>>중식</option>
                  <option value="양식" <c:if test="${food.food_feat == '양식'}">${'selected'} </c:if>>양식</option>
                  <option value="브런치" <c:if test="${food.food_feat == '브런치'}">${'selected'} </c:if>>브런치</option>
                  <option value="베트남식" <c:if test="${food.food_feat == '베트남식'}">${'selected'} </c:if>>베트남식</option>
                  <option value="태국식" <c:if test="${food.food_feat == '태국식'}">${'selected'} </c:if>>태국식</option>
                  <option value="인도음식" <c:if test="${food.food_feat == '인도음식'}">${'selected'} </c:if>>인도음식</option>
                  <option value="멕시칸음식" <c:if test="${food.food_feat == '멕시칸음식'}">${'selected'} </c:if>>멕시칸음식</option>
                  <option value="횟집" <c:if test="${food.food_feat == '횟집'}">${'selected'} </c:if>>횟집</option>
                  <option value="돼지고기" <c:if test="${food.food_feat == '돼지고기'}">${'selected'} </c:if>>돼지고기</option>
                  <option value="소고기" <c:if test="${food.food_feat == '소고기'}">${'selected'} </c:if>>소고기</option>
                  <option value="닭고기" <c:if test="${food.food_feat == '닭고기'}">${'selected'} </c:if>>닭고기</option>
                  <option value="양고기" <c:if test="${food.food_feat == '양고기'}">${'selected'} </c:if>>양고기</option>
                  <option value="디저트" <c:if test="${food.food_feat == '디저트'}">${'selected'} </c:if>>디저트</option>
                  <option value="술" <c:if test="${food.food_feat == '술'}">${'selected'} </c:if>>술</option>
                  <option value="기타" <c:if test="${food.food_feat == '기타'}">${'selected'} </c:if>>기타</option>
                </select>
              </div>
              <div class="col-sm-6 mb-3">
                <label class="form-label" for="ab-subcategory">대표 메뉴<span class="text-danger">*</span></label>
                <input class="form-control" type="menu" id="food_menu" name="food_menu" value="${food.food_menu}" placeholder="대표 메뉴를 입력하세요" required>
              </div>
          	  <!-- Contacts-->
              <div class="col-sm-6 mb-3">
                <label class="form-label" for="ab-phone">연락처 <span class="text-danger">*</span></label>
                <input class="form-control" type="tel" id="food_tel" name="food_tel" value="${food.food_tel}" placeholder="연락처를 입력하세요" required>
              </div>
              <div class="col-sm-6 mb-3">
                <label class="form-label" for="ab-title">주소 <span class="text-danger">*</span></label>
                <input class="form-control" type="text" id="food_addr" name="food_addr" value="${food.food_addr}" placeholder="주소를 입력하세요" required>
              </div>
              <!-- Content-->
              <label class="form-label" for="ab-description">소개 <span class="text-danger">*</span></label>
              <div class="row mb-4">
                <div class="col-md-9 mb-md-0 mb-3">
                  <textarea class="form-control" id="food_content" name="food_content" rows="6" placeholder="소개를 입력하세요" required>${food.food_content}</textarea><span class="form-text"></span>
                </div>
              </div>
               <!-- Hour-->
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-subcategory">영업시간<span class="text-danger">*</span></label>
                  <div class="input-group" >
                    <input class="form-control" id="open" name="open" type="time" value="${open}">
                    <input class="form-control" id="close" name="close" type="time" value="${close}">                 
                 </div>
                </div>
              <!-- Price-->
               <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-title">가격 <span class="text-danger">*</span></label>
                  <input class="form-control" type="text" id="food_cost" name="food_cost" value="${food.food_cost}" placeholder="가격대를 입력하세요" required>
                </div>
            </section>
            <!-- Photos-->
            <section class="card card-body border-0 shadow-sm p-4 mb-4" enctype="multipart/form-data" >
              <h2 class="h4 mb-4"><i class="fi-image text-primary fs-5 mt-n1 me-2"></i>사진 / 파일</h2>
              <div class="alert alert-info mb-4" role="alert">
                <div class="d-flex"><i class="fi-alert-circle me-2 me-sm-3"></i>
                  <p class="fs-sm mb-1">첨부파일은 최대 10MB까지 업로드 가능하며,<br>파일 포맷은 jpg, gif, png, jpeg 파일만 업로드 가능합니다.</p>
                </div>
              </div>
              <c:forTokens var="photo" items="${food.food_photo}" delims="," begin="0" end="4">
              <div><img class="rounded-3" src="upload/${photo}" alt="Image"/></div><br>
              </c:forTokens>
              <input type="file" id="food_photos" name="food_photos" value="${food.food_photo}" multiple>
            </section>
            <div class="d-sm-flex justify-content-between pt-2">
              <button class="btn btn-primary btn-lg d-block rounded-pill mb-2" type="submit">저장하기</button>
            </div>
          </div>
         </form>
        </div>
      </div>
    </main>
	<!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
	<!-- Vendor scrits: js libraries and plugins-->
	<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/simplebar/dist/simplebar.min.js"></script>
	<script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<script src="vendor/leaflet/dist/leaflet.js"></script>
	<script src="vendor/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.min.js"></script>
	<script src="vendor/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.min.js"></script>
	<script src="vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>
	<script src="vendor/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.min.js"></script>
	<script src="vendor/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.min.js"></script>
	<script src="vendor/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.min.js"></script>
	<script src="vendor/filepond/dist/filepond.min.js"></script>
	<script src="vendor/cleave.js/dist/cleave.min.js"></script>
	<!-- Main theme script-->
	<script src="js/theme.min.js"></script>
  </body>
</html>