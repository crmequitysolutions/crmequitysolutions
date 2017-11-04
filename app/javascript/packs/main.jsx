import React, { Component } from 'react';
import ReactDOM from 'react-dom'
import Navbar from './navbar'
import Header from './header'
import TableSelector from './tableSelector'
import Table from './TableView/table'
import Footer from './footer';
import MatchView from './matchView';
import ListAllDataView from './listAllData';
import ToolsTable from './toolsTable';



const property_table_headers = ["Owner", "Contact", "Address", "Prop. Type", "Time on Mkt.", "Bed", "Bath", " ", " "]
const investor_table_headers = ["Name", "Email","Phone","Prop. Type","Bed","Bath","Max", "Min", " ", " "]

class Main extends Component{
    
    constructor(){
        super();
        this.state = {
            matchViewIsOpen: false,
            listInfoViewIsOpen:false,
            listInfoViewEntry: null,
            table : {
                headers: property_table_headers,
                entries : null
            }
        };
        
        this.openModal = this.openModal.bind(this);
        this.afterOpenModal = this.afterOpenModal.bind(this);
        this.closeModal = this.closeModal.bind(this);
        this.switchTableToInvestors = this.switchTableToInvestors.bind(this);
        this.switchTableToProperties = this.switchTableToProperties.bind(this);
        this.onEntryClick = this.onEntryClick.bind(this)
        this.closeListView = this.closeListView.bind(this)
    }
    
    componentDidMount(){
        console.log('didMount')
        let entries = this.getPropertyEntries();
        this.setState({
            table : {
                headers: property_table_headers,
                entries : entries
                }
            });
    }
    
    getPropertyEntries(){
        var entries;
        if(this.props.tableData){
            entries = this.props.tableData.map((item, index) => {
                let ref = "properties/"+item.owner+"/edit.html";
                return({full: item, display: [
                    item.owner,  "null", item.address_id, item.property_type, 
                    item.time_on_mrkt, item.bd_rms, item.ba_rms,
                    <a className="btn btn-default" onClick={(e) => {
                        e.stopPropagation();
                        this.openModal();
                        }
                    }>Match</a>,
                    <a href={ref} onClick={(e) => {e.stopPropagation()}} className="btn btn-danger" >Edit</a>
                    ]})
            });
        }
        console.log("GET PROPERTIES", entries)
        return entries
    }
    
    getInvestorEntries(){
        return null
    }

    switchTableToProperties(){
        this.setState({
            table : {
                headers: property_table_headers,
                entries : this.getPropertyEntries()
            }
        }, () => {console.log(this.state.table.headers);});
    }
    
    switchTableToInvestors(){
        
        this.setState( {
            table : {
                headers: investor_table_headers,
                entries: this.getInvestorEntries()
            }
        }, () => {
            console.log(this.state.table.headers);
            this.render();
        });
    }
    
    openModal(event) {
        this.setState({matchViewIsOpen: true});
    }

    afterOpenModal() {
    // references are now sync'd and can be accessed.
        this.subtitle.style.color = '#696969';
    }

    closeModal() {
        console.log("Close modal clicked")
        this.setState({matchViewIsOpen: false});
    }
    
    onEntryClick(event, entry){
        console.log("match clicked; entry=",entry);
        console.log(event)
        event.preventDefault();
        this.setState({
            listInfoViewIsOpen:true,
            listInfoViewEntry: entry
        });
    }
    
    closeListView(){
        this.setState({
            listInfoViewIsOpen:false,
            listInfoViewEntry: null
        });
    }
    
    render(){
        return(
                <div>
                    <Header />
                    <TableSelector investorButtonAction={this.switchTableToInvestors} propertyButtonAction={this.switchTableToProperties}/>
                    <ToolsTable />
                    <Table  data={this.state.table} 
                            entryClicked={this.onEntryClick} 
                    />
                    <Footer />
                    <MatchView  
                        sendButtonTitle={"Send to Investors"} 
                        modalIsOpen={this.state.matchViewIsOpen}
                        closeModal={this.closeModal}
                        headers={investor_table_headers}
                    />
                    <ListAllDataView  
                        modalIsOpen={this.state.listInfoViewIsOpen}
                        closeModal={this.closeListView}
                        entry={this.state.listInfoViewEntry}
                    />
                </div>
        )
    }
    
}


const render = () => {
    let table_node = document.getElementById('table_data');
    let table_data = JSON.parse(table_node.getAttribute('data'));
    console.log('***prerender***');
    console.log(table_node.getAttribute('data'));
    console.log(table_data);
    ReactDOM.render(
        <Main 
        tableData={table_data} 
        //contactData={JSON.parse(document.getElementById('contact_data').getAttribute('data'))} 
        />,
        document.body.appendChild(document.createElement('div'))
    );
};
if (document.readyState !== "loading") {
    console.log("readyState");
    render();
} else {
    console.log("addEventListener");
    document.addEventListener('DOMContentLoaded', () =>{
        render();
        }
    );
}

