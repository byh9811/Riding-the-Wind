function Haeundae() {
  var cast = {
    "searchArea" : "6", // 부산
    "searchContentId" : "12", // 관광지
    "searchKeyword" : "해운대" // 키워드
  };
  
  // Json Object를 저장하기
  localStorage.setItem("goto", JSON.stringify(cast));
}

function Jeju() {
  var cast = {
    "searchArea" : "39", // 제주
    "searchContentId" : "12", // 관광지
    "searchKeyword" : "제주" // 키워드
  };

  localStorage.setItem("goto", JSON.stringify(cast));

}

function Tong() {
  var cast = {
    "searchArea" : "36", // 부산
    "searchContentId" : "12", // 관광지
    "searchKeyword" : "통영" // 키워드
  };

  localStorage.setItem("goto", JSON.stringify(cast));

}

function Gwang() {
	var cast = {
		"searchArea" : "5", // 부산
		"searchContentId" : "12", // 관광지
		"searchKeyword" : "광주" // 키워드
	};

	localStorage.setItem("goto", JSON.stringify(cast));
}