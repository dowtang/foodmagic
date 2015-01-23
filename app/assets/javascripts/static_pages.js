// # All this logic will automatically be available in application.j# Place all the behaviors and hooks related to the matching controller here.
// s.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

  $("#button-locations").click(function(){
    // alert("cuisines works");
    // when user clicks on cuisines, i want to......
    // hide locations and show cuisines
    $("#tab-cuisines").hide();
    $("#tab-reviews").hide();
    $("#tab-locations").show();
  });


  $("#button-cuisines").click(function(){
    // alert("cuisines works");
    // when user clicks on cuisines, i want to......
    // hide locations and show cuisines
    $("#tab-locations").hide();
    $("#tab-reviews").hide();
    $("#tab-cuisines").show();
  });

  $("#button-reviews").click(function(){
    // alert("cuisines works");
    // when user clicks on cuisines, i want to......
    // hide locations and show cuisines
    $("#tab-locations").hide();
    $("#tab-cuisines").hide();
    $("#tab-reviews").show();
  });



});

