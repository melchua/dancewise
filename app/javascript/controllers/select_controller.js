import { Controller } from 'stimulus';

import 'tom-select';
import TomSelect from 'tom-select';

export default class extends Controller {
  connect() {
    console.log('tom_select_controller connected');

    const selectInput = document.getElementById('select-tags');
    if (selectInput) {
      new TomSelect(selectInput, {});
    }
  }
}
