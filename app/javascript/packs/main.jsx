import React, { Component } from 'react';
import ReactDOM from 'react-dom'
import Navbar from './navbar'
import Header from './header'
import TableSelector from './tableSelector'
import Table from './TableView/table'
import Footer from './footer';
import MatchView from './MatchViews/matchView';
import ListAllDataView from './listAllData';



const property_table_headers = ["Owner", "Contact", "Address", "Prop. Type", "Time on Mkt.", "Bed", "Bath", " "]
const investor_table_headers = ["Investor", "Contact","Prop. Type","Bed","Bath","Max", "Min"]

class Main extends Component{
    
    constructor(){
        super();
        this.state = {
            matchViewIsOpen: false,
            listInfoViewIsOpen:false,
            listInfoViewEntry: null,
            table : {
                headers: property_table_headers,
                entries : []
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
        let d = this.props.tableData
        if(this.props.tableData){
            entries = this.props.tableData.map((item, index) => {
                return([
                    item.owner,  "null", item.address_id, item.property_type, item.time_on_mrkt, item.bd_rms, item.ba_rms
                    ])
            });
        }
        console.log("GET PROPERTIES", entries)
        return entries
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
    
    openModal(event) {
        event.preventDefault();
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
        console.log('render called');
        console.log(this.props);
        console.log(this.state);
        return(
                <div>
                    <Navbar />
                    <Header />
                    <TableSelector investorButtonAction={this.switchTableToInvestors} propertyButtonAction={this.switchTableToProperties}/>
                    <Table  data={this.state.table} 
                            entryClicked={this.onEntryClick} 
                            button={<a className="btn btn-default" 
                                onClick={this.openModal}>Matches</a>} />
                    <Footer />
                    <MatchView  
                        sendButtonTitle={"Send to Investors"} 
                        modalIsOpen={this.state.matchViewIsOpen}
                        closeModal={this.closeModal}
                        table={<Table data={this.state.table}/>}
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

document.addEventListener('DOMContentLoaded', () => {
  const node1 = document.getElementById('table_data');
  const tableData = JSON.parse(node1.getAttribute('data'));
  console.log("Pre-render:", tableData);
  ReactDOM.render(
    <Main tableData={tableData}  />,
    document.body.appendChild(document.createElement('div'))
  )
});
