<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

 		  <script src="http://code.jquery.com/jquery-latest.js"></script>
          <script type="text/javascript">
	       	   function foodFilterPage(page) {
		   		   event.preventDefault();
		   		
		   		   $.ajax({
		   				   url : 'foodFilterPage?page='+ page,
		   				   type : 'post',
		   				   data : $('#foodForm').serializeArray(),
		   				   success : function(data) {
		   					   $('#foodAsync').html(data);
		   				   }				
		   		   });
	   		   };
          </script>
          
		  <!-- Breadcrumb-->
          <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="main">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">식당</li>
            </ol>
          </nav>
          <!-- Title-->
          <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
            <h1 class="h2 mb-sm-0">식당</h1>
          </div>
          <!-- Counting -->
          <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
            <hr class="d-none d-sm-block w-100 mx-4">
            <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-check-circle me-2"></i><span class="fs-sm mt-n1">${listCount } results</span></div>
          </div>
          <!-- Articles list-->
          <div class="col-lg-12">
            <!-- Catalog grid-->
            <div class="row g-4 py-4">
            <c:if test="${empty foodList }">
			<div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
			  <h1 class="h2 mb-sm-0">검색결과가 존재하지 않습니다.</h1>
			</div>
		    </c:if>
		    <!-- Article-->
            <c:forEach var="food" items="${foodList }" varStatus="status">
              <article class="card card-horizontal border-0 mb-4">
                <a class="card-img-top position-relative rounded-3 me-sm-4 mb-sm-0 mb-3" href="foodDetail?food_id=${food.food_id}&page=${page}&state=cont">
                <c:forTokens var="photo" items="${food.food_photo}" delims="," begin="0" end="0">
                <div><img class="rounded-3" src="upload/${photo}" alt="Image" style="width: 560px; height: 220px;"/></div>
                </c:forTokens>
                <span class="badge bg-info position-absolute top-0 end-0 m-3 fs-sm"></span></a>
                <div class="card-body px-0 pt-0 pb-lg-5 pb-sm-4 pb-2"><a class="fs-sm text-uppercase text-decoration-none" href="#">${food.food_feat } / ${food.food_type }</a>
                  <h3 class="h5 pt-1 mb-2"><a class="nav-link" href="foodDetail?food_id=${food.food_id}&page=${page}&state=cont">${food.food_name }</a></h3>
                  <p class="fs-sm text-muted">${food.food_content }</p>
                  <a class="d-flex align-items-center text-decoration-none" href="#">
                    <div class="ps-2">
                      <div class="d-flex text-body fs-xs">
                   		<span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>${food.food_hour}</span>
                        <span><i class="fi-star opacity-70 mt-n1 me-1 align-middle"></i>${food.food_rate }점</span>
                      </div><br>
                   	  <div class="d-flex text-body fs-xs">
                   		<span class="me-2 pe-1"><i class="fi-map opacity-70 mt-n1 me-1 align-middle"></i>${food.food_addr }</span>
                   		<span class="me-2 pe-1"><i class="fi-credit-card opacity-70 mt-n1 me-1 align-middle"></i>₩${food.food_cost }</span>
                      </div>
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
				<!-- Previous block -->
                <c:if test="${startPage > 10 }">
                <li class="page-item"><a class="page-link" onclick="foodFilterPage(${startPage-10 })" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
                </c:if>
                <!-- First page -->
                <c:if test="${page != 1 && startPage != 1}">
                <li class="page-item d-none d-sm-block"><a class="page-link" onclick="foodFilterPage(1)">1</a></li>
                <li class="page-item d-none d-sm-block">...</li>
                </c:if>
                <!-- Pages for each block -->
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                <c:if test="${i == page }">
                <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">${i}<span class="visually-hidden">(current)</span></span></li>
                </c:if>
                <c:if test="${i != page}">
                <li class="page-item d-none d-sm-block"><a class="page-link" onclick="foodFilterPage(${i})">${i}</a></li>
                </c:if>
                </c:forEach>
                <!-- Last page -->
                <c:if test="${page != pageCount}">
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" onclick="foodFilterPage(${pageCount})">${pageCount}</a></li>
                </c:if>
                <!-- Next block -->
                <c:if test="${endPage < pageCount}">
                <li class="page-item"><a class="page-link" onclick="foodFilterPage(${startPage+10 })" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                </c:if>
              </ul>
            </nav>
            </c:if>
          </div>