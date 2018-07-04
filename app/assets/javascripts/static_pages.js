// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Adds the typing animation to the header of the site.
var typed = new Typed( "#typed-header", {
  strings: [
    "I am a chemical engineer.",
    "I am a self-starter.",
    "I am a life-long learner.",
    "I will save you money."
  ],

  // Options for typing configuration
  backDelay: 3000,
  backSpeed: 50,
  typeSpeed: 50,

  // Options styling loop
  loop: true,
  showCursor: true,
  smartBackspace: true
})

// Scrolls to welcome section on button click
$(function() {
  $('#about-button').click( function() {
    $('.body')[0].scrollIntoView( {
      behavior: 'smooth',
      block: 'start'
    } )
  } )
} )
