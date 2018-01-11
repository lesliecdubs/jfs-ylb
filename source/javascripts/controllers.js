// ==========================================================================
//
//  JS Page Controllers
//
//  ==========================================================================
import { controller } from 'savnac'

import {
  nav
} from './components'

export const universal = controller({
  nav: nav('.js-nav')
})
