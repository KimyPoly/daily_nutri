import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredient"
export default class extends Controller {
  connect() {
  }

  toggleChecked(event) {
    console.log(event.currentTarget.nextElementSibling);
    event.currentTarget.nextElementSibling.classList.toggle('ingre-select')
  }
}
