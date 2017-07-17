$( document ).ready(function(){
  $("body").on("click", ".add-link-button", addLink)
})

function addLink(e) {
  e.preventDefault();
  getLinkInfo()
  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function getLinkInfo() {
  const title = $('input[name="link-title"]').val()
  const url = $('input[name="link-url"]').val()

  return new Food ({
    name: name,
    calories: calories
  })
}

// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
// }
// 
// function displayFailure(failureData){
//   console.log("FAILED attempt to update Link: " + failureData.responseText);
// }