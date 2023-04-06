# frozen_string_literal: true

# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
# pin "@rails/activestorage", to: "activestorage.esm.js"

# Use npm packages from a JavaScript CDN by running ./bin/importmap

pin 'application'
pin 'devise'
pin 'dashboard'
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
# pin 'bootstrap/icons', to: 'https://ga.jspm.io/npm:bootstrap-icons@1.9.1/font/bootstrap-icons.css'
pin 'stimulus', to: 'stimulus.js', preload: false # proxy for @hotwired/stimulus
pin 'stimulus-password-visibility', to: 'https://ga.jspm.io/npm:stimulus-password-visibility@1.1.1/dist/stimulus-password-visibility.es.js'
