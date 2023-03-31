import "controllers";
import "@hotwired/turbo-rails";

import * as bootstrap from "bootstrap"

(function () {
  "use strict";
  // var topNav = document.getElementById("topNav");
  // console.log(topNav.classList);
  // window.onscroll = function () {
  //   if (document.body.scrollTop >= 200) {
  //     topNav.classList.add("nav-colored");
  //     topNav.classList.remove("nav-transparent");
  //     console.log(topNav.classList);
  //   } else {
  //     topNav.classList.add("nav-transparent");
  //     topNav.classList.remove("nav-colored");
  //     console.log(topNav.classList);
  //   }
  // };

  window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }

    };

    // Shrink the navbar
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 128,
        });
    };

});
})();
