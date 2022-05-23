<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Main Page</title>
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
    <link rel="stylesheet" media="screen" href="vendor/tiny-slider/dist/tiny-slider.css"/>
    <link rel="stylesheet" media="screen" href="vendor/flatpickr/dist/flatpickr.min.css"/>
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
      <div class="modal fade" id="signin-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
          <div class="modal-content">
            <div class="modal-body px-0 py-2 py-sm-0">
              <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
              <div class="row mx-0 align-items-center">
                <div class="col-md-6 border-end-md p-4 p-sm-5">
                  <h2 class="h3 mb-4 mb-sm-5">Hey there!<br>Welcome back.</h2><img class="d-block mx-auto" src="img/signin-modal/signin.svg" width="344" alt="Illustartion">
                  <div class="mt-4 mt-sm-5">Don't have an account? <a href="#signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">Sign up here</a></div>
                </div>
                <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5"><a class="btn btn-outline-info rounded-pill w-100 mb-3" href="#"><i class="fi-google fs-lg me-1"></i>Sign in with Google</a><a class="btn btn-outline-info rounded-pill w-100 mb-3" href="#"><i class="fi-facebook fs-lg me-1"></i>Sign in with Facebook</a>
                  <div class="d-flex align-items-center py-3 mb-3">
                    <hr class="w-100">
                    <div class="px-3">Or</div>
                    <hr class="w-100">
                  </div>
                  <form class="needs-validation" novalidate>
                    <div class="mb-4">
                      <label class="form-label mb-2" for="signin-email">Email address</label>
                      <input class="form-control" type="email" id="signin-email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-4">
                      <div class="d-flex align-items-center justify-content-between mb-2">
                        <label class="form-label mb-0" for="signin-password">Password</label><a class="fs-sm" href="#">Forgot password?</a>
                      </div>
                      <div class="password-toggle">
                        <input class="form-control" type="password" id="signin-password" placeholder="Enter password" required>
                        <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                      </div>
                    </div>
                    <button class="btn btn-primary btn-lg rounded-pill w-100" type="submit">Sign in</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Sign Up Modal-->
      <div class="modal fade" id="signup-modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
          <div class="modal-content">
            <div class="modal-body px-0 py-2 py-sm-0">
              <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
              <div class="row mx-0 align-items-center">
                <div class="col-md-6 border-end-md p-4 p-sm-5">
                  <h2 class="h3 mb-4 mb-sm-5">Join Finder.<br>Get premium benefits:</h2>
                  <ul class="list-unstyled mb-4 mb-sm-5">
                    <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Add and promote your listings</span></li>
                    <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Easily manage your wishlist</span></li>
                    <li class="d-flex mb-0"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>Leave reviews</span></li>
                  </ul><img class="d-block mx-auto" src="img/signin-modal/signup.svg" width="344" alt="Illustartion">
                  <div class="mt-sm-4 pt-md-3">Already have an account? <a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal">Sign in</a></div>
                </div>
                <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5"><a class="btn btn-outline-info rounded-pill w-100 mb-3" href="#"><i class="fi-google fs-lg me-1"></i>Sign in with Google</a><a class="btn btn-outline-info rounded-pill w-100 mb-3" href="#"><i class="fi-facebook fs-lg me-1"></i>Sign in with Facebook</a>
                  <div class="d-flex align-items-center py-3 mb-3">
                    <hr class="w-100">
                    <div class="px-3">Or</div>
                    <hr class="w-100">
                  </div>
                  <form class="needs-validation" novalidate>
                    <div class="mb-4">
                      <label class="form-label" for="signup-name">Full name</label>
                      <input class="form-control" type="text" id="signup-name" placeholder="Enter your full name" required>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="signup-email">Email address</label>
                      <input class="form-control" type="email" id="signup-email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="signup-password">Password <span class='fs-sm text-muted'>min. 8 char</span></label>
                      <div class="password-toggle">
                        <input class="form-control" type="password" id="signup-password" minlength="8" required>
                        <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                      </div>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="signup-password-confirm">Confirm password</label>
                      <div class="password-toggle">
                        <input class="form-control" type="password" id="signup-password-confirm" minlength="8" required>
                        <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                      </div>
                    </div>
                    <div class="form-check mb-4">
                      <input class="form-check-input" type="checkbox" id="agree-to-terms" required>
                      <label class="form-check-label" for="agree-to-terms">By joining, I agree to the <a href='#'>Terms of use</a> and <a href='#'>Privacy policy</a></label>
                    </div>
                    <button class="btn btn-primary btn-lg rounded-pill w-100" type="submit">Sign up</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Navbar-->
      <header class="navbar navbar-expand-lg navbar-light fixed-top" data-scroll-header>
        <div class="container"><a class="navbar-brand me-3 me-xl-4" href="#"><img class="d-block" src="img/logo/logo-dark.svg" width="116" alt="Finder"></a>
          <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button><a class="btn btn-sm text-primary d-none d-lg-block order-lg-3" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>Sign in</a>
          <div class="collapse navbar-collapse order-lg-2" id="navbarNav">
            <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">
              <!-- Menu items-->
              <li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Home</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="city-guide-home-v1.html">Homepage v.1</a></li>
                  <li><a class="dropdown-item" href="city-guide-home-v2.html">Homepage v.2</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Catalog</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="city-guide-catalog.html">Grid with Filters</a></li>
                  <li><a class="dropdown-item" href="city-guide-single.html">Single Place - Gallery</a></li>
                  <li><a class="dropdown-item" href="city-guide-single-info.html">Single Place - Info</a></li>
                  <li><a class="dropdown-item" href="city-guide-single-reviews.html">Single Place - Reviews</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="city-guide-account-info.html">Personal Info</a></li>
                  <li><a class="dropdown-item" href="city-guide-account-favorites.html">Favorites</a></li>
                  <li><a class="dropdown-item" href="city-guide-account-reviews.html">Reviews</a></li>
                  <li><a class="dropdown-item" href="city-guide-account-notifications.html">Notifications</a></li>
                  <li><a class="dropdown-item" href="signin-light.html">Sign In</a></li>
                  <li><a class="dropdown-item" href="signup-light.html">Sign Up</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Vendor</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="city-guide-add-business.html">Add Business</a></li>
                  <li><a class="dropdown-item" href="city-guide-business-promotion.html">Business Promotion</a></li>
                  <li><a class="dropdown-item" href="city-guide-vendor-businesses.html">My Businesses</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="city-guide-about.html">About</a></li>
                  <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="city-guide-blog.html">Blog Grid</a></li>
                      <li><a class="dropdown-item" href="city-guide-blog-single.html">Single Post</a></li>
                    </ul>
                  </li>
                  <li><a class="dropdown-item" href="city-guide-contacts.html">Contacts</a></li>
                  <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Help Center</a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="city-guide-help-center.html">Help Topics</a></li>
                      <li><a class="dropdown-item" href="city-guide-help-center-single-topic.html">Single Topic</a></li>
                    </ul>
                  </li>
                  <li><a class="dropdown-item" href="city-guide-404.html">404 Not Found</a></li>
                </ul>
              </li>
              <li class="nav-item d-lg-none"><a class="nav-link" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>Sign in</a></li>
            </ul>
          </div>
        </div>
      </header>
      <!-- Page content-->
      <!-- Hero-->
      <section class="container py-5 mt-5 mb-lg-3">
        <div class="row align-items-center mt-md-2">
          <div class="col-lg-7 order-lg-2 mb-lg-0 mb-4 pb-2 pb-lg-0"><img class="d-block mx-auto" src="img/city-guide/home/hero-img.jpg" width="746" alt="Hero image"></div>
          <div class="col-lg-5 order-lg-1 pe-lg-0">
            <h1 class="display-5 mb-4 me-lg-n5 text-lg-start text-center mb-4">Start exploring <span class="dropdown d-inline-block"><a class="dropdown-toggle text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Berlin</a><span class="dropdown-menu dropdown-menu-end my-1"><a class="dropdown-item fs-base fw-bold" href="#">Hamburg</a><a class="dropdown-item fs-base fw-bold" href="#">Munich</a><a class="dropdown-item fs-base fw-bold" href="#">Frankfurt am Main</a><a class="dropdown-item fs-base fw-bold" href="#">Stuttgart</a><a class="dropdown-item fs-base fw-bold" href="#">Cologne</a></span></span></h1>
            <p class="text-lg-start text-center mb-4 mb-lg-5 fs-lg">Find great places to stay, eat, shop, or visit from our partners and local experts.</p>
            <!-- Search form-->
            <div class="me-lg-n5">
              <form class="form-group d-block d-md-flex position-relative rounded-md-pill me-lg-n5">
                <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                  <input class="form-control" type="text" placeholder="What are you looking for?">
                </div>
                <hr class="d-md-none my-2">
                <div class="d-sm-flex">
                  <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                    <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2"></i><span class="dropdown-toggle-label">All categories</span></button>
                    <input type="hidden">
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#"><i class="fi-bed fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Accomodation</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-cafe fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Food &amp; Drink</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-shopping-bag fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Shopping</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-museum fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Art &amp; History</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-entertainment fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Entertainment</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-meds fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Medicine</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-makeup fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Beauty</span></a></li>
                      <li><a class="dropdown-item" href="#"><i class="fi-car fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">Car Rental</span></a></li>
                    </ul>
                  </div>
                  <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button">Search</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      
      <!-- 명소 -->
      <section class="container mb-sm-5 mb-4 pb-lg-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-4 pb-2">
          <h2 class="h3 mb-sm-0">명소</h2><a class="btn btn-link fw-normal ms-sm-3 p-0" href="placeList">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside">
          <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 3, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1400&quot;:{&quot;items&quot;:3,&quot;nav&quot;:false}}}">
            <!-- Item-->
            <c:forEach var="place" items="${placeList }">
            <article><a class="d-block rounded-3 overflow-hidden" href="detail_page.html"><img class="d-block" src="img/car-finder/blog/05.jpg" alt="Image"></a>
              <div class="py-3"><a class="fs-xs text-uppercase text-decoration-none" href="#">${place.place_act}</a>
                <h3 class="fs-base pt-1"><a class="nav-link" href="car-finder-blog-single.html">${place.place_name}</a></h3>
                  <div class="ps-2">
                    <h6 class="fs-sm lh-base mb-1"><i class="fi-map-pin me-1"></i>${place.place_addr}</h6>
                    <div class="d-flex fs-xs opacity-60"><span class="me-2 pe-1"><i class="fi-alarm me-1"></i>${place.place_hour}</span><span><i class="fi-star me-1"></i>${place.place_rate}</span></div>
                  </div>
              </div>
            </article>
            </c:forEach>
          </div>
        </div>
      </section>
      
      <!-- 식당 -->
      <section class="container mb-sm-5 mb-4 pb-lg-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-4 pb-2">
          <h2 class="h3 mb-sm-0">식당</h2><a class="btn btn-link fw-normal ms-sm-3 p-0" href="foodList">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <!-- Carousel-->
        <div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush mx-n2">
          <div class="tns-carousel-inner row gx-4 mx-0" data-carousel-options="{&quot;nav&quot;: false, &quot;autoHeight&quot;: true, &quot;controlsContainer&quot;: &quot;#carousel-controls-tp&quot;, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;1320&quot;:{&quot;items&quot;:2}}}">
            <!-- Carousel item-->
            <c:set var="food" value="${foodList }"/>
            <div class="col">
              <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                <div class="col-md-7"><a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/top-properties/01.jpg); min-height: 18.75rem;"><span class="img-gradient-overlay"></span>
                    <div class="card-body content-overlay pb-0"></div>
                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                      <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                        <div class="pe-2">
                          <div class="fs-sm text-uppercase pt-2 mb-1">${food[0].food_feat}</div>
                          <h3 class="h5 text-light mb-1">${food[0].food_name}</h3>
                          <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[0].food_addr}</div>
                        </div>
                      </div>
                    </div></a></div>
                <div class="col-md-5"><a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/02.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[1].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[1].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[1].food_addr}</div>
                      </div>
                    </div></a><a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/03.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[2].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[2].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[2].food_addr}</div>
                      </div>
                    </div></a></div>
              </div>
            </div>
            <!-- Carousel item-->
            <div class="col">
              <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                <div class="col-md-7"><a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/top-properties/04.jpg); min-height: 18.75rem;"><span class="img-gradient-overlay"></span>
                    <div class="card-body content-overlay pb-0"></div>
                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                      <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                        <div class="pe-2">
                          <div class="fs-sm text-uppercase pt-2 mb-1">${food[3].food_feat}</div>
                          <h3 class="h5 text-light mb-1">${food[3].food_name}</h3>
                          <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[3].food_addr}</div>
                        </div>
                      </div>
                    </div></a></div>
                <div class="col-md-5"><a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/05.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[4].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[4].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[4].food_addr}</div>
                      </div>
                    </div></a><a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/06.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[5].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[5].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[5].food_addr}</div>
                      </div>
                    </div></a></div>
              </div>
            </div>
            <!-- Carousel item-->
            <div class="col">
              <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                <div class="col-md-7"><a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/top-properties/07.jpg); min-height: 18.75rem;"><span class="img-gradient-overlay"></span>
                    <div class="card-body content-overlay pb-0"></div>
                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                      <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                        <div class="pe-2">
                          <div class="fs-sm text-uppercase pt-2 mb-1">${food[6].food_feat}</div>
                          <h3 class="h5 text-light mb-1">${food[6].food_name}</h3>
                          <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[6].food_addr}</div>
                        </div>
                      </div>
                    </div></a></div>
                <div class="col-md-5"><a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/08.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[7].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[7].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[7].food_addr}</div>
                      </div>
                    </div></a><a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/09.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[8].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[8].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[8].food_addr}</div>
                      </div>
                    </div></a></div>
              </div>
            </div>
             <!-- Carousel item-->
            <div class="col">
              <div class="row gy-md-0 gy-sm-4 gy-3 gx-sm-4 gx-0">
                <div class="col-md-7"><a class="text-decoration-none text-light card bg-size-cover bg-position-center border-0 overflow-hidden h-100" href="real-estate-single-v1.html" style="background-image: url(img/real-estate/top-properties/07.jpg); min-height: 18.75rem;"><span class="img-gradient-overlay"></span>
                    <div class="card-body content-overlay pb-0"></div>
                    <div class="card-footer content-overlay border-0 pt-0 pb-4">
                      <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                        <div class="pe-2">
                          <div class="fs-sm text-uppercase pt-2 mb-1">${food[9].food_feat}</div>
                          <h3 class="h5 text-light mb-1">${food[9].food_name}</h3>
                          <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[9].food_addr}</div>
                        </div>
                      </div>
                    </div></a></div>
                <div class="col-md-5"><a class="card border-0 overflow-hidden mb-sm-4 mb-3 text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/08.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[10].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[10].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[10].food_addr}</div>
                      </div>
                    </div></a><a class="card border-0 overflow-hidden text-decoration-none text-light" href="real-estate-single-v2.html">
                    <div class="card-body p-0 position-relative"><img src="img/real-estate/top-properties/09.jpg" alt="Article image"><span class="img-gradient-overlay zindex-1"></span>
                      <div class="position-absolute start-0 bottom-0 m-n1 p-4 zindex-5">
                        <div class="fs-sm text-uppercase pt-2 mb-1">${food[11].food_feat}</div>
                        <h3 class="h5 text-light mb-1">${food[11].food_name}</h3>
                        <div class="fs-sm opacity-70"><i class="fi-map-pin me-1"></i>${food[11].food_addr}</div>
                      </div>
                    </div></a></div>
              </div>
            </div>
          </div>
        </div>
        <!-- Carousel custom controls-->
        <div class="tns-carousel-controls justify-content-center pt-md-2 mt-4" id="carousel-controls-tp">
          <button class="me-3" type="button" aria-controls="tns2"><i class="fi-chevron-left fs-xs"></i></button>
          <button type="button" aria-controls="tns2"><i class="fi-chevron-right fs-xs"></i></button>
        </div>
      </section>
 
      <!-- 숙소 -->
      <section class="container mb-5 pb-md-4">
        <div class="d-flex align-items-center justify-content-between mb-3">
          <h2 class="h3 mb-0">숙소</h2><a class="btn btn-link fw-normal p-0" href="roomList">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
          <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
            <!-- Item-->
            <c:forEach var="room" items="${roomList }">
            <div class="col">
              <div class="card shadow-sm card-hover border-0 h-100">
                <div class="card-img-top card-img-hover"><a class="img-overlay" href="real-estate-single-v1.html"></a>
                  <div class="position-absolute start-0 top-0 pt-3 ps-3"><span class="d-table badge bg-success mb-1">Verified</span><span class="d-table badge bg-info">New</span></div>
                  <div class="content-overlay end-0 top-0 pt-3 pe-3">
                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                  </div><img src="img/real-estate/catalog/01.jpg" alt="Image">
                </div>
                <div class="card-body position-relative pb-3">
                  <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">${room.room_type }</h4>
                  <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${room.room_name }</a></h3>
                  <p class="mb-2 fs-sm text-muted">${room.room_addr }</p>
                  <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i>₩ ${room.room_cost }</div>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap"><span class="d-inline-block mx-1 px-2 fs-sm"><i class="fi-info-circle ms-1 mt-n1 fs-lg text-muted"></i>&nbsp;${room.room_option }</span></div>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
      </section>

      <!-- Categories-->
      <section class="container d-flex flex-wrap flex-column flex-sm-row pb-5 mb-md-3"><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4" href="city-guide-catalog.html">
        <div class="icon-box-media bg-faded-accent text-accent rounded-circle me-2"><i class="fi-bed"></i></div>
        <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">Accommodation</h3></a><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4" href="city-guide-catalog.html">
        <div class="icon-box-media bg-faded-warning text-warning rounded-circle me-2"><i class="fi-cafe"></i></div>
        <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">Food &amp; Drink</h3></a><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4" href="city-guide-catalog.html">
        <div class="icon-box-media bg-faded-primary text-primary rounded-circle me-2"><i class="fi-shopping-bag"></i></div>
        <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">Shopping</h3></a><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4" href="city-guide-catalog.html">
        <div class="icon-box-media bg-faded-success text-success rounded-circle me-2"><i class="fi-museum"></i></div>
        <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">Art &amp; History</h3></a><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4 mb-2 mb-sm-3 me-sm-3 me-xxl-4" href="city-guide-catalog.html">
        <div class="icon-box-media bg-faded-primary text-primary rounded-circle me-2"><i class="fi-entertainment"></i></div>
        <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">Entertainment</h3></a>
      <div class="dropdown mb-2 mb-sm-3"><a class="icon-box card flex-row align-items-center flex-shrink-0 card-hover border-0 shadow-sm rounded-pill py-2 ps-2 pe-4" href="#" data-bs-toggle="dropdown">
          <div class="icon-box-media bg-faded-info text-info rounded-circle me-2"><i class="fi-dots-horisontal"></i></div>
          <h3 class="icon-box-title fs-sm ps-1 pe-2 mb-0">More</h3></a>
        <div class="dropdown-menu dropdown-menu-sm-end my-1"><a class="dropdown-item fw-bold" href="city-guide-catalog.html"><i class="fi-meds fs-base opacity-60 me-2"></i>Medicine</a><a class="dropdown-item fw-bold" href="city-guide-catalog.html"><i class="fi-makeup fs-base opacity-60 me-2"></i>Beauty</a><a class="dropdown-item fw-bold" href="city-guide-catalog.html"><i class="fi-car fs-base opacity-60 me-2"></i>Car Rental</a><a class="dropdown-item fw-bold" href="city-guide-catalog.html"><i class="fi-dumbell fs-base opacity-60 me-2"></i>Fitness &amp; Sport</a><a class="dropdown-item fw-bold" href="city-guide-catalog.html"><i class="fi-disco-ball fs-base opacity-60 me-2"></i>Night Club</a></div>
      </div>
    </section>

      <!-- 지역 -->
      <section class="container mb-5 pb-2">
        <div class="d-flex align-items-center justify-content-between mb-3">
          <h2 class="h3 mb-0">지역</h2><a class="btn btn-link fw-normal ms-md-3 pb-0" href="real-estate-catalog-rent.html">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
          <div class="tns-carousel-inner row gx-4 mx-0 py-md-4 py-3" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
            <!-- Item-->
            <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/new-york.jpg" alt="New York">
                  <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                    <div class="w-100 p-1">
                      <div class="mb-2">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">893</span>
                        </div>
                      </div>
                      <div class="pt-1">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">3756</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body text-center">
                  <h3 class="mb-0 fs-base text-nav">New York</h3>
                </div></a></div>
            <!-- Item-->
            <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
                <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/chicago.jpg" alt="Chicago">
                  <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                    <div class="w-100 p-1">
                      <div class="mb-2">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 37%" aria-valuenow="37" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">268</span>
                        </div>
                      </div>
                      <div class="pt-1">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">1540</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body text-center">
                  <h3 class="mb-0 fs-base text-nav">Chicago</h3>
                </div></a></div>
            <!-- Item-->
            <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/los-angeles.jpg" alt="Los Angeles">
                  <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                    <div class="w-100 p-1">
                      <div class="mb-2">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">2750</span>
                        </div>
                      </div>
                      <div class="pt-1">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">692</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body text-center">
                  <h3 class="mb-0 fs-base text-nav">Los Angeles</h3>
                </div></a></div>
            <!-- Item-->
            <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-rent.html">
                <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/san-diego.jpg" alt="San Diego">
                  <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                    <div class="w-100 p-1">
                      <div class="mb-2">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">1739</span>
                        </div>
                      </div>
                      <div class="pt-1">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">1854</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body text-center">
                  <h3 class="mb-0 fs-base text-nav">San Diego</h3>
                </div></a></div>
            <!-- Item-->
            <div class="col"><a class="card shadow-sm card-hover border-0" href="real-estate-catalog-sale.html">
                <div class="card-img-top card-img-hover"><span class="img-overlay opacity-65"></span><img src="img/real-estate/city/dallas.jpg" alt="Dallas">
                  <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                    <div class="w-100 p-1">
                      <div class="mb-2">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-wallet mt-n1 me-2 fs-sm align-middle"></i>Property for sale</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">2567</span>
                        </div>
                      </div>
                      <div class="pt-1">
                        <h4 class="mb-2 fs-xs fw-normal text-light"><i class="fi-home mt-n1 me-2 fs-sm align-middle"></i>Property for rent</h4>
                        <div class="d-flex align-items-center">
                          <div class="progress progress-light w-100">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div><span class="text-light fs-sm ps-1 ms-2">1204</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body text-center">
                  <h3 class="mb-0 fs-base text-nav">Dallas</h3>
                </div></a></div>
          </div>
        </div>
      </section>

      <!-- 최근 본 목록-->
      <section class="container pb-5 mb-lg-4">
        <div class="d-flex align-items-center justify-content-between mb-4 pb-2">
          <h2 class="h3 mb-0">최근 본 목록</h2><a class="btn btn-link fw-normal ms-sm-3 p-0" href="city-guide-catalog.html">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside mb-xxl-2">
          <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 3, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1400&quot;:{&quot;items&quot;:3,&quot;nav&quot;:false}}}">
            <!-- Item-->
            <div>
              <div class="position-relative">
                <div class="position-relative mb-3">
                  <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button><img class="rounded-3" src="img/city-guide/catalog/09.jpg" alt="Article img">
                </div>
                <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="#">Repose Hotel</a></h3>
                <ul class="list-inline mb-0 fs-xs">
                  <li class="list-inline-item pe-1"><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>5.0</b><span class="text-muted">&nbsp;(48)</span></li>
                  <li class="list-inline-item pe-1"><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle"></i>$$</li>
                  <li class="list-inline-item pe-1"><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>1.4 km from center</li>
                </ul>
              </div>
            </div>
            <!-- Item-->
            <div>
              <div class="position-relative">
                <div class="position-relative mb-3">
                  <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button><img class="rounded-3" src="img/city-guide/catalog/05.jpg" alt="Article img">
                </div>
                <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="#">Leisure Inn</a></h3>
                <ul class="list-inline mb-0 fs-xs">
                  <li class="list-inline-item pe-1"><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>4.8</b><span class="text-muted">&nbsp;(24)</span></li>
                  <li class="list-inline-item pe-1"><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle"></i>$$$</li>
                  <li class="list-inline-item pe-1"><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>0.5 km from center</li>
                </ul>
              </div>
            </div>
            <!-- Item-->
            <div>
              <div class="position-relative">
                <div class="position-relative mb-3">
                  <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button><img class="rounded-3" src="img/city-guide/catalog/11.jpg" alt="Article img">
                </div>
                <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="#">Soothe &amp; Stay</a></h3>
                <ul class="list-inline mb-0 fs-xs">
                  <li class="list-inline-item pe-1"><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>4.9</b><span class="text-muted">&nbsp;(43)</span></li>
                  <li class="list-inline-item pe-1"><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle"></i>$$$</li>
                  <li class="list-inline-item pe-1"><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>1.8 km from center</li>
                </ul>
              </div>
            </div>
            <!-- Item-->
            <div>
              <div class="position-relative">
                <div class="position-relative mb-3">
                  <button class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-0 m-3 zindex-5" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button><img class="rounded-3" src="img/city-guide/catalog/04.jpg" alt="Article img">
                </div>
                <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="#">Merry Berry Motel</a></h3>
                <ul class="list-inline mb-0 fs-xs">
                  <li class="list-inline-item pe-1"><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b>4.5</b><span class="text-muted">&nbsp;(13)</span></li>
                  <li class="list-inline-item pe-1"><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle"></i>$$</li>
                  <li class="list-inline-item pe-1"><i class="fi-map-pin mt-n1 me-1 fs-base text-muted align-middle"></i>0.4 km from center</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>

    <!-- Footer-->
    <footer class="footer pt-lg-5 pt-4 bg-dark text-light">
      <div class="container mb-4 py-4 pb-lg-5">
        <div class="row gy-4">
          <div class="col-lg-3 col-md-6 col-sm-4">
            <div class="mb-4 pb-sm-3"><a class="d-inline-block" href="city-guide-home-v1.html"><img src="img/logo/logo-light.svg" width="116" alt="Logo"></a></div>
            <ul class="nav nav-light flex-column">
              <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal text-light text-nowrap" href="mailto:example@gmail.com"><i class="fi-mail mt-n1 me-1 align-middle text-primary"></i>example@gmail.com</a></li>
              <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal text-light text-nowrap" href="tel:4065550120"><i class="fi-device-mobile mt-n1 me-1 align-middle text-primary"></i>(406) 555-0120</a></li>
            </ul>
          </div>
          <!-- Links-->
          <div class="col-lg-2 col-md-3 col-sm-4">
            <h3 class="fs-base text-light">Quick links</h3>
            <ul class="list-unstyled fs-sm">
              <li><a class="nav-link-light" href="#">Top cities</a></li>
              <li><a class="nav-link-light" href="#">Accommodation</a></li>
              <li><a class="nav-link-light" href="#">Cafes &amp; restaurants</a></li>
              <li><a class="nav-link-light" href="#">Events</a></li>
            </ul>
          </div>
          <!-- Links-->
          <div class="col-lg-2 col-md-3 col-sm-4">
            <h3 class="fs-base text-light">Profile</h3>
            <ul class="list-unstyled fs-sm">
              <li><a class="nav-link-light" href="#">My account</a></li>
              <li><a class="nav-link-light" href="#">Favorites</a></li>
              <li><a class="nav-link-light" href="#">My listings</a></li>
              <li><a class="nav-link-light" href="#">Add listing</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="py-4 border-top border-light">
        <div class="container d-flex flex-column flex-lg-row align-items-center justify-content-between py-2">
          <!-- Copyright-->
          <p class="order-lg-1 order-2 fs-sm mb-2 mb-lg-0"><span class="text-light opacity-60">&copy; All rights reserved. Made by </span><a class="nav-link-light fw-bold" href="https://createx.studio/" target="_blank" rel="noopener">Createx Studio</a></p>
          <div class="d-flex flex-lg-row flex-column align-items-center order-lg-2 order-1 ms-lg-4 mb-lg-0 mb-4">
              <!-- Socials-->
              <div class="ms-4 ps-lg-2 text-nowrap"><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle ms-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle ms-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle ms-2" href="#"><i class="fi-telegram"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle ms-2" href="#"><i class="fi-messenger"></i></a></div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="vendor/flatpickr/dist/flatpickr.min.js"></script>
    <!-- Main theme script-->
    <script src="js/theme.min.js"></script>
  </body>
</html>