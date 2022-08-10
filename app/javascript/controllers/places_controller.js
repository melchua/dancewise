import { Controller } from 'stimulus';
import 'tom-select';
import TomSelect from 'tom-select';

export default class extends Controller {
  static targets = ['field'];

  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    console.log('fieldTarget', this.fieldTarget);
  }
  connect() {
    if (typeof google != 'undefined') {
      initMap();
    }
  }
}

document.addEventListener('turbolinks:load', () => {
  const selectInput = document.getElementById('select-dancestyle');
  if (selectInput) {
    new TomSelect(selectInput, {
      plugins: {
        remove_button: { title: 'Remove this item' },
      },
      onItemAdd: function () {
        this.setTextboxValue('');
        this.refreshOptions();
      },
    });
  }
});
