<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('#answer-modify').click(function() {	
			var id  = $(this).val(); 
			var txt = $('#p_'+id).text(); 
			
			$('#p_'+id).html("<textarea class='form-control' rows='3' cols='70' id='ans_"+id+"' placeholder='수정할 내용을 입력해 주세요.' style='resize: none;'>"+txt		
				+"</textarea>");
			$('#ul_'+id).html(			
			   "<button class='dropdown-item' onclick='answerModi("+id+")'><i class='fi-edit opacity-60 me-2'></i>확인</button>" );
		});
	});

	function answerCancel(){
		history.go(0);
	};

	function answerModi(id){
		var answer_content = $('#ans_'+id).val();
		var formData = "food_answer_id="+id+'&answer_content='+answer_content+'&page=${page}&food_id=${food_id}';
		
		$.post('foodAnswerModify', formData, function(data){
			history.go(0);
		});
	};

	function answerDel(food_answer_id, food_id, page) {			
		var formData='food_answer_id='+food_answer_id+'&food_id='+food_id+'&page='+page;
		
		$.post('foodAnswerDelete',formData, function(data) {
			history.go(0);
		});
	};
</script>

<c:forEach var="foodAnswer" items="${foodAnswerList }">
	<div class="border-start border-4 ps-4 ms-4 mt-4">
		<div class="d-flex justify-content-between mb-3">
			<div class="d-flex align-items-center pe-2">
				<c:if test="${!empty foodAnswer.userphoto}">
				<img class="rounded-circle me-1" src="upload/${foodAnswer.userphoto }" width="48">
				</c:if>
				<c:if test="${empty foodAnswer.userphoto}">
				<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
				</c:if>
				<div class="ps-2">
					<h6 class="fs-base mb-0">${foodAnswer.id }</h6>
				</div>
			</div>
			<c:if test="${foodAnswer.id == sessionScope.id }">
			<button type="button" class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" id="contextMenu" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fi-dots-vertical"></i>
			</button>
			<ul class="dropdown-menu my-1" aria-labelledby="contextMenu" id="ul_${foodAnswer.food_answer_id}">
				<li ><button type="button" class="dropdown-item" value="${foodAnswer.food_answer_id}" id="answer-modify"><i class="fi-edit opacity-60 me-2"></i> 수정</button></li>
				<li><button type="button" class="dropdown-item" onclick="answerDel(${foodAnswer.food_answer_id},${food_id },${page })"><i class="fi-trash opacity-60 me-2"></i> 삭제</button></li>
			</ul>
			</c:if>
		</div>
		<p id="p_${foodAnswer.food_answer_id}">${foodAnswer.answer_content }</p>
		<span style="float: right;" class="text-muted fs-sm">${foodAnswer.answer_reg }</span><br>
	</div>
</c:forEach>