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

      // const checkbox = card.querySelector('input[type="checkbox"]');
      const cardClicked = event.currentTarget;
      cardClicked.classList.toggle('selected')
      // console.log(cardClicked);
      const calories = cardClicked.dataset.calories;
      if (cardClicked.classList.contains('selected')){
        this.totalCalories += Number.parseInt(calories);
      } else {
        this.totalCalories -= Number.parseInt(calories);
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
