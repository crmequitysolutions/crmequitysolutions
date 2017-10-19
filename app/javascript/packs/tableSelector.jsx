import React, { Component } from 'react';

export default class TableSelector extends Component{
    
    render(){
        return(
            <div className="col-md-3">
                <div className="list-group">
                  <a href="index.html" className="list-group-item active main-color-bg">
                    <span className="glyphicon glyphicon-list" aria-hidden="true" /> Tables
                  </a>
                  <a href="#" className="list-group-item"><span className="glyphicon glyphicon-home" aria-hidden="true" /> Properties <span className="badge">4</span></a>
                  <a href="#" className="list-group-item"><span className="glyphicon glyphicon-usd" aria-hidden="true" /> Investors <span className="badge">5</span></a>
                </div>
            </div>
        )
    }
}