import React from 'react'
import ReactDOM from 'react-dom'
import Button from './button'
//import Style from 'bootstrap/dist/css/bootstrap-theme.css'


const title = React.createElement('h1', {}, 'CRM Equity Solutions');
const paragraph = React.createElement('p', {}, 'CRM Equity Solutions is an organizational and task management tool designed to help wholesale property buyers document property information and easily send information to investors and homeowners. Right now, these wholesale buyers are wasting hours and hours of work hand-copying data into disorganized Excel spreadsheets and editing hundreds of postcards individually by hand. With our tool, the property data will automatically be added to a database, the user will be notified if specific property data fits criteria established by an investor, and it will quickly and easily create emails and postcards to send to the investors and homeowners.');

export default class Splash extends React.Component{
    
    launchApp(){
        window.location = '/properties'
    }    
    
    render(){
        return(
            React.createElement(
            "div", 
            null, 
            <link href="css/bootstrap.min.css" rel="stylesheet" />,
            <link href="css/style.css" rel="stylesheet" />,
            title,
            paragraph,
            <Button name={"Launch Application"}  onClick={this.launchApp} />
            )
        )
        
    }
    
}

ReactDOM.render(<Splash />, document.getElementById("root"))
