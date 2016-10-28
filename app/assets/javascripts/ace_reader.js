
// This will load the read only text edior on codes page
prepareReadonly();


// --------- Setup readonly ace editor -------------
function prepareReadonly(){
// This turns div with readonly-editor tag to readonly editor
  $('.readonly-editor').each(function() {
    var container = $(this);
    // var mode = container.data('mode');
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

    editor = ace.edit(editDiv[0]);

    editor.setFontSize('14px');
    editor.setTheme('ace/theme/monokai');

    editor.setReadOnly(true);// this makes the textarea display only

    // this will read from h1 html content and change syntax accordingly
    editor.getSession().setMode('ace/mode/'+ $('#languageName h1').html().toLowerCase());
    editor.getSession().setValue(editorArea.val());

    // save back to the textarea when submit
    // editorArea.closest('form').submit(function() {
    //   editorArea.val(editor.getSession().getValue());
    // });
  });
};
