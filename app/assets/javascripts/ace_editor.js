// var editor = ace.edit('aceEditor');
// var textArea = $('textarea[name="code[code]"]');
// editor.setTheme("ace/theme/monokai");
// editor.getSession().setMode("ace/mode/javascript");
// editor.getSession().on('change', function(){
//   textarea.val(editor.getSession().getValue());
// });

// This turns div .source-editor to editable editor
$('.source-editor').each(function() {
  var container = $(this);
  var mode = container.data('mode');
  var editorArea = container.find('textarea');

  // build a edit div for ACE since ACE can't load in a textarea
  var editDiv = $('<div>', {
    position: 'absolute',
      width: editorArea.width(),
      height: editorArea.height(),
      'class': editorArea.attr('class')
    }).insertBefore(editorArea);
  // no need to display textarea
  editorArea.css('display', 'none');

  var editor = ace.edit(editDiv[0]);

  editor.setFontSize('14px');
  editor.setTheme('ace/theme/monokai');
  // editor.setReadOnly(true);// this makes the textarea display only
  editor.getSession().setMode('ace/mode/javascript');
  editor.getSession().setValue(editorArea.val());

  // save back to the textarea when submit
  editorArea.closest('form').submit(function() {
    editorArea.val(editor.getSession().getValue());
  });
});

// This turns div with readonly-editor tag to readonly editor
$('.readonly-editor').each(function() {
  var container = $(this);
  var mode = container.data('mode');
  var editorArea = container.find('textarea');

  // build a edit div for ACE since ACE can't load in a textarea
  var editDiv = $('<div>', {
    position: 'absolute',
      width: editorArea.width(),
      height: editorArea.height(),
      'class': editorArea.attr('class')
    }).insertBefore(editorArea);
  // no need to display textarea
  editorArea.css('display', 'none');

  var editor = ace.edit(editDiv[0]);

  editor.setFontSize('14px');
  editor.setTheme('ace/theme/monokai');
  editor.setReadOnly(true);// this makes the textarea display only
  editor.getSession().setMode('ace/mode/'+ mode);
  editor.getSession().setValue(editorArea.val());

  // save back to the textarea when submit
  editorArea.closest('form').submit(function() {
    editorArea.val(editor.getSession().getValue());
  });
});
