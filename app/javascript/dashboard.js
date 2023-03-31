// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { dashboard } from "controllers/dashboard"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import "controllers"
import "@hotwired/turbo-rails"

import * as bootstrap from "bootstrap";
eagerLoadControllersFrom("dashboard", dashboard)

const sidebarNavWrapper = document.querySelector(".sidebar-nav-wrapper");
const mainWrapper = document.querySelector(".main-wrapper");
const menuToggleButton = document.querySelector("#menu-toggle");
const menuToggleButtonIcon = document.querySelector("#menu-toggle i");
const overlay = document.querySelector(".overlay");

menuToggleButton.addEventListener("click", () => {
  sidebarNavWrapper.classList.toggle("active");
  overlay.classList.add("active");
  mainWrapper.classList.toggle("active");

  if (document.body.clientWidth > 1200) {
    if (menuToggleButtonIcon.classList.contains("bi-caret-left")) {
      menuToggleButtonIcon.classList.remove("bi-caret-left");
      menuToggleButtonIcon.classList.add("bi-list");
    } else {
      menuToggleButtonIcon.classList.remove("bi-list");
      menuToggleButtonIcon.classList.add("bi-caret-left");
    }
  } else {
    if (menuToggleButtonIcon.classList.contains("bi-caret-left")) {
      menuToggleButtonIcon.classList.remove("bi-caret-left");
      menuToggleButtonIcon.classList.add("bi-list");
    }
  }
});
overlay.addEventListener("click", () => {
  sidebarNavWrapper.classList.remove("active");
  overlay.classList.remove("active");
  mainWrapper.classList.remove("active");
});
