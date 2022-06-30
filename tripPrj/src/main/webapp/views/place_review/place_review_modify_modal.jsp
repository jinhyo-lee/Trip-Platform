<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

	<c:set var="detail" value="${placeReviewDetail}"/>
	<form class="needs-validation"  id="reviewFormValue" enctype="multipart/form-data" name="form" method="post" action="placeReviewModify">
		<input type="hidden" name="id" value="${sessionScope.id }">
		<input type="hidden" name="place_rev_id" value="${place_rev_id }">
		<input type="hidden" name="place_id" value="${place_id }">
		<input type="hidden" name="page" value="${page }">
		<div class="mb-4" align="center" >  	 
	    	<!-- Rate -->      
	   		<div class="starpoint_wraps">		    
	 			<div class="starpoint_boxs" id="star1">      
	 				<c:forEach var="i" begin="1" end="10">
	 					<c:if test="${detail.rev_rate*2 == i }">
				 		<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}" checked> 
					    <label for="starpoint_${i}" class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label> 
	 					</c:if>
	 					<c:if test="${detail.rev_rate*2 != i }">
	 					<input type="radio" name="starpoint" id="starpoint_${i}" class="star_radio" value="${i/2}"> 
					    <label for="starpoint_${i}" class="label_star" title="${i/2}"><span class="blind">${i/2}점</span></label> 
	 					</c:if>
					</c:forEach>
					<span class="starpoint_bg" ></span> 			    
	  			</div>
			</div>
		</div>	
        <div class="mb-4">
        	<label class="form-label" for="review-text">리뷰 <span class='text-danger'>*</span></label>
        	<textarea class="form-control" id="rev_content" rows="5" id="rev_content" name="rev_content"  required>${detail.rev_content}</textarea>
       		<div class="invalid-feedback">리뷰를 작성해주세요.</div>
        </div>
        <div class="mb-4">
	        <c:forTokens var="photo" items="${detail.rev_photo}" delims=",">
			<img src="upload/${photo}" height="100" width="100"/>
			</c:forTokens>
		</div>
		<div class="mb-4">
        	<input class="form-control" type="file" name="rev_photos1" id="rev_photos" multiple="multiple" >
        </div>
        <button class="btn btn-primary d-block w-100 mb-4"  id="commit">수정</button>
	</form>