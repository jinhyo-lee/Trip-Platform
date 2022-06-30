<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

       <script src="http://code.jquery.com/jquery-latest.js"></script>
       <script type="text/javascript">
	       	function roomFilterPage(page) {
		   		event.preventDefault();
		   		
		   		$.ajax({
		   				url : 'roomFilterPage?page='+ page,
		   				type : 'post',
		   				data : $('#roomForm').serializeArray(),
		   				success : function(data) {
		   					$('#roomAsync').html(data);
		   				}				
		   		});
	   		};
       </script>
    
	   <!-- Breadcrumb-->
	   <nav class="mb-3 pt-md-2" aria-label="Breadcrumb">
	     <ol class="breadcrumb">
	       <li class="breadcrumb-item"><a href="city-guide-home-v1.html">Home</a></li>
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
	   <c:if test="${empty roomList }">
	   <div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
	     <h1 class="h2 mb-sm-0">검색결과가 존재하지 않습니다.</h1>
	   </div>
	   </c:if>
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
	             <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">${room.room_name }</a></h3>
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
	   <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination" id="pagination">
	     <ul class="pagination mb-1">
	       <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 10</span></li>
		   <!-- Previous block -->
	       <c:if test="${startPage > 10 }">
	       <li class="page-item"><a class="page-link" onclick="roomFilterPage(${startPage-10 })" aria-label="Next"><i class="fi-chevron-left"></i></a></li>
	       </c:if>
	       <!-- First page -->
	       <c:if test="${page != 1 && startPage != 1}">
	       <li class="page-item d-none d-sm-block"><a class="page-link" onclick="roomFilterPage(1)" aria-label="Previous"><i class="fi-chevron-left"></i></a></li>
	       <li class="page-item d-none d-sm-block">...</li>
	       </c:if>
	       <!-- Pages for each block -->
	       <c:forEach var="i" begin="${startPage }" end="${endPage }">
	       <c:if test="${i == page }">
	       <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">${i}<span class="visually-hidden">(current)</span></span></li>
	       </c:if>
	       <c:if test="${i != page}">
	       <li class="page-item d-none d-sm-block"><a class="page-link" onclick="roomFilterPage(${i})">${i}</a></li>
	       </c:if>
	       </c:forEach>
	       <!-- Last page -->
	       <c:if test="${endPage != pageCount}">
	       <li class="page-item d-none d-sm-block">...</li>
	       <li class="page-item d-none d-sm-block"><a class="page-link" onclick="roomFilterPage(${pageCount})">${pageCount}</a></li>
	       </c:if>
	       <!-- Next block -->
	       <c:if test="${endPage < pageCount}">
	       <li class="page-item"><a class="page-link" onclick="roomFilterPage(${startPage+10 })" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
	       </c:if>
	     </ul>
	   </nav>
	   </c:if>