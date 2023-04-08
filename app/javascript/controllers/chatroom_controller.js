import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatroom"
export default class extends Controller {
  static targets = ["button", "booking"]
  connect() {
    // console.log(this.bookingTarget)
    // console.log(this.buttonTarget)
  }

  getChatroom() {

    const regex = 'bookings\/(.+)'
    const id = this.bookingTarget.href.match(regex)[1]
    window.location.href = `/chatrooms/${id}`
  }
}
