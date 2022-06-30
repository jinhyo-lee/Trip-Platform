<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
	<script type="text/javascript" src="func/location.js"></script>
    <script type="text/javascript">
		function foodFilter() {
			event.preventDefault();
			
			$.ajax({
				url : 'foodFilter',
				type : 'post',
				data : $('#foodForm').serializeArray(),
				success : function(data) {
					$('#foodAsync').html(data);
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
       <form onchange="foodFilter()" id="foodForm">
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
             <option value="서대문구">서대문구</option>
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
           <h3 class="h6">식당 유형</h3>
           <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type1" id="한식당" value="한식당">
               <label class="form-check-label fs-sm" for="한식당">한식당</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type2" id="일식당" value="일식당">
               <label class="form-check-label fs-sm" for="일식당">일식당</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type3" id="중식당" value="중식당">
               <label class="form-check-label fs-sm" for="중식당">중식당</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type4" id="양식당" value="양식당">
               <label class="form-check-label fs-sm" for="양식당">양식당</label>
             </div>
              <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type5" id="이국식당" value="이국식당">
               <label class="form-check-label fs-sm" for="이국식당">이국식당</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type6" id="해산물집" value="해산물집">
               <label class="form-check-label fs-sm" for="해산물집">해산물집</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type7" id="고깃집" value="고깃집">
               <label class="form-check-label fs-sm" for="고깃집">고깃집</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type8" id="카페" value="카페">
               <label class="form-check-label fs-sm" for="카페">카페</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type9" id="베이커리" value="베이커리">
               <label class="form-check-label fs-sm" for="베이커리">베이커리</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type10" id="요리주점" value="요리주점">
               <label class="form-check-label fs-sm" for="요리주점">요리주점</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type11" id="바" value=바>
               <label class="form-check-label fs-sm" for="바">바</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="type12" id="기타" value="기타">
               <label class="form-check-label fs-sm" for="기타">기타</label>
             </div>
           </div>
           <div class="pb-4 mb-2"><br>
            <h3 class="h6">음식 종류</h3>
             <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat1" id="한식" value="한식">
                 <label class="form-check-label fs-sm" for="한식">한식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat2" id="일식" value="일식">
                 <label class="form-check-label fs-sm" for="일식">일식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat3" id="중식" value="중식">
                 <label class="form-check-label fs-sm" for="중식">중식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat4" id="양식" value="양식">
                 <label class="form-check-label fs-sm" for="양식">양식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat5" id="브런치" value="브런치">
                 <label class="form-check-label fs-sm" for="브런치">브런치</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat6" id="베트남식" value="베트남식">
                 <label class="form-check-label fs-sm" for="베트남식">베트남식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat7" id="태국식" value="태국식">
                 <label class="form-check-label fs-sm" for="태국식">태국식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat8" id="인도음식" value="인도음식">
                 <label class="form-check-label fs-sm" for="인도음식">인도음식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat9" id="멕시칸음식" value="멕시칸음식">
                 <label class="form-check-label fs-sm" for="멕시칸음식">멕시칸음식</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat10" id="횟집" value="횟집">
                 <label class="form-check-label fs-sm" for="횟집">횟집</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat11" id="돼지고기" value="돼지고기">
                 <label class="form-check-label fs-sm" for="돼지고기">돼지고기</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat12" id="소고기" value="소고기">
                 <label class="form-check-label fs-sm" for="소고기">소고기</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat13" id="닭고기" value="닭고기">
                 <label class="form-check-label fs-sm" for="닭고기">닭고기</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat14" id="양고기" value="양고기">
                 <label class="form-check-label fs-sm" for="양고기">양고기</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat15" id="디저트" value="디저트">
                 <label class="form-check-label fs-sm" for="디저트">디저트</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat16" id="술" value="술">
                 <label class="form-check-label fs-sm" for="술">술</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="feat17" id="기타" value="기타">
                 <label class="form-check-label fs-sm" for="기타">기타</label>
               </div>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">가격대</h3>
             <div class="range-slider" data-start-min="4000" data-start-max="30000" data-min="1000" data-max="50000" data-step="1000">
               <div class="range-slider-ui" onmouseup="foodFilter()"></div>
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
               <button class="btn btn-outline-primary rounded-pill" type="button" onclick="location.href='foodList';"><i class="fi-rotate-right me-2"></i>필터 초기화</button>
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