$( document ).ready(function(){
  $(".add-link-button").on("click", addLink)
})

function addLink(e) {
  e.preventDefault();
  postLink()
  .then(function(links){
    displayAddSuccess()
    const newIndex = links.length - 1
    const newLink = links[newIndex]
    $('.links').prepend(`
      <div class="link">
        <div class="title">Title: ${newLink.title} </div>
        <div class="url">URL: ${newLink.url} </div>
        <div class="read-status">Read? ${newLink.read} </div>
        <input type="button" class="edit-link-button btn btn-default" value="Edit Link"/>
      </div>
      `)
  }).fail(displayFailure);
}

function postLink() {
  const title = $('input[id="link_title"]').val()
  const url = $('input[id="link_url"]').val()

  const formData = {
    title: title,
    url: url
  }

  return $.ajax({
    type: "POST",
    url: "/api/v1/links/",
    data: formData,
  })
}

