jQuery(document).ready(function() {
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
});
