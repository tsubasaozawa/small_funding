$(document).on('turbolinks:load', function() {
  var category_list, category_string, error, i, len, results, tag;
  $('#project-tags').tagit({
    fieldName: 'category_list',
    singleField: true
  });
  $('#project-tags').tagit();
  category_string = $("#category_hidden").val();
  try {
    category_list = category_string.split(',');
    results = [];
    for (i = 0, len = category_list.length; i < len; i++) {
      tag = category_list[i];
      results.push($('#project-tags').tagit('createTag', tag));
    }
    return results;
  } catch (_error) {
    error = _error;
  }
});