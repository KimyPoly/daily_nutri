import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked"
export default class extends Controller {

  static targets = ["wrapper"]

  connect() {
    const buttons = document.querySelectorAll(".btn-program")
    if (buttons) {
      buttons.forEach((button) => {
        button.addEventListener("click", this.check)
      })
    }
  }

  check(event) {
    const input = event.currentTarget.children[0]
    input.checked = true;
  }
}
