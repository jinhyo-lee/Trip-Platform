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
		var formData = "place_reply_id="+id+'&reply_content='+reply_content+'&page=${page}&place_id=${place_id}';
		
		$.post('placeReplywModify', formData, function(data){
			history.go(0);
		});
	};

	function del(place_reply_id, place_id, page) {			
		var formData='place_reply_id='+place_reply_id+'&place_id='+place_id+'&page='+page;
		
		$.post('placeReplyDelete',formData, function(data) {
			history.go(0);
		});
	};
</script>

<c:forEach var="placeReply" items="${placeReplyList }">
	<div class="border-start border-4 ps-4 ms-4 mt-4">
		<div class="d-flex justify-content-between mb-3">
			<div class="d-flex align-items-center pe-2">
				<c:if test="${!empty placeReply.userphoto}">
				<img class="rounded-circle me-1" src="upload/${placeReply.userphoto }" width="48">
				</c:if>
				<c:if test="${empty placeReply.userphoto}">
				<img class="rounded-circle me-1" src="img/avatars/13.png" width="48" alt="Avatar">
				</c:if>
				<div class="ps-2">
					<h6 class="fs-base mb-0">${placeReply.id }</h6>
				</div>
			</div>

			<c:if test="${placeReply.id == sessionScope.id }">
			<button type="button" class="btn btn-icon btn-light btn-xs rounded-circle shadow-sm" id="contextMenu" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="fi-dots-vertical"></i>
			</button>
			<ul class="dropdown-menu my-1" aria-labelledby="contextMenu" id="ul_${placeReply.place_reply_id}">
				<li ><button type="button" class="dropdown-item" value="${placeReply.place_reply_id}" id="modify"><i class="fi-edit opacity-60 me-2"></i> 수정</button></li>
				<li><button type="button" class="dropdown-item" onclick="del(${placeReply.place_reply_id},${place_id },${page })"><i class="fi-trash opacity-60 me-2"></i> 삭제</button></li>
			</ul>
			</c:if>
		</div>
		<p id="p_${placeReply.place_reply_id}">${placeReply.reply_content }</p>
		<span style="float: right;" class="text-muted fs-sm">${placeReply.reply_reg }</span><br>
	</div>
</c:forEach>