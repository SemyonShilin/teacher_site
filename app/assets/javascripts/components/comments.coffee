@Comments = React.createClass
  getInitialState: ->
    comments: @props.data.comments
    post_id: @props.data.post_id
    user_id: @props.data.current_user.id
    current_user_ban: @props.data.current_user.banned
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = React.addons.update(@state.comments, { $unshift: [comment] })
    @setState comments: comments
  updateComment: (comment, data) ->
    index = @state.comments.indexOf comment
    comments = React.addons.update(@state.comments, { $splice: [[index, 1, data]] })
    @replaceState comments: comments
  deleteComment: (comment) ->
    index = @state.comments.indexOf comment
    comments = React.addons.update(@state.comments, { $splice: [[index, 1]] })
    @replaceState comments: comments
  render: ->
    React.DOM.div null,
      React.DOM.div
        className: 'leave'
        React.DOM.h4 null,
          'Оставить комментарий'
      React.createElement CommentForm, handleNewComment: @addComment, post_id: @state.post_id, user_id: @state.user_id, current_user_ban: @state.current_user_ban
      React.DOM.div
        className: 'comments1'
        React.DOM.h4 null,
          'Комментарии'
        if @state.comments.length
          for comment in @state.comments
            React.createElement Comment, key: comment.id, comment: comment, current_user: @state.user_id, handleDeleteComment: @deleteComment, handleEditComment: @updateComment
        else
          React.DOM.div
            className: 'alert alert-success'
            'К этой статье пока не оставили ни одного комментария.'

