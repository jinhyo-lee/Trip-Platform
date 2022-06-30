<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Review List</title>
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
    <link rel="stylesheet" media="screen" href="vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css"/>
    <link rel="stylesheet" media="screen" href="vendor/filepond/dist/filepond.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bbs.css" />
    <link rel="stylesheet" type="text/css" href="css/bbss.css" />  
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
      <!-- Navbar-->
      <%@ include file="../navbar.jsp" %>
      <!-- Page content-->
      <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="main">홈</a></li>
            <li class="breadcrumb-item"><a href="myPage">계정</a></li>
            <li class="breadcrumb-item active" aria-current="page">회원정보</li>
          </ol>
        </nav>
        <!-- Page content-->
        <div class="row">
          <!-- Sidebar-->
          <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
            <!-- Account nav-->
            <div class="card card-body border-0 shadow-sm pb-1 me-lg-1">
              <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-1">
               	<c:if test="${!empty member.profile}">
				<label for="input-file"><img class="rounded-circle" src="upload/${member.profile}" width="100"/></label>
				</c:if>
				<c:if test="${empty member.profile}">
				<label for="input-file"><img class="rounded-circle" src="img/avatars/13.png" width="100"/></label>
				</c:if>
				<input type="file" id="input-file" name="profiles" style="display: none"> 
                <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3">
                  <h2 class="fs-lg mb-0">${member.id}</h2>
                  <ul class="list-unstyled fs-sm mt-3 mb-0">
                    <li><a class="nav-link fw-normal p-0" href="tel:3025550107"><i class="fi-phone opacity-60 me-2"></i>${member.tel}</a></li>
                    <li><a class="nav-link fw-normal p-0" href="mailto:annette_black@email.com"><i class="fi-mail opacity-60 me-2"></i>${member.mail}</a></li>
                  </ul>
                </div>
              </div>
              <div class="collapse d-md-block mt-3" id="account-nav">
                <div class="card-nav">
                  <a class="card-nav-link" href="myPage"><i class="fi-user opacity-60 me-2"></i>개인 정보</a>
                  <a class="card-nav-link" href="myBookmarkList"><i class="fi-bookmark opacity-60 me-2"></i>북마크</a>
                  <a class="card-nav-link active" href="myReviewList"><i class="fi-star opacity-60 me-2"></i>리뷰</a>
                  <a class="card-nav-link" href="myQnaList"><i class="fi-help opacity-60 me-2"></i>Q&A</a>
                  <a class="card-nav-link" href="logout"><i class="fi-logout opacity-60 me-2"></i>로그아웃</a></div>
              </div>
            </div>
          </aside>
          <!-- Content -->
          <div class="col-lg-8 col-md-7 mb-5">
            <div class="d-flex align-items-center justify-content-between mb-4 pb-2">
              <h1 class="h2 mb-0">리뷰 </h1><a class="fw-bold text-decoration-none" href="main"><i class="fi-home fs-xs mt-n1 me-2"></i>홈으로</a>
            </div>
            <!-- Tabs content-->
            <div class="tab-content pt-2">
              <!-- Reviews about you tab-->
              <div class="tab-pane fade show active" id="reviews-about-you" role="tabpanel">
                <!-- Food -->
                <c:forEach var="foodReview" items="${foodReviewList}" varStatus="status">
				<div class="mb-4 pb-4 border-bottom">
					<div class="d-flex justify-content-between mb-3">
						<div class="d-flex align-items-center pe-2">
							<c:if test="${!empty foodReview.userphoto}">
							<img class="rounded-circle me-1" src="upload/${foodReview.userphoto}" width="48" alt="Avatar">
							</c:if>
							<c:if test="${empty foodReview.userphoto}">
							<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
							</c:if>
							<div class="ps-2">
								<h6 class="fs-base mb-0">${foodReview.id}</h6>
							</div>
						</div>
						<div class="d-inline-block">
							<a style="float: right;" class="text-muted fs-sm" href="foodDetail?food_id=${foodReview.food_id}&page=1&state=cont">&nbsp;해당 게시글로 이동</a>
						</div>
					</div>
					<div class="starpoint_wraps">
						<div class="starpoint_boxs" id="star1">
							<c:forEach var="i" begin="1" end="10">
							<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}">
							<label for="starpoint_${i}" class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label>
							</c:forEach>
							<span class="starpoint_bg" style="width: ${foodReview.rev_rate * 2 * 10}% !important"></span>
						</div><br>
					</div>
					<h6 class="fs-base mb-0">${foodReview.rev_title}</h6><br>
					<p>${foodReview.rev_content}</p>
					<div class="fs-base mb-0">
						<c:if test="${!empty foodReview.rev_photo}">
							<c:forTokens var="photo" items="${foodReview.rev_photo}" delims=",">
							<img src="upload/${photo}" style="height: 100px; width: 100px;"/>
							</c:forTokens>
						</c:if>
					</div><br>
					<div class="d-flex justify-content-between align-items-center" style="float: right;">
						<span class="text-muted fs-sm">${foodReview.rev_reg}</span>
					</div>
				</div>
			    </c:forEach>
                <!-- Place -->
                <c:forEach var="placeReview" items="${placeReviewList}" varStatus="status">
				<div class="mb-4 pb-4 border-bottom">
					<div class="d-flex justify-content-between mb-3">
						<div class="d-flex align-items-center pe-2">
							<c:if test="${!empty placeReview.userphoto}">
							<img class="rounded-circle me-1" src="upload/${placeReview.userphoto}" width="48" alt="Avatar">
							</c:if>
							<c:if test="${empty placeReview.userphoto}">
							<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
							</c:if>
							<div class="ps-2">
								<h6 class="fs-base mb-0">${placeReview.id}</h6>
							</div>
						</div>
						<div class="d-inline-block">
							<a style="float: right;" class="text-muted fs-sm" href="placeDetail?place_id=${placeReview.place_id}&page=1&state=cont">&nbsp;해당 게시글로 이동</a>
						</div>
					</div>
					<div class="starpoint_wraps">
						<div class="starpoint_boxs" id="star1">
							<c:forEach var="i" begin="1" end="10">
							<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}">
							<label for="starpoint_${i}" class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label>
							</c:forEach>
							<span class="starpoint_bg" style="width: ${placeReview.rev_rate * 2 * 10}% !important"></span>
						</div><br>
					</div>
					<h6 class="fs-base mb-0">${placeReview.rev_title}</h6><br>
					<p>${placeReview.rev_content}</p>
					<div class="fs-base mb-0">
						<c:if test="${!empty placeReview.rev_photo}">
							<c:forTokens var="photo" items="${placeReview.rev_photo}" delims=",">
							<img src="upload/${photo}" style="height: 100px; width: 100px;"/>
							</c:forTokens>
						</c:if>
					</div><br>
					<div class="d-flex justify-content-between align-items-center" style="float: right;">
						<span class="text-muted fs-sm">${placeReview.rev_reg}</span>
					</div>
				</div>
				</c:forEach>
                <!-- Room -->
                <c:forEach var="roomReview" items="${roomReviewList}" varStatus="status">
				<div class="mb-4 pb-4 border-bottom">
					<div class="d-flex justify-content-between mb-3">
						<div class="d-flex align-items-center pe-2">
							<c:if test="${!empty roomReview.userphoto}">
							<img class="rounded-circle me-1" src="upload/${roomReview.userphoto}" width="48" alt="Avatar">
							</c:if>
							<c:if test="${empty roomReview.userphoto}">
							<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
							</c:if>
							<div class="ps-2">
								<h6 class="fs-base mb-0">${roomReview.id}</h6>
							</div>
						</div>
						<div class="d-inline-block">
							<a style="float: right;" class="text-muted fs-sm" href="roomDetail?room_id=${roomReview.room_id}&page=1&state=cont">&nbsp;해당 게시글로 이동</a>
						</div>
					</div>
					<div class="starpoint_wraps">
						<div class="starpoint_boxs" id="star1">
							<c:forEach var="i" begin="1" end="10">
							<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}">
							<label for="starpoint_${i}" class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label>
							</c:forEach>
							<span class="starpoint_bg" style="width: ${roomReview.rev_rate * 2 * 10}% !important"></span>
						</div><br>
					</div>
					<h6 class="fs-base mb-0">${roomReview.rev_title}</h6><br>
					<p>${roomReview.rev_content}</p>
					<div class="fs-base mb-0">
						<c:if test="${!empty roomReview.rev_photo}">
							<c:forTokens var="photo" items="${roomReview.rev_photo}" delims=",">
							<img src="upload/${photo}" style="height: 100px; width: 100px;"/>
							</c:forTokens>
						</c:if>
					</div><br>
					<div class="d-flex justify-content-between align-items-center" style="float: right;">
						<span class="text-muted fs-sm">${roomReview.rev_reg}</span>
					</div>
				</div>
				</c:forEach>
              </div>
            </div>
          </div>
		</div>
      </div>
    </main>
    <!-- Footer-->
    <footer class="footer bg-secondary pt-5">
	<!-- Banner-->
	<div class="text-center fs-sm pt-4 mt-3 pb-2">&copy; All rights reserved.&ensp;<b>My Seoul Trip</b></div>
	</footer>
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="vendor/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.min.js"></script>
    <script src="vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>
    <script src="vendor/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.min.js"></script>
    <script src="vendor/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.min.js"></script>
    <script src="vendor/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.min.js"></script>
    <script src="vendor/filepond/dist/filepond.min.js"></script>
    <!-- Main theme script-->
    <script src="js/theme.min.js"></script>
  </body>
</html>