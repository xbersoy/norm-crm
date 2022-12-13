import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = true
window.Stimulus      = application

console.log(this);
export { application }
