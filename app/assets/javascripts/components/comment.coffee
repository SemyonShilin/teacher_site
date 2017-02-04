@Comment = React.createClass
  render: ->
    React.DOM.div
      className: 'row comments-main'
      React.DOM.div
        className: 'col-md-12 text-center'
#        React.DOM.h5 null, @props.comment.user.email
        React.DOM.div null, @props.comment.created_at
        React.DOM.div null, @props.comment.body
        React.DOM.div
          className: 'clearfix'
