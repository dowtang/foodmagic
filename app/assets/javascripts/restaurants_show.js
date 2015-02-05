// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){

  $(".append-to").on('click',function () {
    // var dow = $(this).attr("data-price");
    
    var name = $(this).data("name-size");
    // var size = $(this).data("size");
    var price = $(this).data("price");
     
    // console.log(dow);
    // $('.row.your-order-head').append(dow);
    $('#order-table > tbody').append('<tr class="your-order-body"><td class="col-xs-9">'+ name +'</td><td class="col-xs-3">'+ price +'</td></tr>');
  
  });
  
  $("#menu-button-menu").click(function(){
    
    $("#tab-reviews").hide();
    $("#tab-info").hide();
    $("li").removeClass("active");
    $("#tab-menu").show();
    $("li#menu-button-menu").addClass("active");
  });


  $("#menu-button-reviews").click(function(){
    
    $("#tab-menu").hide();
    $("#tab-info").hide();
    $("li").removeClass("active");
    $("#tab-reviews").show();
    $("li#menu-button-reviews").addClass("active");
    
  });

  $("#menu-button-info").click(function(){
    
    $("#tab-menu").hide();
    $("#tab-reviews").hide();
    $("li").removeClass("active");
    $("#tab-info").show();
    $("li#menu-button-info").addClass("active");
    
  });



});

