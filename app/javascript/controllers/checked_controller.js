import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked"
export default class extends Controller {

  static targets = ["wrapper"]

  connect() {
    const radioButtons = document.querySelectorAll(".btn-program:not(.allergie-button)")
    if (radioButtons) {
      radioButtons.forEach((button) => {
        button.addEventListener("click", this.check)
      })
    }

    const checkedButtons = document.querySelectorAll(".allergie-button")
    if (checkedButtons) {
      checkedButtons.forEach((button) => {
        button.addEventListener("click", this.checkbox)
      })
    }

  }

  check(event) {
    const input = event.currentTarget.children[0]
    input.checked = true;
  }

  checkbox(event) {
    const input = event.currentTarget.children[0]
    input.checked = !input.checked
  }
}
