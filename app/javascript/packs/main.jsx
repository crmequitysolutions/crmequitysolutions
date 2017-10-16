import React, { Component } from 'react';
import ReactDOM from 'react-dom'
import Navbar from './navbar'
import Header from './header'
import TableSelector from './tableSelector'
import PropertyTable from './propertyTable'


class Main extends Component{
    render(){
        return(
            React.createElement(
                "div",
                null,
                <Navbar/>,
                <Header/>,
                <TableSelector/>,
                <PropertyTable/>
            )
        )
    }
}

ReactDOM.render(
  <Main />,
  document.body
);