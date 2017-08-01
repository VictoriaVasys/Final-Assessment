$(document).ready(function(){
  $("#query").keyup(filterLinks)
  $('.filter .show-read').on("click", showReadLinks)
  $('.filter .show-unread').on("click", showUnreadLinks)
})

function filterLinks(){
  var filter = $(".filter-links #query").val().toLowerCase()
  var links = $(".link")
  var readLinks = $(".link-read")

  links.hide()
  readLinks.hide()

  links.each(function(index, link){
    var title = link.children[0].textContent.split(": ")[1].toLowerCase()
    var url = link.children[1].textContent.split("URL: ")[1].toLowerCase()

    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
  
  readLinks.each(function(index, link){
    var title = link.children[0].textContent.split(":")[1].toLowerCase()
    var url = link.children[1].textContent.split("URL:")[1].toLowerCase()
  
    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
}

function showReadLinks(e) {
  e.preventDefault()
  var links = $(".link")
  var readLinks = $(".link-read")
  links.hide()
  readLinks.show()
}

function showUnreadLinks(e) {
  e.preventDefault()
  var links = $(".link")
  var readLinks = $(".link-read")
  links.show()
  readLinks.hide()
}


