//  ==========================================================================
//
//  Run app
//
//  ==========================================================================
import main from './main'
import Barba from 'barba.js'
window.Barba = Barba

document.addEventListener('DOMContentLoaded', () => {
  window.APP = window.APP || main()
  window.APP.init()
  Barba.Pjax.start()

  window.Barba.Dispatcher.on('initStateChange', () => {
    window.APP.disable()
  })

  window.Barba.Dispatcher.on('transitionCompleted', () => {
    window.APP.init()
  })
})
