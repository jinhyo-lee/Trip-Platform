<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="container mb-5 pb-1">
	<ul class="nav nav-masthead h5 d-flex flex-wrap pb-3 mb-4" role="tablist">
		<li class="nav-item"><a class="nav-link text-uppercase text-decoration-none active border-end pe-3 me-3 mb-2" href="#review-list" data-bs-toggle="tab" role="tab" aria-controls="reviews-about-you" aria-selected="true">리뷰</a></li>
		<li class="nav-item"><a class="nav-link d-flex align-items-center mb-2" href="#qna-list" data-bs-toggle="tab" role="tab" aria-controls="reviews-by-you" aria-selected="false"><span>Q&A</span></a></li>
	</ul>
	<div class="row">
		<div class="tab-content col-md-7 mb-md-0 mb-4">
			<div class="tab-pane fade show active" id="review-list" role="tabpanel">
				<div class="mb-4 pb-4 border-bottom">
					<h3 class="h4 pb-3"><i class="fi-star-filled mt-n1 me-2 lead align-middle text-warning"></i>${avgRate } <span class="text-muted">(${listCount})</span></h3>
					<c:if test="${!empty sessionScope.id}">
						<button class="btn btn-outline-primary mb-sm-0 mb-3" href="#modal-review" data-bs-toggle="modal" onclick="writes(${place_id},${page})">
							<i class="fi-edit me-1"></i>리뷰 작성
						</button>
					</c:if>
					<div class="d-flex align-items-center ms-sm-4"></div>
				</div>
				<!-- Review Write -->
				<div class="modal fade" id="modal-review" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
								<h3 class="modal-title mt-4 text-center">리뷰를 남겨주세요</h3>
								<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body px-sm-5 px-4" id="writeform">
								<!-- load area -->
							</div>
						</div>
					</div>
				</div>
				<!-- Review Update -->
				<div class="modal fade" id="modal-review-modify" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
								<h3 class="modal-title mt-4 text-center">리뷰 수정</h3>
								<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body px-sm-5 px-4" id="modifyform">
								<!-- load area -->
							</div>
						</div>
					</div>
				</div>
				<!-- Reply Write -->
				<div class="modal fade" id="modal-reply" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered" role="document" id="replyform">
						<!-- load area -->
					</div>
				</div>
				<!-- Review list -->
				<c:forEach var="placeReview" items="${reviewlist}" varStatus="status">
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
							<c:if test="${!empty sessionScope.id && isLikeList[status.index] == false }">
							<span class="text-muted fs-sm">
								<button style="padding: 0;" type="button" class="btn btn-link btn-sm" title="좋아요 추가" onclick="location.href='placeReviewLike?place_rev_id=${placeReview.place_rev_id}&place_id=${place.place_id}&page=${page}&state=cont'">
								<i class="fi-heart opacity-60 me-2"></i>${likeTotalList[status.index] }</button>
							</span>
							</c:if>
							<c:if test="${!empty sessionScope.id && isLikeList[status.index] == true }">
							<span class="text-muted fs-sm">
								<button style="padding: 0;" type="button" class="btn btn-link btn-sm" title="좋아요 삭제" onclick="location.href='placeReviewLike?place_rev_id=${placeReview.place_rev_id}&place_id=${place.place_id}&page=${page}&state=cont'">
								<i class="fi-heart-filled opacity-60 me-2"></i>${likeTotalList[status.index] }</button>
							</span>
							</c:if>
							<c:if test="${sessionScope.id != null}">
							<div class="dropdown d-inline-block" style="float: right;">
								<button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-dots-vertical"></i></button>
								<div class="dropdown-menu dropdown-menu-end my-1">
									<button class="btn btn-link btn-sm" type="button" href="#modal-reply" data-bs-toggle="modal" onclick="reply(${placeReview.place_rev_id },${page },${placeReview.place_id })">
										<i class="fi-reply fs-lg me-2"></i><span class="fw-normal">댓글</span>
									</button>
									<c:if test="${placeReview.id == sessionScope.id}">
									<button class="btn btn-link btn-sm" type="button" id="test1" href="#modal-review-modify" data-bs-toggle="modal" onclick="modify(${placeReview.place_rev_id },${place_id },${page })">
										<i class="fi-edit fs-lg me-2"></i><span class="fw-normal">수정</span>
									</button>
									</c:if>
									<c:if test="${placeReview.id == sessionScope.id}">
									<button type="button" value="삭제" class="btn btn-link btn-sm" onclick="location='placeReviewDelete?place_rev_id=${placeReview.place_rev_id}&place_id=${place_id }&page=${page }'">
										<i class="fi-trash fs-lg me-2"></i><span class="fw-normal">삭제</span>
									</button>
									</c:if>
								</div>
							</div>
							</c:if>
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
								<img src="upload/${photo}" style="height: 100px; width: 110px;"/>
							</c:forTokens>
						</c:if>
					</div><br>
					<div class="d-flex justify-content-between align-items-center" style="float: right;">
						<span class="text-muted fs-sm">${placeReview.rev_reg}</span>
					</div>
					<a class="collapse-label collapsed" href="#seeMoreOverview_rep${placeReview.place_rev_id}" data-bs-toggle="collapse" data-bs-label-collapsed="댓글 보기" data-bs-label-expanded="접기" role="button" aria-expanded="false" aria-controls="seeMoreOverview"
						onclick="replyList(${placeReview.place_rev_id },${place_id },${page })"></a>
					<!-- Reply List -->
					<div class="collapse" id="seeMoreOverview_rep${placeReview.place_rev_id}">
						<!-- load area -->
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- QnA Panel -->
			<div class="tab-pane fade" id="qna-list" role="tabpanel">
			<%@ include file="../place_qna/place_qna_list.jsp"%>
			</div>
		</div>
	</div>
</section>