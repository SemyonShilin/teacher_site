@Comment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/posts/#{@props.comment.post_id}/comments/#{@props.comment.id}"
      dataType: 'json'
      success: () =>
        @props.handleDeleteComment @props.comment
  localizedDate: (date) ->
    date = @props.comment.created_at
  render: ->
    React.DOM.div
      className: 'comments-main'
      React.DOM.div
        className: 'col-md-2 cmts-main-left'
        'Аватар'
      React.DOM.div
        className: 'col-md-10 cmts-main-right'
        React.DOM.h5 null,
#          if @props.comment.user.name then @props.comment.user.name else @props.comment.user.email
          '@props.comment.user.email '
          React.DOM.small
            style: {marginLeft: '1%'}
            @localizedDate(@props.comment.created_at)
        React.DOM.p null, @props.comment.body
        React.DOM.a
          className: 'btn btn-xs'
          'Ответить'
#        if @props.comment.user.id is @props.current_user
        React.DOM.a
          onClick: @handleDelete
          className: 'btn btn-xs'
          'Удалить'
      React.DOM.div
        className: 'clearfix'
