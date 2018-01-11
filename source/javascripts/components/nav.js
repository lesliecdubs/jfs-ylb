//  ==========================================================================
//
//  Nav Component
//
//  ==========================================================================
const nav = wrapperClass => () => {
  let props = {
    isEnabled: false
  }

  let els = {}

  const createChildren = () => {
    const wrapper = document.querySelector(wrapperClass)
    els = {
      wrapper
    }
  }

  const init = () => {
    createChildren()
    enable()
  }

  const enable = () => {
    if (props.isEnabled) return

    console.log('nav enabled')

    props.isEnabled = true
  }

  const disable = () => {
    if (!props.isEnabled) return

    props.isEnabled = false
  }

  const destroy = () => {
    disable()

    for (let key in props) {
      if (props.hasOwnProperty(key)) {
        props[key] = null
      }
    }

    for (let key in els) {
      if (els.hasOwnProperty(key)) {
        els[key] = null
      }
    }
  }

  return {
    init,
    enable,
    disable,
    destroy
  }
}

export default nav
