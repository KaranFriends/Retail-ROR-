
$(document).on("click", ".add", function() {
  counter = $(this).parents().eq(2).find(".counter").html()
  counter = parseInt(counter) + 1;
  $(this).parents().eq(2).find(".counter").html(counter)
});


$(document).on("click", ".subtract", function() {
    counter = $(this).parents().eq(2).find(".counter").html()
    if(counter > 1 ){
    counter = parseInt(counter) - 1;
    $(this).parents().eq(2).find(".counter").html(counter)
  }

});
