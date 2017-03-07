@Comment = React.createClass
  getInitialState: ->
    edit: false
    current_user: @props.current_user
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleEdit: (e) ->
    e.preventDefault()
    data =
      body: ReactDOM.findDOMNode(@refs.body).value
      post_id: @props.comment.post_id
      user_id: @props.comment.user_id
    $.ajax
      method: 'PUT'
      url: "/posts/#{ @props.comment.post_id }/comments/#{ @props.comment.id }"
      dataType: 'json'
      data:
        comment: data
      success: (data) =>
        @setState edit: false
        @props.handleEditComment @props.comment, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/posts/#{@props.comment.post_id}/comments/#{@props.comment.id}"
      dataType: 'json'
      success: () =>
        @props.handleDeleteComment @props.comment
  commentRow: ->
    React.DOM.div
      className: 'comments-main'
      React.DOM.div
        className: 'col-md-2 cmts-main-left'
        'Аватар'
      React.DOM.div
        className: 'col-md-10 cmts-main-right'
        React.DOM.h5 null,
          if @props.comment.user.name then @props.comment.user.name else @props.comment.user.email
          React.DOM.small
            style: {marginLeft: '1%'}
            @props.comment.created_at
        React.DOM.p null, @props.comment.body
        React.DOM.div
          className: 'row'
#          React.DOM.div
#            className: 'col-md-4'
#            React.DOM.a
#              className: 'btn btn-xs'
#              'Ответить'
          if @props.comment.user_id is @state.current_user
            React.DOM.div
              className: 'col-md-8'
              React.DOM.a
                className: 'btn btn-xs'
                onClick: @handleToggle
                'Редактировать'

              React.DOM.a
                className: 'btn btn-xs p'
                onClick: @handleDelete
                'Удалить'
      React.DOM.div
        className: 'clearfix'
  commentForm: ->
    React.DOM.div
      className: 'comments-main'
      React.DOM.div
        className: 'col-md-2 cmts-main-left'
        'Аватар'
      React.DOM.div
        className: 'col-md-10 cmts-main-right'
        React.DOM.h5 null,
          if @props.comment.user.name then @props.comment.user.name else @props.comment.user.email
          React.DOM.small
            style: {marginLeft: '1%'}
            @props.comment.created_at
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.comment.body
          ref: 'body'
        React.DOM.a
          className: 'btn btn-xs'
          onClick: @handleEdit
          'Обновить'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Отмена'
      React.DOM.div
        className: 'clearfix'
  render: ->
    if @state.edit
      @commentForm()
    else
      @commentRow()

