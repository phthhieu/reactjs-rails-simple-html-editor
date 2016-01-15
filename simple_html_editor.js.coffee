@SimpleHtmlEditor = React.createClass
  componentDidMount: ->
    @_turnOnDesignMode()
    @_updateDefaultValue()

  render: ->
    React.DOM.div
      className: 'simple-html-editor-widget'
      @_renderTextArea()
      @_renderControls()
      @_renderIFrame()

  getInnerHtml: ->
    # Clear all element's css
    $(@_iframeDocument().body).find('*').removeAttr('style')
    @_iframeDocument().body.innerHTML

  getText: ->
    @_iframeDocument().body.textContent

  clear: ->
    @_iframeDocument().body.innerHTML = ''

  _renderTextArea: ->
    React.DOM.textarea
      ref: 'textArea'
      style:
        display: 'none'

  _renderControls: ->
    React.DOM.div
      style:
        background: '#D2D2D2'
        color: '#666666'
        fontSize: 14
        fontWeight: 700
      React.DOM.input
        type: 'button'
        value: 'B'
        onClick: @_iBold
        tabIndex: '10'
        style:
          background: 'transparent'
          border: 0
          padding: '3px 10px'
          fontFamily: 'Helvetica Neue, arial, sans-serif'
      React.DOM.input
        type: 'button'
        value: 'I'
        onClick: @_iItalic
        tabIndex: '11'
        style:
          background: 'transparent'
          border: 0
          padding: '3px 12px'
          fontStyle: 'italic'
          fontWeight: 300
          fontFamily: 'Georgia, arial, sans-serif'
      React.DOM.input
        onClick: @_iOrderedList
        tabIndex: '12'
        style:
          padding: 6
          verticalAlign: 'middle'
        'OL'
      React.DOM.input
        href: '#'
        onClick: @_iUnorderedList
        tabIndex: '13'
        style:
          padding: 6
          verticalAlign: 'middle'
        'UL'

  _renderIFrame: ->
    React.DOM.iframe
      ref: 'iframe'
      style:
        border: 0
        width: '100%'
        height: 116
        background: '#F2F2F2'

  _turnOnDesignMode: ->
    @_iframeDocument().designMode = 'On'

  _updateDefaultValue: ->
    @_iframeDocument().body.innerHTML = @props.defaultValue

  _iframeEle: ->
    ReactDOM.findDOMNode(@refs.iframe)

  _iframeContentWindow: ->
    @_iframeEle().contentWindow

  _iframeDocument: ->
    @_iframeContentWindow().document

  _iBold: ->
    @_iframeDocument().execCommand('bold', false, null)

  _iItalic: ->
    @_iframeDocument().execCommand('italic', false, null)

  _iUnorderedList: ->
    @_iframeDocument().execCommand('insertUnorderedList', false, null)

  _iOrderedList: ->
    @_iframeDocument().execCommand('insertOrderedList', false, null)
