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
              <button className="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <span className="glyphicon glyphicon-plus" aria-hidden="true"></span> New
                <span className="caret"></span>
              </button>
              <ul className="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="#">Add Property</a></li>
                <li><a href="#">Add Investor</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>
        )
    }
}

