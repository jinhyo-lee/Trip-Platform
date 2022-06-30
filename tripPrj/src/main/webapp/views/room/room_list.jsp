<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Room List</title>
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
    <link rel="stylesheet" media="screen" href="vendor/tiny-slider/dist/tiny-slider.css"/>
    <link rel="stylesheet" media="screen" href="vendor/nouislider/dist/nouislider.min.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="css/theme.min.css">
  </head>
  <!-- Body-->
  <body class="fixed-bottom-btn">
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
      <!-- Page container-->
      <div class="container mt-5 mb-md-4 py-5">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <%@ include file="room_filter.jsp" %>
          <!-- Page content-->
          <div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5" id="roomAsync">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">숙소</li>
              </ol>
            </nav>
            <!-- Title-->
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">숙소</h1>
            </div>
            <!-- Counting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${listCount } results</span></div>
            </div>
            <!-- Catalog grid-->           
           <div class="row g-4 py-4">     
              <!-- Item-->
              <c:forEach var="room" items="${roomList }">
              <div class="col-sm-6 col-xl-4">
                <div class="card shadow-sm card-hover border-0 h-100">
                  <div class="tns-carousel-wrapper card-img-top card-img-hover"><a class="img-overlay" href="roomDetail?room_id=${room.room_id}&page=${page}&state=cont"></a>
                    <c:forTokens var="photo" items="${room.room_photo}" delims="," begin="0" end="0">
                    <div class="tns-carousel"><img src="upload/${photo}" alt="Image" style="width:400px; height: 180px;"/></div>
                    </c:forTokens>
                  </div>
                  <div class="card-body position-relative pb-3">
                    <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${room.room_type }</h4>
                    <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="roomDetail?room_id=${room.room_id}&page=${page}&state=cont">${room.room_name }</a></h3>
                    <p class="mb-2 fs-sm text-muted">${room.room_addr }</p>
                    <div class="fw-normal"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>₩${room.room_cost }</div>
                  </div>
                  <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                    <span class="d-inline-block mx-1 fs-sm"><i class="fi-info-circle ms-1 mt-n1 fs-sm text-muted"></i>&nbsp;${room.room_option }</span>
                    <span class="d-inline-block mx-1 fs-sm"><i class="fi-star ms-1 mt-n1 fs-sm text-muted"></i>&nbsp;${room.room_rate }점</span>
                    <span class="d-inline-block mx-1 fs-sm"><i class="fi-apartment ms-1 mt-n1 fs-sm text-muted"></i>&nbsp;${room.room_star }</span>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
            <!-- Pagination-->
            <c:if test="${listCount > 0 }">
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 10</span></li>
				<!-- Previous block -->
                <c:if test="${startPage > 10 }">
                <li class="page-item"><a class="page-link" href="roomList?page=${startPage-10 }" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
                </c:if>
                <!-- First page -->
                <c:if test="${page != 1 && startPage != 1}">
                <li class="page-item d-none d-sm-block"><a class="page-link" href="roomList?page=1" aria-label="Previous"><i class="fi-chevron-left"></i></a></li>
                <li class="page-item d-none d-sm-block">...</li>
                </c:if>
                <!-- Pages for each block -->
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${i == page }">
                <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">${i}<span class="visually-hidden">(current)</span></span></li>
                </c:if>
                <c:if test="${i != page}">
                <li class="page-item d-none d-sm-block"><a class="page-link" href="roomList?page=${i}">${i}</a></li>
                </c:if>
                </c:forEach>
                <!-- Last page -->
                <c:if test="${endPage != pageCount}">
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="roomList?page=${pageCount}">${pageCount}</a></li>
                </c:if>
                <!-- Next block -->
                <c:if test="${endPage < pageCount}">
                <li class="page-item"><a class="page-link" href="roomList?page=${startPage+10 }" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                </c:if>
              </ul>
            </nav>
            </c:if>
          </div>
        </div>
      </div>
    </main>
    <!-- Footer-->
    <%@ include file="../footer.jsp" %>
    <!-- Filters sidebar toggle button (mobile)-->
    <button class="btn btn-primary btn-sm w-100 rounded-0 fixed-bottom d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#filters-sidebar"><i class="fi-filter me-2"></i>Filters</button>
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="vendor/leaflet/dist/leaflet.js"></script>
    <script src="vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="vendor/nouislider/dist/nouislider.min.js"></script>
    <!-- Main theme script-->
    <script src="js/theme.min.js"></script>
  </body>
</html>