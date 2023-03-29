import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["bookmark"]
  connect() {
  }
  update() {
    if (this.bookmarkTarget.classList.value.includes("fa-regular")) {
      this.bookmarkTarget.classList.remove("fa-regular")
      this.bookmarkTarget.classList.add("fa-solid")
    } else {
      this.bookmarkTarget.classList.remove("fa-solid")
      this.bookmarkTarget.classList.add("fa-regular")
    }
  }
}
