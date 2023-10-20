import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name"]

  connect() {
    // this.element.textContent = "Hello World!"
    // console.log(`Hello, Stimulus! ${this.element}`)
    // console.log("Hello, Stimulus", this.element)
  }

  greet() {
    console.log(this.nameTarget)
    console.log("Hello, Stimulus", this.nameTarget.value)
    alert(`Hello, Stimulus ${this.nameTarget.value}`)
    this.nameTarget.value = ""
  }
}
