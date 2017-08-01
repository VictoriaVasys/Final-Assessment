$( document ).ready(function(){
  $(".add-link-button").on("click", addLink)
})

function addLink(e) {
  e.preventDefault()
  postLink()
  .then(function(links){
    displayAddSuccess()
    const newLink = links[0]
    $('.links').prepend(`
      <div class="link">
        <h6></h6>
        <div class="title">Title: ${newLink.title} </div>
        <div class="url">URL: ${newLink.url} </div>
        <div class="read-status">Read? ${newLink.read} </div>
        <input type="button" class="edit-link-button btn btn-default" value="Edit Link"/>
        <input type="button" class="mark-read-button btn btn-default" value="Mark as Read"/>
        <input type="button" style="display: none" class="mark-read-button btn btn-default" value="Mark as Read"/>
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
    data: formData
  })
}

