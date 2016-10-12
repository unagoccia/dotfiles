atom.commands.add 'atom-text-editor', 'my:move-up', ->
    editor = atom.workspace.getActiveTextEditor()
    atom.commands.dispatch(atom.views.getView(editor), 'autocomplete-plus:cancel')
    atom.commands.dispatch(atom.views.getView(editor), 'core:move-up')

atom.commands.add 'atom-text-editor', 'my:move-down', ->
    editor = atom.workspace.getActiveTextEditor()
    atom.commands.dispatch(atom.views.getView(editor), 'autocomplete-plus:cancel')
    atom.commands.dispatch(atom.views.getView(editor), 'core:move-down')
