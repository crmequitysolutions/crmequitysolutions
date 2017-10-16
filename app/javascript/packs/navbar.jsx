import React, { Component } from 'react';


export default class MyNavBar extends Component{
    
    constructor(){
        super();
    }
    
    render(){
        return(
        <nav className="navbar navbar-default">
          <div className="container">
            <div className="navbar-header">
              <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span className="sr-only">Toggle navigation</span>
                <span className="icon-bar" />
                <span className="icon-bar" />
                <span className="icon-bar" />
              </button>
              <a className="navbar-brand" href="#">CRM Equity Solutions</a>
            </div>
            <div id="navbar" className="collapse navbar-collapse">
              <ul className="nav navbar-nav">
                <li className="active"><a href="properties.html">Home</a></li>
                <li><a href="guide.html">Guide</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
              <ul className="nav navbar-nav navbar-right">
                <li><a href="#">Welcome, Duvall</a></li>
                <li><a href="login.html">Logout</a></li>
              </ul>
            </div>{/*/.nav-collapse */}
          </div>
        </nav>
        )
    }
}


        

