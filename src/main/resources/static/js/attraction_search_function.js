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

