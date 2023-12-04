import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked"
export default class extends Controller {

  static targets = ["card", "caloriesTotal"]
  static values = {
    caloriesGoal: Number
  }

  connect() {
    this.totalCalories = 0;
  }

  initialize() {

  }

  updateCalories(event) {
    const cardClicked = event.currentTarget;
    cardClicked.classList.toggle('selected');
    const calories = cardClicked.dataset.calories;
    const checkbox = cardClicked.querySelector('input[type="checkbox"]');
    if (cardClicked.classList.contains('selected')) {
      this.totalCalories += Number.parseInt(calories);
      checkbox.checked = true;
    } else {
      this.totalCalories -= Number.parseInt(calories);
      checkbox.checked = false;
    }

    this.caloriesTotalTarget.textContent = this.totalCalories;
    this.compareCalories(this.totalCalories, this.caloriesGoalValue);
  }

  compareCalories(selectedCalories, totalCalories) {
    if (selectedCalories > totalCalories) {
      alert("You're above the recommended calories goal for your program")
    }
  }
}
