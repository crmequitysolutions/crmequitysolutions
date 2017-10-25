import React from 'react';
import Modal from 'react-modal';
import TableView from './TableView/table'
import HeaderCell from './TableView/headerCell'



const table_headers = ["Full Name", "Email", "Phone", "Address", ""]
export default class MatchView extends React.Component {
  constructor() {
    super();
    this.send = this.send.bind(this);
  }
  
  send(){
    console.log("Send Clicked");
  }
  
  view(){
    console.log("View Clicked");
  }

  render() {
    let headers = this.props.headers? 
    <tr>{this.props.headers.map( (header,index) => {
        return(
          <HeaderCell key={header+""+index} name={header} />
          );
        }
      )}</tr> : null;
    let entries = this.props.entries? Object.keys(this.props.entries).map( (key,index) => {
        let entry = this.props.data.entries[key]
        return(
          <tr key={index} onClick={(event) => {this.props.entryClicked(event, entry.full)}}> 
          {
            entry.display.map( (item, index) => { return(<td key={item+index}> { item } </td>) })
          }
          </tr>)    
        }
      ) : null;
    return (
      <Modal isOpen={this.props.modalIsOpen}
                        onRequestClose={this.props.closeModal}
                        style={customStyles}
                        contentLabel="Example Modal">
          <a className="btn btn-default" onClick={this.props.closeModal}>Back</a>
          <h2 ref={subtitle => this.subtitle = subtitle} style={titleStyle}>Matches</h2>
          <table className="table table-striped table-hover">
            <tbody>
            
              {headers}
              
              {entries}
              
            </tbody>
          </table>
          <br />
          <br />
          <br />
          <div style={{textAlign:'center'}}>
            <a className="btn btn-default" style={buttonStyle} onClick={this.view}> View Template </a>
          </div>
          <div style={{textAlign:'center'}}>
            <a className="btn btn-primary" style={buttonStyle} onClick={this.send}> Send to Investors</a>
          </div>
      </Modal>
    );
  }
}

const customStyles = {
    overlay : {
        position          : 'fixed',
        top               : 0,
        left              : 0,
        right             : 0,
        bottom            : 0,
        backgroundColor   : 'rgba(0, 0, 0, 0.6)'
    },
    content : {
        top                   : '15%',
        left                  : '15%',
        right                 : '15%',
        bottom                : 'auto%',
  }
};

const titleStyle = {
      marginLeft: 'auto',
      marginRight: 'auto',
      position: 'relative',
      textAlign: 'center'
};

const buttonStyle = {
    width:'160px',
    marginTop:'12px'
}

// const flex = {
//     display: 'webkitBox',
//     display: 'mozBox',
//     display: 'msFlexbox',
//     display: 'webkitFlex',
//     display: 'flex'
// }

// const flexChild = {...flex, 
//     webkitBoxFlex: '1 1 auto',
//     mozBoxFlex:  '1 1 auto',
//     webkitFlex:  '1 1 auto',
//     msFlex:  '1 1 auto',
//     flex:  '1 1 auto',
//     marginRight : '16px',
//     marginLeft : '16px'
// }
