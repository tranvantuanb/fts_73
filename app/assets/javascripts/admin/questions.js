$(document).on('turbolinks:load', function() {
  $('#subject_select').change(function() {
    var subject_id = $('#subject_select').val();
    load_questions(subject_id);
  });
});

function load_questions(subject_id){
  if($('#questions-list') !== null) $('#questions-list').remove();
  $.ajax({
    url: '/api/questions/',
    data: {
      subject_id: subject_id
    },
    method: "GET",
    success: function(result){
      $('#table-questions').append(result)
    }
  });
}
