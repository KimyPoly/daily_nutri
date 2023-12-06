import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  static targets = [ "message", "form", "input" ];

  sendMessage() {
    const userInput = this.inputTarget.value.trim();
    if (userInput !== '') {
      this.displayUserMessage(userInput);

      // Exemple de réponse du bot (remplace par ta réponse réelle)
      const botResponse = `Recettes pour ${userInput} : Lasagnes, Salade César, Tarte aux pommes`;
      this.displayBotMessage(botResponse);

      this.inputTarget.value = '';
    }
  }

  displayUserMessage(message) {
    const userMessage = `<div class="message user"><span class="message-content">${message}</span></div>`;
    this.messageTarget.insertAdjacentHTML('beforeend', userMessage);
  }

  displayBotMessage(message) {
    const botMessage = `<div class="message chatbot"><span class="message-content">${message}</span></div>`;
    this.messageTarget.insertAdjacentHTML('beforeend', botMessage);
  }
}


