$(document).ready(function(){ 
	$("form").submit(function(){
		
		if($("#room_cost").val() < 0){
			alert("가격은 음수를 입력할 수 없습니다.");
			$("#room_cost").val("").focus();
			return false;
		}
		
		if(isNaN($("#room_cost").val())){
			alert("가격은 숫자만 입력 가능합니다.");
			$("#room_cost").val("").focus();
			return false;
		}

		if(document.getElementById("roomPhotos").files.length == 0 ){
			alert("사진 첨부는 필수입니다. (최대 5장)");
			return false;
		}

		if(document.getElementById("roomPhotos").files.length > 5 ){
			alert("최대 5장의 사진만 올릴 수 있습니다.");
			return false;
		}
		
	});
});