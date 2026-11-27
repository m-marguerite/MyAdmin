import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  toggle(event) {
    console.log("hello from controller")
    console.log(event.target);
  }
}
