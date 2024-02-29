import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "search", "list"]

  search() {
    console.log("Search triggered"); // Check if the method is called
    fetch(`${this.formTarget.action}?query=${encodeURIComponent(this.searchTarget.value)}`, {
      method: "GET",
      headers: { "Accept": "application/json" },
    })
    .then(response => {
      console.log("Got response", response);
      return response.json();
    })
    .then(data => {
      console.log("Data received", data); // Inspect the received data
      this.listTarget.innerHTML = data.tours;
    })
    .catch(error => console.error("Error:", error));
  }
}
