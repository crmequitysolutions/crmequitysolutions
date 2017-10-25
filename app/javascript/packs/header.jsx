import React from 'react'

export default class Header extends React.Component{
    render(){
        return(
    <header id="header">
      <div className="container">
        <div className="row">
          <div className="col-md-10">
            <h1><span className="glyphicon glyphicon-home" aria-hidden="true"></span> Properties<small> Manage Properties</small></h1>
          </div>
          <div className="col-md-2">
            <div className="dropdown create">
              <a className="btn btn-default" href="/properties/new.html" type="button" id="addNewEntryButton">
                New
              </a>
            </div>
          </div>
        </div>
      </div>
    </header>
        )
    }
}

