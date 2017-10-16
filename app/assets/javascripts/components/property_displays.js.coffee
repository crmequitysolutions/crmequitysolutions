@property_displays = React.createClass
  getInitialState: ->
    property_displays: @props.data
  getDefaultProps: ->
    property_displays: []
  render: ->
    React.DOM.div
      className: 'property_displays'
      React.DOM.h1
        className: 'title'
        'Property Information'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Address'
            React.DOM.th null, 'Owner Name'
            React.DOM.th null, 'Owner Number'
            React.DOM.th null, 'Property Value'
        React.DOM.tbody null,
            for PropertyDisplay in @state.property_displays
              React.createElement property_displays, key: PropertyDisplay.id, PropertyDisplay: PropertyDisplay