// Javascript starts here
import main from './main'

document.addEventListener('DOMContentLoaded', () => {
  window.APP = window.APP || main()
  window.APP.init()
})

