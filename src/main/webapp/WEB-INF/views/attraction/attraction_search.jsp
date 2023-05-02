<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../common/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
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
      <form class="d-flex mt-3" role="search" id='search' method="get">
      <input type="hidden" name="action" value="trip">
        <select id="search-area" class="form-select" aria-label="Default select example" name="sido">
          <option value="" selected>검색 할 지역 선택</option>
          <option value="1">서울</option>
          <option value="2">인천</option>
          <option value="3">대전</option>
          <option value="4">대구</option>
          <option value="5">광주</option>
          <option value="6">부산</option>
          <option value="7">울산</option>
          <option value="8">세종특별자치시</option>
          <option value="31">경기도</option>
          <option value="32">강원도</option>
          <option value="33">충청북도</option>
          <option value="34">충청남도</option>
          <option value="35">경상북도</option>
          <option value="36">경상남도</option>
          <option value="37">전라북도</option>
          <option value="38">전라남도</option>
          <option value="39">제주도</option>
        </select>
        <select id="search-content-id" class="form-select" aria-label="Default select example" name="contentType">
          <option value="" selected>관광지 유형</option>
          <option value="12">관광지</option>
          <option value="14">문화시설</option>
          <option value="15">축제공연행사</option>
          <option value="25">여행코스</option>
          <option value="28">레포츠</option>
          <option value="32">숙박</option>
          <option value="38">쇼핑</option>
          <option value="39">음식점</option>
        </select>
        <input id="search-keyword" class="form-control me-2" type="search" placeholder="검색어" aria-label="검색어" name="title" />
        <button id="btn-search" class="btn btn-outline-success" type="submit">검색</button>
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
  <script src="attraction_search.jsp"></script>
</body>
</html>
