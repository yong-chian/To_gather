import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "chosenDateId"]
  static values = { availabilities: Array }

  connect() {
    console.log(this.availabilitiesValue)
    flatpickr(this.startTimeTarget, {
      enable: this.availabilitiesValue.map((availability)=>availability[0])
    })
    // flatpickr(this.endTimeTarget, {})
  }

  changeDateToAvailabilityId(event) {
    console.log(this.startTimeTarget.value)
    const availability = this.availabilitiesValue.find((availability)=>availability[0]===this.startTimeTarget.value)
    console.log(this.chosenDateIdTarget)
    console.log(availability)
    this.chosenDateIdTarget.value = availability[1]
  }
}
