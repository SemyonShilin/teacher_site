@Comments = React.createClass
  getInitialState: ->
    comments: @props.data
  getDefaultProps: ->
    comments: []
  render: ->
    className: 'comments'
    React.DOM.h2
      className: 'title'
      'Comments'
    React.DOM.div
      className: 'comments1'
      for comment in @state.comments
        React.createElement Comment, key: comment.id, comment: comment
