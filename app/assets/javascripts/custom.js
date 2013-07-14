$(document).on('change', '#switch_workspace select', function () {
  // alert( 'selected: ' + $(this).val() ); //.find(':selected').text()
  var workspace_id = $(this).val();
  var url = 'http://localhost:3000/workspaces/'+ workspace_id +'/projects';
  $(this).closest('form').attr('action', url);
  $(this).closest('form').submit();
})
