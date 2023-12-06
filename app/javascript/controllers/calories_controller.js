import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked"
export default class extends Controller {

  static targets = ["card", "caloriesTotal"]
  static values = {
    caloriesGoal: Number,
    days: Number,
    mealsDay: Number,
    minCalorie: Number
  }

  connect() {
    this.totalCalories = 0;
    this.countMeal = 0;
    this.maxMeals = this.daysValue * this.mealsDayValue
  }

  initialize() {

  }
  alert(countMeal, maxMeals){
    if (countMeal == maxMeals) {
      alert("You've selected enough meals")
    }
  }
  updateCalories(event) {
    const cardClicked = event.currentTarget;
    cardClicked.classList.toggle('selected');
    const calories = cardClicked.dataset.calories;
    const checkbox = cardClicked.querySelector('input[type="checkbox"]');
    if (cardClicked.classList.contains('selected')) {
      this.totalCalories += Number.parseInt(calories);
      checkbox.checked = true;
      this.countMeal += 1;
    } else {
      this.totalCalories -= Number.parseInt(calories);
      checkbox.checked = false;
      this.countMeal += 1
    }
    this.alert(this.countMeal, this.maxMeals)

    this.caloriesTotalTarget.textContent = this.totalCalories;
    console.log(this.caloriesGoalValue, this.totalCalories)
    console.log(this.minCalorieValue);
    if (this.totalCalories - this.minCalorieValue < this.caloriesGoalValue) {
      this.compareCalories(this.totalCalories, this.caloriesGoalValue);
    }
  }

  compareCalories(selectedCalories, totalCalories) {
    if (selectedCalories > totalCalories) {
      console.log("This is working");
      alert("You're above the recommended calories goal for your program")
    }
  }
}
