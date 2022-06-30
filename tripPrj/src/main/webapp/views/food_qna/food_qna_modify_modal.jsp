<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

	<c:set var="detail" value="${foodQnaDetail}"/>
	<form class="needs-validation"  id="qnaFormValue" name="form" method="post" action="foodQnaModify">
		<input type="hidden" name="id" value="${sessionScope.id }">
		<input type="hidden" name="food_qna_id" value="${food_qna_id }">
		<input type="hidden" name="food_id" value="${food_id }">
		<input type="hidden" name="page" value="${page }">
        <div class="mb-4">
        	<label class="form-label" for="qna-text">문의 <span class='text-danger'>*</span></label>
        	<textarea class="form-control" id="qna_content" rows="5" id="qna_content" name="qna_content"  required>${detail.qna_content}</textarea>
       		<div class="invalid-feedback">문의를 작성해주세요.</div>
        </div>
        <button class="btn btn-primary d-block w-100 mb-4"  id="commit">수정</button>
        <button class="btn btn-primary d-block w-100 mb-4" type="reset"  id="commit">취소</button>
	</form>