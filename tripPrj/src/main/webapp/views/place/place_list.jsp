<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Place List</title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">
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
      <!-- Page content-->
      <!-- Page container-->
      <div class="container mt-5 mb-md-4 py-5">
        <div class="row g-0 mt-n3">
          <!-- Filters sidebar (Offcanvas on mobile)-->
          <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
            <div class="offcanvas offcanvas-start offcanvas-collapse" id="filters-sidebar">
              <div class="offcanvas-header d-flex d-lg-none align-items-center">
                <h2 class="h5 mb-0">Filters</h2>
                <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
              </div>
              <div class="offcanvas-body py-lg-4">
                <div class="pb-4 mb-2">
                  <h3 class="h6">Location</h3>
                  <select class="form-select mb-2">
                    <option value="" disabled>Choose city</option>
                    <option value="Chicago">Chicago</option>
                    <option value="Dallas">Dallas</option>
                    <option value="Los Angeles">Los Angeles</option>
                    <option value="New York" selected>New York</option>
                    <option value="San Diego">San Diego</option>
                  </select>
                  <select class="form-select">
                    <option value="" selected disabled>Choose district</option>
                    <option value="Brooklyn">Brooklyn</option>
                    <option value="Manhattan">Manhattan</option>
                    <option value="Staten Island">Staten Island</option>
                    <option value="The Bronx">The Bronx</option>
                    <option value="Queens">Queens</option>
                  </select>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6">Property type</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="house">
                      <label class="form-check-label fs-sm" for="house">House</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="apartment" checked>
                      <label class="form-check-label fs-sm" for="apartment">Apartment</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="room">
                      <label class="form-check-label fs-sm" for="room">Room</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="office">
                      <label class="form-check-label fs-sm" for="office">Office</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="commercial">
                      <label class="form-check-label fs-sm" for="commercial">Commercial</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="land">
                      <label class="form-check-label fs-sm" for="land">Land</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="daily">
                      <label class="form-check-label fs-sm" for="daily">Daily rental</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="new-building">
                      <label class="form-check-label fs-sm" for="new-building">New building</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="parking-lot">
                      <label class="form-check-label fs-sm" for="parking-lot">Parking lot</label>
                    </div>
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6">Price per month</h3>
                  <div class="range-slider" data-start-min="1100" data-start-max="3000" data-min="200" data-max="5000" data-step="100">
                    <div class="range-slider-ui"></div>
                    <div class="d-flex align-items-center">
                      <div class="w-50 pe-2">
                        <div class="input-group"><span class="input-group-text fs-base">$</span>
                          <input class="form-control range-slider-value-min" type="text">
                        </div>
                      </div>
                      <div class="text-muted">&mdash;</div>
                      <div class="w-50 ps-2">
                        <div class="input-group"><span class="input-group-text fs-base">$</span>
                          <input class="form-control range-slider-value-max" type="text">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6 pt-1">Beds &amp; baths</h3>
                  <label class="d-block fs-sm mb-1">Bedrooms</label>
                  <div class="btn-group btn-group-sm" role="group" aria-label="Choose number of bedrooms">
                    <input class="btn-check" type="radio" id="studio" name="bedrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="studio">Studio</label>
                    <input class="btn-check" type="radio" id="bedrooms-1" name="bedrooms" checked>
                    <label class="btn btn-outline-secondary fw-normal" for="bedrooms-1">1</label>
                    <input class="btn-check" type="radio" id="bedrooms-2" name="bedrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bedrooms-2">2</label>
                    <input class="btn-check" type="radio" id="bedrooms-3" name="bedrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bedrooms-3">3</label>
                    <input class="btn-check" type="radio" id="bedrooms-4" name="bedrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bedrooms-4">4+</label>
                  </div>
                  <label class="d-block fs-sm pt-2 my-1">Bathrooms</label>
                  <div class="btn-group btn-group-sm" role="group" aria-label="Choose number of bathrooms">
                    <input class="btn-check" type="radio" id="bathrooms-1" name="bathrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bathrooms-1">1</label>
                    <input class="btn-check" type="radio" id="bathrooms-2" name="bathrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bathrooms-2">2</label>
                    <input class="btn-check" type="radio" id="bathrooms-3" name="bathrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bathrooms-3">3</label>
                    <input class="btn-check" type="radio" id="bathrooms-4" name="bathrooms">
                    <label class="btn btn-outline-secondary fw-normal" for="bathrooms-4">4</label>
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6 pt-1">Square metres</h3>
                  <div class="d-flex align-items-center">
                    <input class="form-control w-100" type="number" min="20" max="500" step="10" placeholder="Min">
                    <div class="mx-2">&mdash;</div>
                    <input class="form-control w-100" type="number" min="20" max="500" step="10" placeholder="Max">
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6">Amenities</h3>
                  <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="air-condition" checked>
                      <label class="form-check-label fs-sm" for="air-condition">Air conditioning</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="balcony">
                      <label class="form-check-label fs-sm" for="balcony">Balcony</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="garage" checked>
                      <label class="form-check-label fs-sm" for="garage">Garage</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="gym">
                      <label class="form-check-label fs-sm" for="gym">Gym</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="parking">
                      <label class="form-check-label fs-sm" for="parking">Parking</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="pool">
                      <label class="form-check-label fs-sm" for="pool">Pool</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="camera">
                      <label class="form-check-label fs-sm" for="camera">Security cameras</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="wifi" checked>
                      <label class="form-check-label fs-sm" for="wifi">WiFi</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="laundry">
                      <label class="form-check-label fs-sm" for="laundry">Laundry</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" id="dishwasher">
                      <label class="form-check-label fs-sm" for="dishwasher">Dishwasher</label>
                    </div>
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6">Pets</h3>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="allow-cats">
                    <label class="form-check-label fs-sm" for="allow-cats">Cats allowed</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="allow-dogs">
                    <label class="form-check-label fs-sm" for="allow-dogs">Dogs allowed</label>
                  </div>
                </div>
                <div class="pb-4 mb-2">
                  <h3 class="h6">Additional options</h3>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="verified">
                    <label class="form-check-label fs-sm" for="verified">Verified</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="featured">
                    <label class="form-check-label fs-sm" for="featured">Featured</label>
                  </div>
                </div>
                <div class="border-top py-4">
                  <button class="btn btn-outline-primary" type="button"><i class="fi-rotate-right me-2"></i>Reset filters</button>
                </div>
              </div>
            </div>
          </aside>
          <!-- Page content-->
          <div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-4 px-3 px-xl-4 px-xxl-5">
            <!-- Map popup-->
            <div class="map-popup invisible" id="map">
              <button class="btn btn-icon btn-light btn-sm shadow-sm rounded-circle" type="button" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-x fs-xs"></i></button>
              <div class="interactive-map" data-map-options-json="json/map-options-real-estate-rent.json"></div>
            </div>
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">명소</li>
              </ol>
            </nav>
            <!-- Title-->
            <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
              <h1 class="h2 mb-sm-0">명소</h1><a class="d-inline-block fw-bold text-decoration-none py-1" href="#" data-bs-toggle-class="invisible" data-bs-target="#map"><i class="fi-map me-2"></i>Map view</a>
            </div>
            <!-- Sorting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
              <div class="d-flex align-items-center flex-shrink-0">
                <label class="fs-sm me-2 pe-1 text-nowrap" for="sortby"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>Sort by:</label>
                <select class="form-select form-select-sm" id="sortby">
                  <option>Newest</option>
                  <option>Popularity</option>
                  <option>Low - High Price</option>
                  <option>High - Low Price</option>
                  <option>High rating</option>
                  <option>Average Rating</option>
                </select>
              </div>
              <hr class="d-none d-sm-block w-100 mx-4">
              <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${listCount } results</span></div>
            </div>
            <!-- Articles list-->
          <div class="col-lg-12">
            <!-- Catalog grid-->
            <div class="row g-4 py-4">
            
            <!-- Article-->
              <c:forEach var="place" items="${placeList }">
              <article class="card card-horizontal border-0 mb-4"><a class="card-img-top position-relative rounded-3 me-sm-4 mb-sm-0 mb-3" href="placeDetail" style="background-image: url(img/city-guide/blog/06.jpg);"><span class="badge bg-info position-absolute top-0 end-0 m-3 fs-sm">New</span></a>
                <div class="card-body px-0 pt-0 pb-lg-5 pb-sm-4 pb-2"><a class="fs-sm text-uppercase text-decoration-none" href="#">${place.place_type } / ${place.place_act }</a>
                  <h3 class="h5 pt-1 mb-2"><a class="nav-link" href="placeDetail">${place.place_name }</a></h3>
                  <p class="fs-sm text-muted">${place.place_content }</p><a class="d-flex align-items-center text-decoration-none" href="#">
                      <h6 class="fs-sm text-nav lh-base mb-1"></h6>
                    <div class="ps-2">
                      <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>${place.place_hour }</span><span><i class="fi-star opacity-70 mt-n1 me-1 align-middle"></i>${place.place_rate }</span></div>
                    </div></a>
                </div>
              </article>
              </c:forEach>
           </div>
           
            <!-- Pagination-->
            <c:if test="${listCount > 0 }">
            <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
              <ul class="pagination mb-1">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 10</span></li>
                
				<!-- 이전 블럭 -->
                <c:if test="${startPage > 10 }">
                <li class="page-item"><a class="page-link" href="placeList?page=${startPage-10 }" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
                </c:if>
                
                <!-- 1 페이지 -->
                <c:if test="${page != 1 && startPage != 1}">
                <li class="page-item d-none d-sm-block"><a class="page-link" href="placeList?page=1">1</a></li>
                <li class="page-item d-none d-sm-block">...</li>
                </c:if>
                
                <!-- 블럭 당 페이지 출력 -->
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${i == page }">
                <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">${i}<span class="visually-hidden">(current)</span></span></li>
                </c:if>
                <c:if test="${i != page}">
                <li class="page-item d-none d-sm-block"><a class="page-link" href="placeList?page=${i}">${i}</a></li>
                </c:if>
                </c:forEach>
                
                <!-- 마지막 페이지 -->
                <c:if test="${endPage != pageCount}">
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="placeList?page=${pageCount}">${pageCount}</a></li>
                </c:if>
                
                <!-- 다음 블럭 -->
                <c:if test="${endPage < pageCount}">
                <li class="page-item"><a class="page-link" href="placeList?page=${startPage+10 }" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                </c:if>
                
              </ul>
            </nav>
            </c:if>
            
          </div>
        </div>
      </div>
    </main>
    <!-- Footer-->
    <footer class="footer bg-secondary pt-5">
      <div class="container pt-lg-4 pb-4">
        <!-- Links-->
        <div class="row mb-5 pb-md-3 pb-lg-4">
          <div class="col-lg-6 mb-lg-0 mb-4">
            <div class="d-flex flex-sm-row flex-column justify-content-between mx-n2">
              <div class="mb-sm-0 mb-4 px-2"><a class="d-inline-block mb-4" href="real-estate-home-v1.html"><img src="img/logo/logo-dark.svg" width="116" alt="logo"></a>
                <ul class="nav flex-column mb-sm-4 mb-2">
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="mailto:example@email.com"><i class="fi-mail mt-n1 me-2 align-middle opacity-70"></i>example@email.com</a></li>
                  <li class="nav-item"><a class="nav-link p-0 fw-normal" href="tel:4065550120"><i class="fi-device-mobile mt-n1 me-2 align-middle opacity-70"></i>(406) 555-0120</a></li>
                </ul>
                <div class="pt-2"><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-viber"></i></a><a class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle me-2 mb-2" href="#"><i class="fi-telegram"></i></a></div>
              </div>
              <div class="mb-sm-0 mb-4 px-2">
                <h4 class="h5">Quick Links</h4>
                <ul class="nav flex-column">
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Buy a property</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Sell a property</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Rent a property</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Сalculate  your property</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Top offers</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Top cities</a></li>
                </ul>
              </div>
              <div class="px-2">
                <h4 class="h5">About</h4>
                <ul class="nav flex-column">
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">About Us</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Our agents</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Help &amp; support</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">Contacts</a></li>
                  <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal" href="#">News</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-xl-5 col-lg-6 offset-xl-1">
            <h4 class="h5">Recent Posts</h4>
            <article class="d-flex align-items-start" style="max-width: 640px;"><a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="img/real-estate/blog/th01.jpg" width="100" alt="Blog post"></a>
              <div>
                <h6 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Home improvement</h6>
                <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Your Guide to a Smart Apartment Searching</a></h5>
                <p class="mb-2 fs-sm">Mi justo, varius vitae cursus ipsum sem massa amet pellentesque. Ipsum enim sit nulla ridiculus semper nam...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Dec 4</a><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>2 comments</a>
              </div>
            </article>
            <hr class="text-dark opacity-10 my-4">
            <article class="d-flex align-items-start" style="max-width: 640px;"><a class="d-none d-sm-block flex-shrink-0 me-sm-4 mb-sm-0 mb-3" href="real-estate-blog-single.html"><img class="rounded-3" src="img/real-estate/blog/th02.jpg" width="100" alt="Blog post"></a>
              <div>
                <h6 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Tips &amp; advice</h6>
                <h5 class="mb-2 fs-base"><a class="nav-link" href="real-estate-blog-single.html">Top 10 Ways to Refresh Your Space</a></h5>
                <p class="mb-2 fs-sm">Volutpat, orci, vitae arcu feugiat vestibulum ultricies nisi, aenean eget. Vitae enim, tellus tempor consequat mi vitae...</p><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-calendar mt-n1 me-1 fs-sm align-middle opacity-70"></i>Nov 23</a><a class="nav-link nav-link-muted d-inline-block me-3 p-0 fs-xs fw-normal" href="#"><i class="fi-chat-circle mt-n1 me-1 fs-sm align-middle opacity-70"></i>No comments</a>
              </div>
            </article>
          </div>
        </div>
        <div class="text-center fs-sm pt-4 mt-3 pb-2">&copy; All rights reserved. Made by <a href='https://createx.studio/' class='d-inline-block nav-link p-0' target='_blank' rel='noopener'>Createx Studio</a></div>
      </div>
    </footer>
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