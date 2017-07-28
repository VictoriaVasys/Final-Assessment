$( document ).ready(function(){
  $("body").on("click", ".mark-read-button", markAsRead)
  $("body").on("click", ".mark-unread-button", markAsUnread)
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  var urlForHotLinks = e.target.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent.split(': ')[1]
  debugger
  $(this).siblings('.mark-unread-button').show()
  $(e.target).hide()
  $link.addClass('link-read')
  $link.removeClass('link')
  e.target.previousElementSibling.previousElementSibling.previousElementSibling.textContent = "Read? true"

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true }
  }).then(addHotRead(urlForHotLinks))
    .fail(displayFailure);
}

function addHotRead(url) {
  $.ajax({
    type: "POST",
    url: "https://vv-m4-final-hot-links.herokuapp.com/api/v1/links",
    data: {url: url}
  })
}

function markAsUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link-read');
  var linkId = $link.data('link-id');
  
  $(this).siblings('.mark-read-button').show()
  $(e.target).hide()
  $link.removeClass('link-read')
  $link.addClass('link')
  e.target.previousElementSibling.previousElementSibling.textContent = "Read? false"

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false }
  })
    .fail(displayFailure);
}