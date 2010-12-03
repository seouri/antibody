jQuery(document).ready(function() {
  $('input#target_search_query').example('enter the target name')
  $('input#upload_target_search').example('enter the target name')
  $('input#upload_source_search').example('enter the source name')
  $("#validation_category_western_blot").click(function() {
    $('#validation_category_western_blot_example').show('slow');
    $('#validation_category_dot_blot_example').hide('slow');
    $('#validation_category_chip-chipseq_example').hide('slow');
  });
  $("#validation_category_dot_blot").click(function() {
    $('#validation_category_western_blot_example').hide('slow');
    $('#validation_category_dot_blot_example').show('slow');
    $('#validation_category_chip-chipseq_example').hide('slow');
  });
  $("#validation_category_chip-chipseq").click(function() {
    $('#validation_category_western_blot_example').hide('slow');
    $('#validation_category_dot_blot_example').hide('slow');
    $('#validation_category_chip-chipseq_example').show('slow');
  });
  $('#validation_conditions_example').show();
});
