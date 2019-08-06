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
    <% @cart_item.each do |cart_item| %>
      <% if cart_item.product_id == product.id %>
        <% if cart_item.quantity.to_i > 1 %>
          <% cart_item.update(quantity: (cart_item.quantity.to_i - 1)) %>
        <% end %>
      <% end %>
    <% end %>

});

$(document).getElementById("add").addEventListener("click", function(){
});
