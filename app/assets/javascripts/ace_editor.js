

// -------------- Page Initial Load ------------
// Setup the ace editor when the web page first loads
prepareEditor('javascript');


// ------------- Select Syntax -----------------
// Change the ace editor syntax upon syntax being selected from
// the drop down list
$('#code_language_id').on('change', function() {
    // Initial attempt, setting the data-mode in html
    // $('#index-editor').attr('data-mode', 'ruby');
    var selectedSyn = $(this).find("option:selected").html().toLowerCase();
    // Grab the current ace editor and set its mode to ruby(for now)
    var editorArea = $('.source-editor textarea');
    var editDiv = $('.ace_editor');
    var editor = ace.edit(editDiv[0]);
    editor.getSession().setMode('ace/mode/' + selectedSyn);
    editorArea.closest('form').submit(function() {
      editorArea.val(editor.getSession().getValue());
    });
});


// ------- Setup editable ace editor -------------

// Ace editor setup function, takes a string for setting its mode
function prepareEditor (lang) {
  $('.source-editor').each(function() {
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

    var editor = ace.edit(editDiv[0]);

    editor.setFontSize('14px');
    editor.setTheme('ace/theme/monokai');
    editor.getSession().setMode('ace/mode/' + lang);
    editor.getSession().setValue(editorArea.val());

    // save back to the textarea when submit
    editorArea.closest('form').submit(function() {
      editorArea.val(editor.getSession().getValue());
    });
  });
};