
// $(window).on("load", function() {
//   $("li").on("click", function() {
//     $("li.selected").removeClass("selected");
//     $(this).addClass("selected");
//     $(".contents div").hide();
//     $("." + this.id).show();
//   });
// });

window.addEventListener("turbolinks:load", function() {
  $("li").on("click", function() {
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents div").hide();
    $("." + this.id).show(); 
  });
});