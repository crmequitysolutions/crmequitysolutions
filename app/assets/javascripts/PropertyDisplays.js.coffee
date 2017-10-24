@PropertyDisplay = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.PropertyDisplay.Address
      React.DOM.td null, @props.PropertyDisplay.owner
      React.DOM.td null, @props.PropertyDisplay.contactInfo
      React.DOM.td null, @props.PropertyDisplay.value