

const form = () => {
  const message = () => console.log('im the form')

  const init = () => {
    message()
  }

  return {
    init
  }
}

export default form
