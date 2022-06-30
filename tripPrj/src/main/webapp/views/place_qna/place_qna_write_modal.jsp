<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- QnA Write Form -->
	<form class="needs-validation"  id="qnaFormValue" name="form" method="post" action="placeQnaWrite">
		<input type="hidden" name="id" value="${sessionScope.id }">
		<input type="hidden" name="place_id" value="${place_id }">
		<input type="hidden" name="page" value="${page }">
        <div class="mb-4">
          <label class="form-label" for="qna_title">제목 <span class='text-danger'>*</span></label>
          <input class="form-control" type="text" id="qna_title" name="qna_title" placeholder="문의 제목" required><br>
          <label class="form-label" for="qna_content">내용 <span class='text-danger'>*</span></label>
          <textarea class="form-control" id="qna_content" name="qna_content" rows="5" placeholder="문의 내용" required></textarea>
          <div class="invalid-feedback">문의를 작성해주세요.</div>
        </div>
        <button class="btn btn-primary d-block w-100 mb-4"  id="commit">작성</button>
    </form>