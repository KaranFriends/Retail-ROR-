

var counter = 1;

$(document).on("click", ".add", function() {
  counter = $(this).parents().eq(1).find(".counter").html()
  counter = parseInt(counter) + 1;
  $(this).parents().eq(1).find(".counter").html(counter)
});

$(document).on("click", ".subtract", function() {
  if(counter > 1 ){
    counter = $(this).parents().eq(1).find(".counter").html()
    counter = parseInt(counter) - 1;
    $(this).parents().eq(1).find(".counter").html(counter)
  }
});
