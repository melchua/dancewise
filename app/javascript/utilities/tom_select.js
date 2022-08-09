import 'tom-select'
import TomSelect from "tom-select"

document.addEventListener("turbolinks:load", () => {
  const selectInput = document.getElementById('select-dancestyle')
  if (selectInput) {
    new TomSelect(selectInput, {
      plugins: {
        'checkbox_options':{},
        'remove_button':{ title:'Remove this item', },
      },
  		onItemAdd:function(){
  			this.setTextboxValue('');
  			this.refreshOptions();
  		},
      persist: false,

    //   onDelete: function(values) {
    //     return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
    //   }
    })
  }
})

document.addEventListener("turbolinks:load", () => {
    const selectInput = document.getElementById('select-artist')
    if (selectInput) {
      new TomSelect(selectInput, {
        plugins: {
          'checkbox_options':{},
          'remove_button':{ title:'Remove this artist', },
        },
            onItemAdd:function(){
                this.setTextboxValue('');
                this.refreshOptions();
            },
        persist: false,
  
        // onDelete: function(values) {
        //   return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' artists?' : 'Are you sure you want to remove "' + values[0] + '"?');
        // }
      })
    }
  })