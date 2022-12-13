import { Application } from "@hotwired/stimulus"

const dashboard = Application.start()

dashboard.warnings = true
dashboard.debug    = true
window.Stimulus    = dashboard

export { dashboard }
