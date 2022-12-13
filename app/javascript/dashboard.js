// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { dashboard } from "controllers/dashboard"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import * as bootstrap from "bootstrap";
eagerLoadControllersFrom("dashboard", dashboard)

const body = document.querySelector("body"),
  sidebar = body.querySelector("nav"),
  toggle = body.querySelector(".toggle"),
  modeSwitch = body.querySelector(".toggle-switch"),
  modeText = body.querySelector(".mode-text");

toggle.addEventListener("click", () => {
  sidebar.classList.toggle("close");
});

modeSwitch.addEventListener("click", () => {
  body.classList.toggle("dark");

  if (body.classList.contains("dark")) {
    modeText.innerText = "Light mode";
  } else {
    modeText.innerText = "Dark mode";
  }
});
