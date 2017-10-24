import React, {Component} from 'react';

export default class HeaderCell extends Component{
    
    render(){
        console.log('headerCell', this.props.name)
        return(
            <th> {this.props.name} </th>    
        )
    }
}