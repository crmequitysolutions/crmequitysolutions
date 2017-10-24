import React, { Component } from 'react';
import ReactDOM from 'react-dom'
import Navbar from './navbar'
import Header from './header'
import TableSelector from './tableSelector'
import Table from './TableView/table'
import Footer from './footer';
import MatchView from './MatchViews/matchView';



const property_table_headers = ["Owner", "Contact", "Address", "City", "Zip", "Value", "", ""]
const investor_table_headers = ["Investor", "Contact","Prop. Type","Bed","Bath","Max", "Min", "", ""]


class Main extends Component{
    
    constructor(){
        super();
        this.state = {
            modalIsOpen: false,
            table : {
                headers: investor_table_headers,
                entries : [
                    {name: "Mike", contact : "20188873885", prop_type : "Luxury", bed: "3", bath: "3", max: "$100,000", min : "$50,000"}
                    ]
            }
        };
        
        this.openModal = this.openModal.bind(this);
        this.afterOpenModal = this.afterOpenModal.bind(this);
        this.closeModal = this.closeModal.bind(this);
        this.switchTableToInvestors = this.switchTableToInvestors.bind(this);
        this.switchTableToProperties = this.switchTableToProperties.bind(this);
    }
    

    componentDidMount(){
        console.log('didMount')
    }

    switchTableToProperties(){
        this.setState({
            table : {
                headers: property_table_headers
            }
        }, () => {console.log(this.state.table.headers);});
    }
    
    switchTableToInvestors(){
        
        this.setState( {
            table : {
                headers: investor_table_headers
            }
        }, () => {
            console.log(this.state.table.headers);
            this.render();
        });
    }
    
    openModal() {
        this.setState({modalIsOpen: true});
    }

    afterOpenModal() {
    // references are now sync'd and can be accessed.
        this.subtitle.style.color = '#696969';
    }

    closeModal() {
        console.log("Close modal clicked")
        this.setState({modalIsOpen: false});
    }
    
    render(){
        console.log('render called')
        return(
                <div>
                    <Navbar />
                    <Header />
                    <TableSelector investorButtonAction={this.switchTableToInvestors} propertyButtonAction={this.switchTableToProperties}/>
                    <Table data={this.state.table} />
                    <button onClick={this.openModal}>Open Modal</button>
                    
                    <Footer />
                    <MatchView  
                        sendButtonTitle={"Send to Investors"} 
                        modalIsOpen={this.state.modalIsOpen}
                        closeModal={this.closeModal}
                        table={<Table data={this.state.table}/>}
                    />
                </div>
        )
    }
}


ReactDOM.render(<Main/>, document.getElementById("main"));