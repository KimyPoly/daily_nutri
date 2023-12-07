import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form", "loading"]

  connect() {
    const url = window.location.href;
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

  waitingResponse() {
    console.log("Hihiiiiiiiiii")
    this.loadingTarget.style.display = '';

  }
}
