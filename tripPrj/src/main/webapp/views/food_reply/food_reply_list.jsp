<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(function() {
		$('#modify').click(function() {	
			var id  = $(this).val(); 
			var txt = $('#p_'+id).text(); 
			
			$('#p_'+id).html("<textarea class='form-control' rows='3' cols='70' id='rep_"+id+"' placeholder='수정할 내용을 입력해 주세요.' style='resize: none;'>"+txt		
				+"</textarea>");
			$('#ul_'+id).html(			
			   "<button class='dropdown-item' onclick='modi("+id+")'><i class='fi-edit opacity-60 me-2'></i>확인</button>" );
		});
	});

	function cancel(){
		history.go(0);
	};

	function modi(id){
		var reply_content = $('#rep_'+id).val();
		var formData = "food_reply_id="+id+'&reply_content='+reply_content+'&page=${page}&food_id=${food_id}';
		
		$.post('foodReplywModify', formData, function(data){
			history.go(0);
		});
	};

	function del(food_reply_id, food_id, page) {			
		var formData='food_reply_id='+food_reply_id+'&food_id='+food_id+'&page='+page;
		
		$.post('foodReplyDelete',formData, function(data) {
			history.go(0);
		});
	};
</script>

<c:forEach var="foodReply" items="${foodReplyList }">
	<div class="border-start border-4 ps-4 ms-4 mt-4">
		<div class="d-flex justify-content-between mb-3">
			<div class="d-flex align-items-center pe-2">
				<c:if test="${!empty foodReply.userphoto}">
				<img class="rounded-circle me-1" src="upload/${foodReply.userphoto }" width="48">
				</c:if>
				<c:if test="${empty foodReply.userphoto}">
				<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
				</c:if>
				<div class="ps-2">
					<h6 class="fs-base mb-0">${foodReply.id }</h6>
				</div>
			</div>

			<c:if test="${foodReply.id == sessionScope.id }">
			<button type="button" class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" id="contextMenu" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fi-dots-vertical"></i>
			</button>
			<ul class="dropdown-menu my-1" aria-labelledby="contextMenu" id="ul_${foodReply.food_reply_id}">
				<li ><button type="button" class="dropdown-item" value="${foodReply.food_reply_id}" id="modify"><i class="fi-edit opacity-60 me-2"></i> 수정</button></li>
				<li><button type="button" class="dropdown-item" onclick="del(${foodReply.food_reply_id},${food_id },${page })"><i class="fi-trash opacity-60 me-2"></i> 삭제</button></li>
			</ul>
			</c:if>
		</div>
		<p id="p_${foodReply.food_reply_id}">${foodReply.reply_content }</p>
		<span style="float: right;" class="text-muted fs-sm">${foodReply.reply_reg }</span><br>
	</div>
</c:forEach>