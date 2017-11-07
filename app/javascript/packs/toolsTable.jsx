import React, { Component } from 'react';

export default class ToolsTable extends Component{
    
    
    constructor(props){
        super(props)
    }
    
    render(){
        return(
            <div className="col-md-3">
                <div className="list-group">
                  <a className="list-group-item main-color-bg">
                    <span className="glyphicon glyphicon-list" aria-hidden="true" /> Tools
                  </a>
                  <a className="list-group-item" onClick={this.props.propertyButtonAction}>
                    <span className="glyphicon glyphicon-home" aria-hidden="true" /> Template Editor</a>
                </div>
            </div>
        )
    }
}