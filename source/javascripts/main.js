//  ==========================================================================
//
//  App Setup
//
//  ==========================================================================
import { breakpoint } from 'savnac'
import { kebabCase } from 'lodash'
import UAParser from 'ua-parser-js'
import * as controllers from './controllers'

const main = () => {
  const parsed = new UAParser(navigator.userAgent)

  let props = {
    universalController: controllers.universal,
    currentController: null,
    breakpoint: breakpoint(),
    os: kebabCase(parsed.getOS().name),
    browser: kebabCase(parsed.getBrowser().name)
  }

  document.body.classList.add(props.browser)
  document.body.classList.add(props.os)

  const init = () => {
    const pageRouter = Barba.Pjax.Dom.getContainer().dataset.router
    const nextController = controllers[pageRouter]

    props.universalController.init()

    if (!!nextController) {
      props.currentController = nextController
      props.currentController.init()
    }

    props.breakpoint.enable()

    // add GA pageview tracking
    // ga('send', {
    //   hitType: 'pageview',
    //   page: window.location.pathname,
    //   location: window.location.href
    // })
  }

  const disable = () => {
    if (props.currentController) {
      props.currentController.disable()
    }

    props.universalController.disable()
    props.currentController = null
  }

  return {
    init,
    disable,
    breakpoint: props.breakpoint
  }
}

export default main
