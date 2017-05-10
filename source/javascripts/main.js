import form from './modules/form'

const main = () => {
  const modules = {form}

  const initModules = () => {
    for (let k in modules) {
      if (modules.hasOwnProperty(k)) {
        if (!modules[k].init) modules[k] = modules[k]()

        modules[k].init()
      }
    }
  }

  const init = () => {
    initModules()
  }

  return {
    init
  }
}

export default main
