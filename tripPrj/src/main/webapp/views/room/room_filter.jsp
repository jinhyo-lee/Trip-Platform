<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
	<script type="text/javascript" src="func/location.js"></script>
    <script type="text/javascript">
		function roomFilter() {
			event.preventDefault();
			
			$.ajax({
				url : 'roomFilter',
				type : 'post',
				data : $('#roomForm').serializeArray(),
				success : function(data) {
					$('#roomAsync').html(data);
				}
			});
		};
	</script>
 
 <!-- Filters sidebar (Offcanvas on mobile)-->
 <aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
   <div class="offcanvas offcanvas-start offcanvas-collapse" id="filters-sidebar">
     <div class="offcanvas-header d-flex d-lg-none align-items-center">
       <h2 class="h5 mb-0">Filters</h2>
       <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
     </div>
     <div class="offcanvas-body py-lg-4">
       <form onchange="roomFilter()" id="roomForm">
           <!-- Filters-->
           <div class="pb-4 mb-2">
           <h3 class="h6">도시</h3>
           <select id="city" name="city" class="form-select mb-2">
             <option value="" disabled selected>도시</option>
             <option value="마포구">마포구</option>
             <option value="성동구">성동구</option>
             <option value="용산구">용산구</option>
             <option value="강남구">강남구</option>
             <option value="영등포구">영등포구</option>
             <option value="종로구">종로구</option>
             <option value="서초구">서초구</option>
             <option value="송파구">송파구</option>
             <option value="중구">중구</option>
             <option value="강북구">강북구</option>
             <option value="도봉구">도봉구</option>
             <option value="은평구">은평구</option>
           </select>
           <select id="district" name="district" class="form-select">
             <option value="" selected disabled>상세 주소</option>
           </select>
         </div>
         <div class="pb-4 mb-2">
           <h3 class="h6">시설 타입</h3>
           <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type1" id="호텔" value="호텔">
               <label class="form-check-label fs-sm" for="호텔">호텔</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type2" id="콘도" value="콘도">
               <label class="form-check-label fs-sm" for="콘도">콘도</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type3" id="리조트" value="리조트">
               <label class="form-check-label fs-sm" for="리조트">리조트</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type4" id="캠핑장" value="캠핑장">
               <label class="form-check-label fs-sm" for="캠핑장">캠핑장</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type5" id="게스트하우스" value="게스트하우스">
               <label class="form-check-label fs-sm" for="게스트하우스">게스트하우스</label>
             </div>
           </div>
           <div class="pb-4 mb-2">
            <h3 class="h6">옵션</h3>
             <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option1" id="수영장" value="수영장">
                 <label class="form-check-label fs-sm" for="수영장">수영장</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option2" id="헬스장" value="헬스장">
                 <label class="form-check-label fs-sm" for="헬스장">헬스장</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option3" id="바/라운지" value="바/라운지">
                 <label class="form-check-label fs-sm" for="바/라운지">바/라운지</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option4" id="바비큐 그릴" value="바비큐 그릴">
                 <label class="form-check-label fs-sm" for="바비큐 그릴">바비큐 그릴</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option5" id="조식 제공" value="조식 제공">
                 <label class="form-check-label fs-sm" for="조식 제공">조식 제공</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option6" id="테라스" value="테라스">
                 <label class="form-check-label fs-sm" for="테라스">테라스</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option7" id="자연 조망" value="자연 조망">
                 <label class="form-check-label fs-sm" for="자연 조망">자연 조망</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option8" id="연회장" value="연회장">
                 <label class="form-check-label fs-sm" for="연회장">연회장</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="option9" id="기타" value="기타">
                 <label class="form-check-label fs-sm" for="기타">기타</label>
               </div>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">가격대</h3>
             <div class="range-slider" data-start-min="100000" data-start-max="450000" data-min="10000" data-max="700000" data-step="10000">
               <div class="range-slider-ui" onmouseup="roomFilter()"></div>
                <div class="d-flex align-items-center">
                  <div class="w-50 pe-2" style="display: none;">
                    <div class="input-group"><span class="input-group-text fs-base">₩</span>
                      <input class="form-control range-slider-value-min" name="minCost" id="minCost" type="text">
                    </div>
                  </div>
                  <div class="w-50 ps-2" style="display: none;">
                    <div class="input-group"><span class="input-group-text fs-base">₩</span>
                      <input class="form-control range-slider-value-max" name="maxCost" id="maxCost" type="text">
                    </div>
                  </div>
                </div>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">평점대</h3>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="5점" value="5.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="5점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="4점" value="4.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="4점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="3점" value="3.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="3점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="2점" value="2.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="2점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="1점" value="1.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="1점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">호텔 등급</h3>
             <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="star5" id="5성급" value="5성급">
                 <label class="form-check-label fs-sm" for="5성급">5성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="star4" id="4성급" value="4성급">
                 <label class="form-check-label fs-sm" for="4성급">4성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="star3" id="3성급" value="3성급">
                 <label class="form-check-label fs-sm" for="3성급">3성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="star2" id="2성급" value="2성급">
                 <label class="form-check-label fs-sm" for="2성급">2성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="star1" id="기타" value="기타">
                 <label class="form-check-label fs-sm" for="기타">기타</label>
               </div>
             </div>
             <div class="border-top py-4">
               <button class="btn btn-outline-primary rounded-pill" type="button" onclick="location.href='roomList';"><i class="fi-rotate-right me-2"></i>필터 초기화</button>
             </div>
           </div>
         </div>
       </form>
     </div>
   </div>
 </aside>
 
 <script src="vendor/nouislider/distribute/nouislider.min.css"></script>
 <script src="vendor/nouislider/distribute/nouislider.min.js"></script>
 <script src="vendor/cleave.js/dist/cleave.min.js"></script>