

var counter = 1;

$(document).on("click", ".add", function() {
  counter = counter + 1;
  $(".counter").html(counter);
});

$(document).on("click", ".subtract", function() {
  if(counter > 1 ){
  counter = counter - 1;
  $(".counter").text(counter);
  }
});
