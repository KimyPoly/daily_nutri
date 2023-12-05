import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-selector"
export default class extends Controller {
  static targets = ["card"];

  connect() {

  }

  toggleStyle(event) {
    // console.log(event.currentTarget);
    event.currentTarget.classList.toggle('selected')
    // const checkbox = this.element.querySelector('.hidden-checkbox');

    // if (checkbox.checked) {
    //   this.cardTargets.forEach(card => {
    //     card.classList.add('selected');
    //   });
    // } else {
    //   this.cardTargets.forEach(card => {
    //     card.classList.remove('selected');
    //   });
    // }
  }
}
