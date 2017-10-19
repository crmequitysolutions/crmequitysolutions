import React from 'react'

export default class Header extends React.Component{
    render(){
        return(
    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Properties<small> Manage Properties</small></h1>
          </div>
          <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
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

