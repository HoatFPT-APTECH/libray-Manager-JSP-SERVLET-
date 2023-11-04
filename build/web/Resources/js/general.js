/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.addEventListener("DOMContentLoaded", function () {
    // Thực hiện các tác vụ sau khi DOM đã tải hoàn toàn
    // Ví dụ: thêm xử lý sự kiện, truy cập và tương tác với các phần tử DOM
    showErr();
});
function showErr(){
         var errStr= document.getElementById("errorString")
                              var str=errStr.value;
                              if(typeof str==="string" && str.length!==0)
                              alert(str) 
}

function update( button){
    var url= button.getAttribute('href')
    var id= button .getAttribute("value");
    window.location.href=url+`?id=${id}`;
}
function remove( button){
    var url= button.getAttribute('href')
    var id= button .getAttribute("value");
     var choose  =window.confirm("Không thể xoá yêu cầu mượn vì nó liên quan đến bảng khác. Thay vào đó nó sẽ vào trạng thái ẩn.\n\n\
        Bạn có chắc muốn xoá yêu cầu mượn có id: "+id)
    if(choose){
         window.location.href=url+`?id=${id}`;   
    }

}

function formatMoney(amount) {
    return amount.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}



