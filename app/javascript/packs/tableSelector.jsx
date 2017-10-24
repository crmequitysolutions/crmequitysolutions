import React, { Component } from 'react';

export default class TableSelector extends Component{
    
    
    constructor(props){
        super(props)
    }
    
    render(){
        return(
            <div className="col-md-3">
                <div className="list-group">
                  <a className="list-group-item main-color-bg">
                    <span className="glyphicon glyphicon-list" aria-hidden="true" /> Tables
                  </a>
                  <a className="list-group-item" onClick={this.props.propertyButtonAction}>
                    <span className="glyphicon glyphicon-home" aria-hidden="true" /> Properties <span className="badge">4</span></a>
                  <a className="list-group-item" onClick={this.props.investorButtonAction}>
                    <span className="glyphicon glyphicon-usd" aria-hidden="true" /> Investors <span className="badge">5</span></a>
                </div>
            </div>
        )
    }
}