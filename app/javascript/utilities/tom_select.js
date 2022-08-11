import 'tom-select';
import TomSelect from 'tom-select';

document.addEventListener('turbolinks:load', () => {
  const selectInput = document.getElementById('select-dancestyle');
  if (selectInput) {
    new TomSelect(selectInput, {
      plugins: {
        remove_button: { title: 'Remove this item' },
      },
      onItemAdd: function() {
        this.setTextboxValue('');
        this.refreshOptions();
      },
    });
  }
});

document.addEventListener('turbolinks:load', () => {
  const selectInput = document.getElementById('select-artist');
  if (selectInput) {
    new TomSelect(selectInput, {
      plugins: {
        remove_button: { title: 'Remove this artist' },
      },
      onItemAdd: function() {
        this.setTextboxValue('');
        this.refreshOptions();
      },
    });
  }
});
