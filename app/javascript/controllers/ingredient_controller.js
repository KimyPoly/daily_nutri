import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredient"
export default class extends Controller {
  connect() {
  }

  toggleChecked(event) {
    event.currentTarget.previousElementSibling.classList.toggle('ingre-select')
  }
}
