// 내 장소로 저장하는 함수
function addMyPick(contentId) {
    fetch("${root}/attraction/myPick", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            contentId: contentId
        }),
    });
}

document.getElementById("btn-search").addEventListener("click", function(){
    const checkboxes = document.getElementsByName('contentType');
    if ("<c:out value='${loginUser}'/>" == "") {
        alert("로그인이 필요한 서비스입니다.");
        location.reload();
    } else if(!document.querySelector("#search-area-sido").value) {
        alert("시/도를 선택하세요!");
        location.reload();
    } else if(!document.querySelector("#search-area-gugun").value) {
        alert("군/구를 선택하세요!");
        location.reload();
    } else if (checkboxes.length == 0) {
        alert("유형을 선택하세요!");
        location.reload();
    } else {
        let form = document.querySelector("#searchForm");
        form.setAttribute("action", "/attraction");
        form.submit();
    }
});
