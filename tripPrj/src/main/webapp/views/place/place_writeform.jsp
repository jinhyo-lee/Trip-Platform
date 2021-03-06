<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Place Write</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="func/place_write.js"></script>
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
          <form enctype="multipart/form-data" action="placeWrite" method="post">
          <div class="col-lg-8">
            <!-- Breadcrumb-->
            <nav class="mb-3 pt-2 pt-lg-3" aria-label="Breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main">???</a></li>
                <li class="breadcrumb-item active" aria-current="page">??????</li>
              </ol>
            </nav>
            <!-- Title-->
            <div class="mb-4">
              <h1 class="h2 mb-0">?????? ??? ??????</h1>
            </div>
            <!-- Basic info-->
            <section class="card card-body border-0 shadow-sm p-4 mb-4" id="basic-info">
              <h2 class="h4 mb-4"><i class="fi-info-circle text-primary fs-5 mt-n1 me-2"></i>??????</h2>
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-title">?????? ?????? <span class="text-danger">*</span></label>
                  <input class="form-control" type="text" id="place_name" name="place_name" placeholder="?????? ????????? ???????????????" required><span class="form-text"></span>
                </div>
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-subcategory">??????<span class="text-danger">*</span></label>
                  <select class="form-select" id="place_act" name="place_act" required>
                    <option value="" disabled>????????? ???????????????</option>
                    <option value="????????????">????????????</option>
                    <option value="????????????">????????????</option>
                    <option value="??????">??????</option>
                    <option value="?????????">?????????</option>
                    <option value="??????">??????</option>
                    <option value="??????">??????</option>
                  </select>
                </div>
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-subcategory">?????? ??????<span class="text-danger">*</span></label>
                  <select class="form-select" id="place_type" name="place_type" required>
                    <option value="" disabled>?????? ????????? ???????????????</option>
                    <option value="??????">??????</option>
                    <option value="??????">??????</option>
                    <option value="?????????">?????????</option>
                    <option value="?????????">?????????</option>
                    <option value="????????????">????????????</option>
                    <option value="?????????">?????????</option>
                    <option value="??????????????????">??????????????????</option>
                    <option value="?????????">?????????</option>
                    <option value="????????????">????????????</option>
                    <option value="??????">??????</option>
                  </select>
                </div>
            	<!-- Contacts-->
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-phone">????????? <span class="text-danger">*</span></label>
                  <input class="form-control" type="tel" id="place_tel" name="place_tel" placeholder="???????????? ???????????????" required>
                </div>
                <div class="col-sm-6 mb-3">
                  <label class="form-label" for="ab-title">?????? <span class="text-danger">*</span></label>
                  <input class="form-control" type="text" id="place_addr" name="place_addr" placeholder="????????? ???????????????" required>
                </div>
                <!-- Content-->
                <label class="form-label" for="ab-description">??????<span class="text-danger">*</span></label>
                <div class="row mb-4">
                  <div class="col-md-9 mb-md-0 mb-3">
                    <textarea class="form-control" id="place_content" name="place_content" rows="6" placeholder="????????? ???????????????">????????????, ????????????</textarea><span class="form-text"></span>
                  </div>
                </div>
                <!-- Hour-->
                <div class="col-sm-6 mb-3">
                 <label class="form-label" for="ab-subcategory">????????????<span class="text-danger">*</span></label>
                 <div class="input-group" >
                   <input class="form-control" id="open" name="open" type="time" value="06:00">
                   <input class="form-control" id="close" name="close" type="time" value="09:00">                 
                </div>
               </div>
            </section>
            <!-- Photos-->
            <section class="card card-body border-0 shadow-sm p-4 mb-4" enctype="multipart/form-data" >
              <h2 class="h4 mb-4"><i class="fi-image text-primary fs-5 mt-n1 me-2"></i>?????? / ??????</h2>
              <div class="alert alert-info mb-4" role="alert">
                <div class="d-flex"><i class="fi-alert-circle me-2 me-sm-3"></i>
                  <p class="fs-sm mb-1">??????????????? ?????? 10MB?????? ????????? ????????????,<br>?????? ????????? jpg, gif, png, jpeg ????????? ????????? ???????????????.</p>
                </div>
              </div>
              <input type="file" id="placePhotos" name="placePhotos" multiple>
            </section>
            <div class="d-sm-flex justify-content-between pt-2">
              <button class="btn btn-primary btn-lg d-block rounded-pill mb-2" type="submit">????????????</button>
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