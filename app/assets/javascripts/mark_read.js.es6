$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".edit-link-button", makeFieldsEditable)
  $("body").on('click', ".update-link-button", updateAttributes)
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

function makeFieldsEditable(e) {
  e.preventDefault()
  $(e.target).hide()
  const submitButton= $('<input type="button" class="update-link-button" value="Update Link"/>')
  $(e.target.parentElement).append(submitButton)
  
  $(this).siblings('.title')[0].contentEditable = true
  $(this).siblings('.url')[0].contentEditable = true
}

function updateAttributes(e) {
  e.preventDefault()
  const linkId = e.target.parentElement.dataset.linkId
  const title = $(this).siblings('.title')[0].innerHTML.split(": ")[1]
  const url = $(this).siblings('.url')[0].innerHTML.split(": ")[1]
  $(this).siblings('.title')[0].contentEditable = false
  $(this).siblings('.url')[0].contentEditable = false
  
  $(this).siblings('.edit-link-button').show()
  $(e.target).remove()
  
  const attrData = {title: title, url: url}
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: attrData,
    success: displayEditSuccess
  })
  .fail(displayFailure)
}
