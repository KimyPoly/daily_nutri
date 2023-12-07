import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

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
    this.maxMeals = this.daysValue * this.mealsDayValue;
    this.alertCaloriesShown = false;
  }

  initialize() {

  }
  alert(countMeal, maxMeals){
    if (countMeal == maxMeals) {
      Swal.fire("You've selected enough meals")
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
    this.compareCalories(this.totalCalories, this.caloriesGoalValue);
  }

  compareCalories(selectedCalories, totalCalories) {
    if (selectedCalories > totalCalories) {
      if (!this.alertCaloriesShown) {
        Swal.fire("You're above the recommended calories goal for your program");
        this.alertCaloriesShown = true;
      }
    } else {
      this.alertCaloriesShown = false;
    }
  }
}
