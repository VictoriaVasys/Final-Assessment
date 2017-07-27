$(document).ready(function(){
  $(".filter-links #query").keyup(filterLinks)
  $('.filter .show-read').on("click", showReadLinks)
  $('.filter .show-unRead').on("click", showUnreadLinks)
})

function filterLinks(){
  var filter = $(".filter-links #query").val().toLowerCase()
  var links = $(".link")
  var readLinks = $(".link-read")

  links.hide()
  readLinks.hide()

  links.each(function(index, link){
    var title = link.children[0].innerText.split(":")[1].toLowerCase()
    var url = link.children[1].innerText.split("URL:")[1].toLowerCase()

    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
  
  readLinks.each(function(index, link){
    var title = link.children[0].innerText.split(":")[1].toLowerCase()
    var url = link.children[1].innerText.split("URL:")[1].toLowerCase()

    if(title.includes(filter) || url.includes(filter)){
      $(this).show()
    }
  })
}

function showReadLinks() {
  
}

function showunReadLinks() {
  
}


