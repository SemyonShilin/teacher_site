@Comment = React.createClass
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
          '@props.comment.user.email'
          React.DOM.small
            style: {marginLeft: '1%'}
            @localizedDate(@props.comment.created_at)

#          React.DOM.h5 null, @props.comment.user.email

        React.DOM.p null, @props.comment.body
        React.DOM.div
          className: 'col-md-6 cmnts-right'
          'Ответить'
      React.DOM.div
        className: 'clearfix'
