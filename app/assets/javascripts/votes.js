window.onload = init();

function init(){
  document.getElementById("upvote").addEventListener("click", upVote);
  document.getElementById("downvote").addEventListener("click", downVote);
}

function upVote() {
  console.log("upvote clicked");
  id = $('#api_id').val();
  var request = $.ajax({
    method: "GET",
    url: '/v1/upvote',
    data: { api_id: id }
  });

  request.done(function(data) {
    document.getElementById("upvote").textContent = data["upvotes"];
    document.getElementById("downvote").textContent = data["downvotes"];
  });
}

function downVote() {
  console.log("down clicked");
  id = $('#api_id').val();
  var request = $.ajax({
    method: "GET",
    url: '/v1/downvote',
    data: { api_id: id }
  });

  request.done(function(data) {
    document.getElementById("upvote").textContent = data["upvotes"];
    document.getElementById("downvote").textContent = data["downvotes"];
  });
}
