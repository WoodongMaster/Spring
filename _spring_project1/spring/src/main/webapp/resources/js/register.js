document.getElementById('trigger').addEventListener('click', () => {
    document.getElementById('file').click();
})



//정규표현식을 사용하여 생성자 함수를 만들기
//실행파일 막기, 이미지파일인지 아닌지 체크
//fileUpload시 형식제한 함수
const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$"); //실행파일 막기
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$"); //이미지파일
const maxSize = 1024*1024*2; //2M 보다 큰지 확인

function fileSizeValidation(fileName, fileSize) {
    if(regExp.test(fileName)) { //실행파일
        return 0;
    } else if(fileSize > maxSize) {
        return 0;
    }
    // } else if(!regExpImg.test(fileName)) { //이미지 파일이 아니면 첨부 X
    //     return 0;
    //} 
    else {
        return 1;
    }
}

// 첨부 파일에 따라서 체크하여 등록 가능한지 확인
document.addEventListener('change', (e) => {
    console.log(e.target);
    if (e.target.id == 'file') {
        // 첨부되지 말아야 하는 파일이 들어왔을 때 전송되는 것을 방지
        document.getElementById('regBtn').disabled = false;
        const fileObject = document.getElementById('file').files; // 여러 개의 파일이 배열로 들어옴
        console.log(fileObject);

        let div = document.getElementById('fileZone');
        div.innerHTML = '';
        // 첨부 파일이 여러 개인 경우: for문으로 li를 여러 개 생성
        let ul = `<ul>`;
        let isOk = 1; // fileSizeValidation의 통과 여부를 체크
        for (let file of fileObject) {
            console.log(file);
            let validResult = fileSizeValidation(file.name, file.size); // 하나
            isOk *= validResult; // 모든 첨부 파일의 결과가 1이여야 통과 // 전체
            ul += `<li>`;
            // 업로드 가능 표시 1 true 0 false
            ul += `${validResult ? '<div>업로드 가능' : '<div>업로드 불가능'}</div>`;
            ul += `${file.name}`;
            ul += `<span class="badge bg-${validResult ? "success" : "danger"} rounded-pill">${file.size}Bytes</span></li>`;
        }
        ul += `</ul>`;
        div.innerHTML = ul;
        if (isOk == 0) { // 불가 파일이 있다는 의미
            document.getElementById('regBtn').disabled = true;
        }
    }

});


document.getElementById('sbmBtn').addEventListener('click', ()=>{
    if(document.getElementById("pw_color").value == "1"){
        document.getElementById("pw").disabled ="true";
    }
})