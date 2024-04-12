/* 글 등록 */
$("#boardSave").click(() => {
    const title = $("#boardTitle");
    const writer = $("#boardWriter");
    const content = $("#boardContent");

    if(title.val() === "" || title.val().trim() == "") {
        swalBasic2("확인 필요", "제목을 입력하세요.", "warning", title);
    } else if(writer.val() === "" || writer.val().trim() == "") {
        swalBasic2("확인 필요", "작성자를 입력하세요.", "warning", writer);
    } else if(content.val() === "" || content.val().trim() == "") {
        swalBasic2("확인 필요", "내용을 입력하세요.", "warning", content);
    } else {
        frm = document.detailForm;
        frm.action = "/project/boardAdd.do";
        frm.submit();
    }
});

const swalBasic2 = (title, text, icon, target = null) => {
    Swal.fire({
        title: title,
        text: text,
        icon: icon
    }).then((result) => {
        if(result.isConfirmed && target !== null) {
            target.focus();
        };
    });
};