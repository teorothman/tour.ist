import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "search", "list"]

  search() {
    fetch(`${this.formTarget.action}?query=${encodeURIComponent(this.searchTarget.value)}`, {
      method: "GET",
      headers: { "Accept": "application/json" },
    })
    .then(response => {
      return response.json();
    })
    .then(data => {
      this.listTarget.innerHTML = data.tours;
    })
    .catch(error => console.error("Error:", error));
  }
}
