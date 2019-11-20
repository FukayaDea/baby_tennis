$(window).on("turbolinks:load", function() {
  if ($('#comment_submit').val().length == 0) {
    $('#submit_btn').prop('disabled', true);
  }
  $('#comment_submit').on('keydown keyup keypress change', function() {
    if ( $(this).val().length > 0 ) {
      $('#submit_btn').prop('disabled', false);
    } else {
      $('#submit_btn').prop('disabled', true);
    }
  });
});