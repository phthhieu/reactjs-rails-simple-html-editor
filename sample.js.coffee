@Sample = React.createClass
  render: ->
    React.DOM.div
      className: 'sample-widget'
      React.createElement(SimpleHtmlEditor, defaultValue: 'This is default value content for editor')
