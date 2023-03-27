import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "availabilities" ]

  connect() {
    console.log("hello")
    flatpickr(this.availabilitiesTarget, {
      mode: 'multiple',
      dateFormat:'Y-m-d',
      minDate: 'today'
    })
  }
}
