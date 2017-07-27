$( document ).ready(function(){
  $(".add-link-button").on("click", addLink)
})

function addLink(e) {
  e.preventDefault();
  postLink()
  .then(function(links){
    const newIndex = links.length - 1
    const newLink = links[newIndex]
    $('.links').prepend(`
      <div class="link">
        Title: ${newLink.title} <br>
        URL: ${newLink.url} <br>
        Read? ${newLink.read} <br>
      </div>
      `)
  }).fail(displayAddFailure);

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

function displayAddFailure(failureData){
  console.log("FAILED attempt to add Link: " + failureData.responseText);
  $('form').append(`
    <div class="alert alert-danger">
      ${failureData.responseJSON.message}
    </div>
  `)
  clearAlert()
}

function clearAlert() {
  window.setTimeout(() => {
    $('.alert').fadeTo(500, 0).slideUp(500, () => {
      $('.alert').remove()
    })
  }, 5000)
}