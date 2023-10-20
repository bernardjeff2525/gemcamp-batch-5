import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["email", "copyButton"]
  // connect() {
  //   console.log('connected clipboard')
  // }

  copy() {
    // console.log('copy button click')
    navigator.clipboard.writeText(this.emailTarget.textContent)
    this.copyButtonTarget.innerText = 'copied'

    setTimeout(() => {
      this.copyButtonTarget.innerText = 'copy'
    }, "1000")
  }
}
