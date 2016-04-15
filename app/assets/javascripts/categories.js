window.onload = init();
var category;
function init(){
  var categories = $('#categories').children();
  for (var i = 0; i < categories.length; i++) {
    document.getElementById(categories[i].id).addEventListener("click", changeApis);
  }
}

function changeApis() {
  category = event.currentTarget.id;
  var request = $.ajax({
    method: "GET",
    url: "/v1/change/" + event.currentTarget.id
  });

  request.done(function(data) {
    destroyCurrent();
    $('.trending-section').append( "<div class='large-title'>" + category + "</div>" );
    $('.trending-section').append(data)
  });
}

function destroyCurrent(){
  $('.trending-section').children().remove();
}
