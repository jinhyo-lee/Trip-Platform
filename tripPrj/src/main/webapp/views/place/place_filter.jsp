<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
	<script type="text/javascript" src="func/location.js"></script>
    <script type="text/javascript">
		function placeFilter() {
			event.preventDefault();
			
			$.ajax({
				url : 'placeFilter',
				type : 'post',
				data : $('#placeForm').serializeArray(),
				success : function(data) {
					$('#placeAsync').html(data);
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
       <form onchange="placeFilter()" id="placeForm">
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
           </select>
           <select id="district" name="district" class="form-select">
             <option value="" selected disabled>상세 주소</option>
           </select>
         </div>
         <div class="pb-4 mb-2">
           <h3 class="h6">명소 유형</h3>
           <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
           <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act1" id="랜드마크" value="랜드마크">
               <label class="form-check-label fs-sm" for="랜드마크">랜드마크</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act2" id="야외활동" value="야외활동">
               <label class="form-check-label fs-sm" for="야외활동">야외활동</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act3" id="전시" value="전시">
               <label class="form-check-label fs-sm" for="전시">전시</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act4" id="유적지" value="유적지">
               <label class="form-check-label fs-sm" for="유적지">유적지</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act5" id="쇼핑" value="쇼핑">
               <label class="form-check-label fs-sm" for="쇼핑">쇼핑</label>
             </div>
              <div class="form-check">
               <input class="form-check-input" type="checkbox" name="act6" id="기타" value="기타">
               <label class="form-check-label fs-sm" for="기타">기타</label>
             </div>
           </div><br>
           <div class="pb-4 mb-2">
            <h3 class="h6">세부 유형</h3>
             <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type1" id="공원" value="공원">
                 <label class="form-check-label fs-sm" for="공원">공원</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type2" id="궁궐" value="궁궐">
                 <label class="form-check-label fs-sm" for="궁궐">궁궐</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type3" id="미술관" value="미술관">
                 <label class="form-check-label fs-sm" for="미술관">미술관</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type4" id="박물관" value="박물관">
                 <label class="form-check-label fs-sm" for="박물관">박물관</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type5" id="지역명소" value="지역명소">
                 <label class="form-check-label fs-sm" for="지역명소">지역명소</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type6" id="수목원" value="수목원">
                 <label class="form-check-label fs-sm" for="수목원">수목원</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type7" id="복합문화공간" value="복합문화공간">
                 <label class="form-check-label fs-sm" for="복합문화공간">복합문화공간</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type8" id="백화점" value="백화점">
                 <label class="form-check-label fs-sm" for="백화점">백화점</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type9" id="전통시장" value="전통시장">
                 <label class="form-check-label fs-sm" for="전통시장">전통시장</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="type10" id="기타" value="기타">
                 <label class="form-check-label fs-sm" for="기타">기타</label>
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
               <label class="form-check-label fs-sm align-middle mt-n2" for="3-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="2점" value="2.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="2-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="rate" id="1점" value="1.0">
               <label class="form-check-label fs-sm align-middle mt-n2" for="1점"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="border-top py-4">
               <button class="btn btn-outline-primary rounded-pill" type="button" onclick="location.href='placeList';"><i class="fi-rotate-right me-2"></i>필터 초기화</button>
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