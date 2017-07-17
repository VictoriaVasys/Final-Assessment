$( document ).ready(function(){
  $("body").on("click", ".add-link-button", addLink)
})

function addLink(e) {
  e.preventDefault();
  postLink()
  .then(function(){
    const newLink = Link.last
    debugger
    $('.links').prepend(`
      <div class="link">
        Title: ${newLink.title}
        URL: ${newLink.title}
        Read? ${newLink.read}
      </div>
      `)
  })
  
  // $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);

  
  // var $link = $(this).parents('.link');
  // var linkId = $link.data('link-id');

  
}

function postLink() {
  const title = $('input[name="link-title"]').val()
  const url = $('input[name="link-url"]').val()

  const formData = {
    title: title,
    url: url
  }

  $.ajax({
    type: "POST",
    url: "/api/v1/links/",
    data: { formData },
  }).fail(displayFailure);
}

// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
// }
// 
function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}