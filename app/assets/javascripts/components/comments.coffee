@Comments = React.createClass
  getInitialState: ->
    comments: @props.data.comments
    post_id: @props.data.post_id
    user_id: @props.data.current_user
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.unshift comment
    @setState comments: comments
  render: ->
    React.DOM.div null,
      React.DOM.div
        className: 'leave'
        React.DOM.h4 null,
          'Оставить комментарий'
      React.createElement CommentForm, handleNewComment: @addComment, post_id: @state.post_id, user_id: @state.user_id
      React.DOM.div
        className: 'comments1'
        React.DOM.h4 null,
          'Комментарии'
        if @state.comments.length
          for comment in @state.comments
            React.createElement Comment, key: comment.id, comment: comment
        else
          React.DOM.div
            className: 'alert alert-success'
            'К этой статье пока не оставили ни одного комментария.'

