import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["field"];

  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    console.log("fieldTarget", this.fieldTarget);
  }
  connect() {
    if (typeof google != "undefined") {
      initMap();
    }
  }
}
