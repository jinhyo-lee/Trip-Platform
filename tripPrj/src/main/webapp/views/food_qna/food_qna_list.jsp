<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="mb-4 pb-4 border-bottom">
		<c:if test="${!empty sessionScope.id}">
			<button class="btn btn-outline-primary mb-sm-0 mb-3" href="#modal-qna" data-bs-toggle="modal" onclick="qnaWrites(${food_id},${page})">
				<i class="fi-edit me-1"></i>문의 작성
			</button>
		</c:if>
		<div class="d-flex align-items-center ms-sm-4"></div>
	</div>
	<!-- Qna Write -->
	<div class="modal fade" id="modal-qna" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
					<h3 class="modal-title mt-4 text-center">문의를 남겨주세요</h3>
					<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body px-sm-5 px-4" id="qna-writeform">
					<!-- load area -->
				</div>
			</div>
		</div>
	</div>
	<!-- Qna Update -->
	<div class="modal fade" id="modal-qna-modify" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
					<h3 class="modal-title mt-4 text-center">문의 수정</h3>
					<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body px-sm-5 px-4" id="qna-modifyform">
					<!-- load area -->
				</div>
			</div>
		</div>
	</div>
	<!-- Answer Write -->
	<div class="modal fade" id="modal-answer" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered" role="document" id="answerform">
			<!-- load area -->
		</div>
	</div>
	<!-- Qna list -->
	<c:forEach var="foodQna" items="${qnalist}" varStatus="status">
		<div class="mb-4 pb-4 border-bottom">
			<div class="d-flex justify-content-between mb-3">
				<div class="d-flex align-items-center pe-2">
					<c:if test="${!empty foodQna.userphoto}">
						<img class="rounded-circle me-1" src="upload/${foodQna.userphoto}" width="48" alt="Avatar">
					</c:if>
					<c:if test="${empty foodQna.userphoto}">
						<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
					</c:if>
					<div class="ps-2">
						<h6 class="fs-base mb-0">${foodQna.id}</h6>
					</div>
				</div>
				<div class="d-inline-block">
					<c:if test="${sessionScope.id eq 'admin' || foodQna.id == sessionScope.id}">
					<div class="dropdown d-inline-block" style="float: right;">
						<button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-dots-vertical"></i></button>
						<div class="dropdown-menu dropdown-menu-end my-1">
							<c:if test="${sessionScope.id eq 'admin'}">
							<button class="btn btn-link btn-sm" type="button" href="#modal-answer" data-bs-toggle="modal" onclick="answer(${foodQna.food_qna_id },${page },${foodQna.food_id })">
								<i class="fi-reply fs-lg me-2"></i><span class="fw-normal">답변</span>
							</button>
							</c:if>
							<c:if test="${foodQna.id == sessionScope.id}">
							<button class="btn btn-link btn-sm" type="button" id="test1" href="#modal-qna-modify" data-bs-toggle="modal" onclick="qnaModify(${foodQna.food_qna_id },${food_id },${page })">
								<i class="fi-edit fs-lg me-2"></i><span class="fw-normal">수정</span>
							</button>
							</c:if>
							<c:if test="${foodQna.id == sessionScope.id}">
							<button type="button" value="삭제" class="btn btn-link btn-sm" onclick="location='foodQnaDelete?food_qna_id=${foodQna.food_qna_id}&food_id=${food_id }&page=${page }'">
								<i class="fi-trash fs-lg me-2"></i><span class="fw-normal">삭제</span>
							</button>
							</c:if>
						</div>
					</div>
					</c:if>
				</div>
			</div>
			<h6 class="fs-base mb-0">${foodQna.qna_title}</h6><br>
			<p>${foodQna.qna_content}</p>
			<div class="d-flex justify-content-between align-items-center" style="float: right;">
				<span class="text-muted fs-sm">${foodQna.qna_reg}</span>
			</div>
			<c:if test="${foodQna.id eq sessionScope.id || sessionScope.id eq 'admin'}">
			<a class="collapse-label collapsed" href="#seeMoreOverview_ans${foodQna.food_qna_id}" data-bs-toggle="collapse" data-bs-label-collapsed="답변 보기" data-bs-label-expanded="접기" role="button" aria-expanded="false" aria-controls="seeMoreOverview"
				onclick="answerList(${foodQna.food_qna_id },${food_id },${page })"></a>
			</c:if>	
			<!-- Answer List -->
			<div class="collapse" id="seeMoreOverview_ans${foodQna.food_qna_id}">
				<!-- load area -->
			</div>
		</div>
	</c:forEach>		