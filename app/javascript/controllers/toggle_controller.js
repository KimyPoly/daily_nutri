import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    const url = window.location.href;
    console.log(url);
    const regex = new RegExp('options');
    const requestDone = regex.test(url);
    if (requestDone) {
      this.action()
      this.formTarget.scrollIntoView(true);
    }
  }

  action() {
    this.formTarget.classList.toggle("display-none");
  }
}
