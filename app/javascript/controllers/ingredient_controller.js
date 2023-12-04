import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredient"
export default class extends Controller {
  static targets = ["ingredient"];
  connect() {
    this.updateCheckedIngredients();
  }
  updateCheckedIngredients() {
    this.ingredientTargets.forEach(ingredient => {
      const checkbox = ingredient.querySelector(".ingredient-checkbox");
      checkbox.checked = ingredient.classList.contains("checked");
    });
  }

  toggleChecked(event) {
    const ingredient = event.currentTarget;
    ingredient.classList.toggle("checked");

    // Récupérer l'ID ou le nom de l'ingrédient pour envoyer au backend
    const ingredientName = ingredient.dataset.ingredient;
    // Effectuer une requête AJAX ou une action pour mettre à jour l'état dans le backend
    // Utilisez cette information pour marquer l'ingrédient comme acheté

    // Mettre à jour l'état des ingrédients cochés
    this.updateCheckedIngredients();
  }
}

