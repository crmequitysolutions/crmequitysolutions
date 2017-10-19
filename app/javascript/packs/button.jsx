import React, {Component} from 'react';

export default class Button extends Component{
    
    constructor(props){
        super(props);
        this.state = {
            text : props.name,
            hover: false
        }
    }
    


    mouseOver(){
        this.setState({hover: true});
    }

    mouseOut(){
        this.setState({hover: false});
    }
    
    

    render() {
        return React.createElement(
            "button",
            {
                style : {
                    padding: "16px",
                    fontSize : "18px",
                },
                onMouseEnter : this.mouseOver.bind(this),
                onMouseLeave : this.mouseOut.bind(this),
                onClick: this.props.onClick.bind(this) 
            },
            this.state.text
        );
    }
}
