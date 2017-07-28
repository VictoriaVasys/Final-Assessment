function displayFailure(failureData){
  console.log("FAILED attempt: " + failureData.responseText);
  $('.big-center').append(`
    <div class="alert alert-danger">
      ${failureData.responseJSON.message}
    </div>
  `)
  clearAlert()
}

function displayEditSuccess(){
  $('.big-center').append(`
    <div class="alert alert-success">
      "Link updated successfully"
    </div>
  `)
  clearAlert()
}

function displayAddSuccess(){
  $('.big-center').append(`
    <div class="alert alert-success">
      "Link added successfully"
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