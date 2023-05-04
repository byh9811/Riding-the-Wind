<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../common/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="css/tiny-slider.css" />
  <link rel="stylesheet" href="css/nouislider.css" />
    <style>
		.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
		.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
		.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
		.number {font-weight:bold;color:#ee6152;}
		.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
		.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
		.distanceInfo .label {display:inline-block;width:50px;}
		.distanceInfo:after {content:none;}
	</style>
</head>

<body>
  <div class='container'>
    <!--Header -->
	<%@ include file="../common/header.jsp" %>
    <!--End of Header-->

    <!--Main-->
    <div class='container text-center'>
      <hr>
      <h4>어디로 떠날까요?</h4>
      <hr>
      <form role="search" id='searchForm' method="get">
        <div id='search' class="d-flex mt-3">
          <select id="search-area-sido" class="form-select" aria-label="Default select example" name="sido">
            <option value="" selected>시/도 선택</option>
          </select>
          <select id="search-area-gugun" class="form-select" aria-label="Default select example" name="gugun">
            <option value="" selected>구/군 선택</option>
          </select>
          <input id="search-keyword" class="form-control me-2" type="search" placeholder="검색어" aria-label="검색어" name="title" />
          <button id="btn-search" class="btn btn-outline-success" type="button">검색</button>
        </div>
        <div class="d-flex mt-3">
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_12" value="12">
            <label for="checkbox_12" class="justify-content-center">관광지</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_14" value="14">
            <label for="checkbox_14" class="justify-content-center">문화시설</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_15" value="15">
            <label for="checkbox_15" class="justify-content-center">축제공연행사</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_25" value="25">
            <label for="checkbox_25" class="justify-content-center">여행코스</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_28" value="28">
            <label for="checkbox_28" class="justify-content-center">레포츠</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_32" value="32">
            <label for="checkbox_32" class="justify-content-center">숙박</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_38" value="38">
            <label for="checkbox_38" class="justify-content-center">쇼핑</label>
          </div>
          <div class="col justify-content-center">
            <input type='checkbox' name="contentType" id="checkbox_39" value="39">
            <label for="checkbox_39" class="justify-content-center">음식점</label>
          </div>
          <div class="col-lg-2 col-sm-5 col-10 p-0 text-center">
            <div class="mt-2">
              <label class="switch row">
                <input class="m-0 p-0 d-flex justify-content-center" type="checkbox" id="slide_all">
                <span class="slider round"></span>
              </label>
            </div>
            <span><h6>전체 선택</h6></span>
          </div>
        </div>
      </form>

      <div id="map" style="width: 98%; height: 550px"></div>

      <!-- View! -->
      <div class="row row-cols-4 justify-content-center" id='trip-list'>
        <c:forEach var="trip" items="${trips}">
          <div class="card col" style="width: 18rem;">
              <img src="${trip.firstImage}" class="card-img-top" alt="areaImage" onerror=this.src="img/noimg.jpg">
              <div class="card-body">
                <h5 class="card-title">${trip.title}</h5>
                <p class="card-text">${trip.addr1} ${trip.addr2}</p>
                <a href="#" class="btn btn-primary" onclick="moveCenter(${trip.latitude}, ${trip.longitude});">위치 보기</a>
                <div style="display: none" class="latitude">${trip.latitude}</div>
                <div style="display: none" class="longitude">${trip.longitude}</div>
                <input id="hiddenContentId" style="display: none" class="contentId">
                <button class="btn btn-secondary" onclick="addMyPick(${trip.contentId})">여행지 추가</button>
              </div>
          </div>
        </c:forEach>
      </div>

    </div>
    <!--End of Main-->

    <!--Footer-->
    <%@ include file="../common/footer.jsp" %>
    <!--End of Footer-->
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4de9e07e005325e92dadbc5bcaedf59c&libraries=services,clusterer,drawing"></script>
  <script src="${root}/js/attraction_search.js"></script>
  <script src="${root}/js/attraction_search_function.js"></script>
  <script src="${root}/js/tiny-slider.js"></script>
  <script src="${root}/js/nouislider.js"></script>
</body>
</html>
