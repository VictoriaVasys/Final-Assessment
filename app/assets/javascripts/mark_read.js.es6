$( document ).ready(function(){
  $("body").on("click", ".mark-read-button", markAsRead)
  $("body").on("click", ".mark-unread-button", markAsUnread)
  $("body").on("click", ".edit-link-button", makeFieldsEditable)
  $("body").on('click', ".update-link-button", updateAttributes)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  
  $(this).siblings('.mark-unread-button').show()
  $(e.target).hide()
  $link.addClass('link-read')
  $link.removeClass('link')
  event.target.previousElementSibling.previousElementSibling.previousElementSibling.textContent = "Read? true"

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true }
  })
    .fail(displayFailure);
}

function markAsUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link-read');
  var linkId = $link.data('link-id');
  
  $(this).siblings('.mark-read-button').show()
  $(e.target).hide()
  $link.removeClass('link-read')
  $link.addClass('link')
  event.target.previousElementSibling.previousElementSibling.textContent = "Read? false"

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false }
  })
    .fail(displayFailure);
}