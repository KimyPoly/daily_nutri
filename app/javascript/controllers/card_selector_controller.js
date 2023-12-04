import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-selector"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    this.toggleStyle(); // Appel de la méthode au chargement pour initier les styles
  }

  toggleStyle() {
    const checkbox = this.element.querySelector('.hidden-checkbox');

    if (checkbox.checked) {
      this.cardTargets.forEach(card => {
        card.classList.add('selected');
      });
    } else {
      this.cardTargets.forEach(card => {
        card.classList.remove('selected');
      });
    }
  }
}
