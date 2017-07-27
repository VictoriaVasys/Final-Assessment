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
  
  // $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);

  
  // var $link = $(this).parents('.link');
  // var linkId = $link.data('link-id');

  
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

// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
// }
// 
function displayAddFailure(failureData){
  console.log("FAILED attempt to add Link: " + failureData.responseText);
  return alert("Failed to add your link; " + failureData.responseText)
}