import { Application } from "@hotwired/stimulus"
import CheckedButtonController from "./checked_button_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

Stimulus.register("checked-button", CheckedButtonController);

export { application }
