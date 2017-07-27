$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("input[value='Edit']").on("click", makeFieldsEditable)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
  return alert("Update Link failed: " + failureData.responseText)
}

function makeFieldsEditable(e) {
  e.preventDefault()
  debugger
  // var $link = $(this).parents('.link');
  const url = e.target.parentElement.previousElementSibling.previousElementSibling.contentEditable
  const title = e.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling
  url.contentEditable = true
  title.contentEditable = true
  
  // var linkId = $link.data('link-id');
  $(url).on('blur', upadateAttributes())
  $(title).on('blur', upadateAttributes())
}

function updateAttributes(e) {
  
  
  // e.preventDefault()
  // var $link = $(this).parents('.link');
  // var linkId = $link.data('link-id');
  // 
  // $.ajax({
  //   type: "PATCH",
  //   url: "/api/v1/links/" + linkId,
  //   data: { read: true },
  // }).then(updateLinkStatus)
  //   .fail(displayFailure);
}
