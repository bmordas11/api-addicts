// window.onload = init();
// var id;
//
// function init(){
//   document.getElementById("upvote").addEventListener("click", upVote);
//   document.getElementById("downvote").addEventListener("click", downVote);
//   id = $("#api_id").val();
// }
//
// function check_for_admin() {
//   var request = $.ajax({
//     method: "GET",
//     url: "/v1/admin_check"
//   });
//
//   request.done(function(data) {
//     document.getElementById("upvote").textContent = data.upvotes;
//     document.getElementById("downvote").textContent = data.downvotes;
//   });
// }
