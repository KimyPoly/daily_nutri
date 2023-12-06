import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-selector"
export default class extends Controller {

  connect() {

  }

  toggleStyle() {
    this.cardTargets.forEach(card => {
      card.classList.add("active");

      const programPath = card.dataset.programPath;
      if (programPath) {
        window.location.href = programPath;
      }
    });
  }
}
