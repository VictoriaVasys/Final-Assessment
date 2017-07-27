function displayFailure(failureData){
  console.log("FAILED attempt: " + failureData.responseText);
  $('form').append(`
    <div class="alert alert-danger">
      ${failureData.responseJSON.message}
    </div>
  `)
  clearAlert()
}

function displayEditSuccess(){
  $('form').append(`
    <div class="alert alert-success">
      "Link updated successfully"
    </div>
  `)
  clearAlert()
}

function displayAddSuccess(){
  $('form').append(`
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