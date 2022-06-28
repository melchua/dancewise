import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['field'];

  initAddressMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
  }

  initCityMap() {
    const options = {
      types: ['(cities)'],
    };
    this.autocomplete = new google.maps.places.Autocomplete(
      this.fieldTarget,
      options
    );
  }
  connect() {
    if (typeof google != 'undefined') {
      initAddressMap();
      initCityMap();
    }
  }
}
