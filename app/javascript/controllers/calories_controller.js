import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked"
export default class extends Controller {

  static targets = ["card", "caloriesTotal"]
  static values = {
    caloriesGoal: Number
  }

  connect() {

  }

  initialize() {
    this.totalCalories = 0;
  }

  updateCalories() {
    this.totalCalories = 0;
    this.cardTargets.forEach((card) => {
      const checkbox = card.querySelector('input[type="checkbox"]');
      const calories = card.querySelector('.meal-calories');
      if (checkbox.checked) {
        const caloriesValue = parseInt(calories.innerText.split(" ")[1]);
        this.totalCalories += caloriesValue;
      }

    });
    this.caloriesTotalTarget.textContent = this.totalCalories;
    this.compareCalories(this.totalCalories, this.caloriesGoalValue);
  }

  compareCalories(selectedCalories, totalCalories) {
    if (selectedCalories > totalCalories) {
      alert("You're above the recommended calories goal for your program")
    }
  }
}
