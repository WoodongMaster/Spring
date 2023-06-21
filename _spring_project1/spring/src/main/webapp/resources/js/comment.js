async function postCommentToServer(cmtData){

    try{
        const url = '/comment/post';
        const config = {
            method:"post",
            headers:{
                'Content-Type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text(); //isOk
        return result;

    }catch(err){
        console.log(err);
    }
}

document.getElementById('cmtPostBtn').addEventListener('click', ()=>{
    const cmtText = document.getElementById('cmtText').value;
    console.log(cmtText);
    if(cmtText=="" || cmtText==null){
        alert("댓글을 입력해주세요");
        document.getElementById('cmtText').focus();
        return false;
    }else{
        let cmtData = {
            bno : bnoVal,
            writer : document.getElementById('cmtWriter').innerText,
            content : cmtText
        };
        console.log(cmtData);
        postCommentToServer(cmtData).then(result => {
            //여기서 받는 값은 isOk 잘 들어갔는지 확인 데이터
            if(result > 0){
                alert("댓글을 등록했습니다.");
                getCommentList(bnoVal);
            }
        })
    }

})

async function spreadCommentFromServer(bno){
	console.log(bno);
	try{
		const resp = await fetch('/comment/'+bno);
		const result = await resp.json();
		return result;
	}catch(err){
		console.log(err);
	}	
}

function getCommentList(bno){
	spreadCommentFromServer(bno).then(result => {
		console.log(result);
        console.log(id);
		const ul = document.getElementById('cmtListArea');
		ul.innerHTML = "";
		if(result.length > 0){
			for(let cvo of result){
				let li = `<li data-cno="${cvo.cno}" data-writer="${cvo.writer}"><div><div>작성자 : ${cvo.writer}</div>`;
				li += `내용 : <input type="text" id="cmtTextMod" value="${cvo.content}"></div>`;
				li += `<span>등록일 : ${cvo.mod_date}</span><br>`;
                li += `<button type="button" class="btn btn-outline-warning modBtn">수정</button>`;
                li += `<button type="button" class="btn btn-outline-danger DelBtn">삭제</button>`;
                li += `</li>`;
				ul.innerHTML += li;

			}
		}
		else{
			let li = `<li>등록된 댓글이 없습니다</li>`;
			ul.innerHTML = li;	
		}
	})
}

async function removeCommentFromServer(cno){
	try{
		const url = "/comment/"+cno;
		const config = {
			method:"delete"
		};
		const resp = await fetch(url, config);
		const result = await resp.text();
		return result;
	}catch(error){
		console.log(error);
	}
}

async function updateCommentFromServer(cmtDataMod){
	try{
		const url = "/comment/"+cmtDataMod.cno;
		const config = {
			method : "put",	// update는 put , remove는 delete
			headers : {
				'Content-type' : 'application/json; charset=utf-8'
			},
			body : JSON.stringify(cmtDataMod)
		};
		const resp = await fetch(url, config);
		const result = await resp.text(); // update 니까 isOk 값 받아옴
		return result;
	}catch(error){
		console.log(error);
	}
	
}

document.addEventListener('click', (e)=>{
	if(e.target.classList.contains('modBtn')){ // 댓글 수정 : 기존 위치의 값을 읽어들여 DB에 업데이트 후 변경사항 표시
		// 현재 수정하고자 하는 값( input box의 value값)을 찾기위한 작업
		let li = e.target.closest('li'); // closest -> 타겟을 기준으로 가장 가까운 값 찾기
		let cnoVal = li.dataset.cno;
		console.log("closest li : "+ li);
		console.log(cnoVal);
		let cmtTextMod = li.querySelector('#cmtTextMod').value;
		let writer = li.dataset.writer;
		
		cmtDataMod = {
			cno : cnoVal,
			content : cmtTextMod
		};
		
		updateCommentFromServer(cmtDataMod).then(result=>{
			if(result>0){
				alert('댓글 수정 완료!');
			}else{
				alert('댓글 수정 실패!');
			}
				getCommentList(bnoVal);
		})
	}
	if(e.target.classList.contains('DelBtn')){ // 댓글 삭제
		let li = e.target.closest('li');
		let cnoVal = li.dataset.cno;
		console.log(cnoVal);
		removeCommentFromServer(cnoVal).then(result =>{
			if(result>0){
				alert('댓글 삭제 완료!');
				getCommentList(bnoVal);
				console.log(bnoVal);
			}
		})		
	}
	
})