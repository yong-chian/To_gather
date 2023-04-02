import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="interest"
export default class extends Controller {
  static targets = [ "form", "item", "button" ]

  connect() {
  }

  disable(event) {

    const input = document.querySelector(`#user_interest_ids_${event.params.id}`)
    input.checked = !input.checked

    const button = document.querySelector(`#interest-${event.params.id}`);
    button.classList.toggle('active')

  }

  submit(event) {
    event.preventDefault()
    console.log(this.formTarget.action)
    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log("redirecting")
        window.location.href = "/"
      })
  }

  }
