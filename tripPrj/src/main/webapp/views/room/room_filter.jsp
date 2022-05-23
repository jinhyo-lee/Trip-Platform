<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="func/location.js"></script>

<!-- Filters sidebar (Offcanvas on mobile)-->
<aside class="col-lg-4 col-xl-3 border-top-lg border-end-lg shadow-sm px-3 px-xl-4 px-xxl-5 pt-lg-2">
     <div class="offcanvas offcanvas-start offcanvas-collapse" id="filters-sidebar">
       <div class="offcanvas-header d-flex d-lg-none align-items-center">
         <h2 class="h5 mb-0">Filters</h2>
         <button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
       </div>
       <div class="offcanvas-header d-block border-bottom pt-0 pt-lg-4 px-lg-0">
         <form class="form-group mb-lg-2 rounded-pill">
           <div class="input-group"><span class="input-group-text text-muted"><i class="fi-search"></i></span>
             <input class="form-control" type="text">
           </div>
           <button class="btn btn-primary rounded-pill d-lg-inline-block d-none" type="button">검색</button>
           <button class="btn btn-icon btn-primary rounded-circle flex-shrink-0 d-lg-none d-inline-flex" type="button"><i class="fi-search mt-n2"></i></button>
         </form>
       </div>
       <!-- Nav tabs-->
       <div class="offcanvas-body py-lg-4">
         <!-- Tabs content-->
         <div class="tab-content">
           <!-- Categories-->
           <!-- Filters-->
           <div class="pb-4 mb-2">
             <h3 class="h6">카테고리</h3>
             <div class="dropdown mb-sm-0 mb-3" data-bs-toggle="select">
               <button id="theme-cat" class="btn btn-outline-secondary d-flex align-items-center w-100 px-4 fw-normal text-start dropdown-toggle" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2 text-muted"></i><span class="dropdown-toggle-label d-block w-100">카테고리 선택</span></button>
               <input type="hidden">
               <ul class="dropdown-menu w-100">
                 <li><a class="dropdown-item" href="#"><i class="fi-bed me-2 fs-lg opacity-60"></i><span class="dropdown-item-label">숙소</span></a></li>
                 <li><a class="dropdown-item" href="#"><i class="fi-museum me-2 fs-lg opacity-60"></i><span class="dropdown-item-label">명소</span></a></li>
                 <li><a class="dropdown-item" href="#"><i class="fi-cafe me-2 fs-lg opacity-60"></i><span class="dropdown-item-label">식당</span></a></li>
               </ul>
             </div>
           </div>
           <div class="pb-4 mb-2">
           <h3 class="h6">도시</h3>
           <select id="city" class="form-select mb-2">
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
           <select id="district" class="form-select">
             <option value="" selected disabled>도시를 선택하세요</option>
           </select>
         </div>
         <div class="pb-4 mb-2">
           <h3 class="h6">시설 타입</h3>
           <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="roomtype" id="호텔">
               <label class="form-check-label fs-sm" for="호텔">호텔</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="roomtype" id="펜션">
               <label class="form-check-label fs-sm" for="펜션">펜션</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="roomtype" id="캠핑장">
               <label class="form-check-label fs-sm" for="캠핑장">캠핑장</label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="checkbox" name="roomtype" id="게스트하우스">
               <label class="form-check-label fs-sm" for="게스트하우스">게스트하우스</label>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">가격대</h3>
             <div class="range-slider" data-start-min="100000" data-start-max="350000" data-min="10000" data-max="700000" data-step="10000">
               <div class="range-slider-ui"></div>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">평점</h3>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="radios-stacked" id="5-star">
               <label class="form-check-label fs-sm align-middle mt-n2" for="5-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="radios-stacked" id="4-star">
               <label class="form-check-label fs-sm align-middle mt-n2" for="4-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="radios-stacked" id="3-star">
               <label class="form-check-label fs-sm align-middle mt-n2" for="3-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="radios-stacked" id="2-star">
               <label class="form-check-label fs-sm align-middle mt-n2" for="2-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
             <div class="form-check">
               <input class="form-check-input" type="radio" name="radios-stacked" id="1-star">
               <label class="form-check-label fs-sm align-middle mt-n2" for="1-star"><span class="star-rating"><i class="star-rating-icon fi-star-filled active"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i><i class="star-rating-icon fi-star"></i></span>
               </label>
             </div>
           </div>
           <div class="pb-4 mb-2">
             <h3 class="h6">호텔 등급</h3>
             <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" style="height: 11rem;">
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" id="5성">
                 <label class="form-check-label fs-sm" for="5성">5성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" id="4성">
                 <label class="form-check-label fs-sm" for="4성">4성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" id="3성">
                 <label class="form-check-label fs-sm" for="3성">3성급</label>
               </div>
               <div class="form-check">
                 <input class="form-check-input" type="checkbox" id="2성">
                 <label class="form-check-label fs-sm" for="2성">2성급</label>
               </div>
             </div>
             <div class="border-top py-4">
               <button class="btn btn-outline-primary rounded-pill" type="button"><i class="fi-rotate-right me-2"></i>Reset filters</button>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </aside>