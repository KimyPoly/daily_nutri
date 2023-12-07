import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-selector"
export default class extends Controller {

  connect() {

  }

  toggleStyle() {

    const programPath = card.dataset.programPath;
    if (programPath) {
      window.location.href = programPath;
    }
  }
}
