// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { dashboard } from "controllers/dashboard"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import * as bootstrap from "bootstrap";
eagerLoadControllersFrom("dashboard", dashboard)

const body = document.querySelector("body"),
  sidebar = body.querySelector("nav"),
  toggle = body.querySelector(".toggle");

toggle.addEventListener("click", () => {
  sidebar.classList.toggle("close");
});

window.addEventListener('resize', () => {
  if (window.innerWidth > 824) {
    sidebar.classList.remove('close')
  } else {
    sidebar.classList.add('close')
  }
});
