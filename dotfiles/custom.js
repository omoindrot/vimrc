// Configure CodeMirror Keymap
require([
  'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
  // Map jk to <Esc>
  CodeMirror.Vim.map("jk", "<Esc>", "insert");
  CodeMirror.Vim.map("Jk", "<Esc>", "insert");
  CodeMirror.Vim.map("jK", "<Esc>", "insert");
  CodeMirror.Vim.map("JK", "<Esc>", "insert");
});

// Configure Jupyter Keymap
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Allow Ctrl-M to change the cell mode into Markdown in Vim normal mode
    km.edit_shortcuts.add_shortcut('ctrl-M', 'vim-binding:change-cell-to-markdown', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});
