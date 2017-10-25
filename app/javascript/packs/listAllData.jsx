import React from 'react';
import Modal from 'react-modal';

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
        overflow              : 'auto',
        maxHeight            : '80vh',
        top                   : '50%',
        left                  : '50%',
        right                 : 'auto',
        bottom                : 'auto',
        marginRight           : '-50%',
        transform             : 'translate(-50%, -50%)'
  }
};

const titleStyle = {
      marginLeft: 'auto',
      marginRight: 'auto',
      position: 'relative',
      textAlign: 'center'
};


export default class ListAllDataView extends React.Component {
  constructor() {
    super();
  }
  

    render() {
        let items;
        if(this.props.entry){
            items = Object.keys(this.props.entry).map( (key, index) => {
                console.log(index, key, this.props.entry[key])
                return(
                    <tr>
                        <td>{key}</td>
                        <td>{this.props.entry[key]}</td>
                    </tr>
                    )
            })
        }
        return (
      <Modal isOpen={this.props.modalIsOpen}
                        onRequestClose={this.props.closeModal}
                        style={customStyles}
                        contentLabel="See All Information Regarding this Entry">
          <a className="btn btn-default" onClick={this.props.closeModal}>Back</a>
          <h2 ref={subtitle => this.subtitle = subtitle} style={titleStyle}>All Info</h2>
          <table className="table table-striped table-hover">
            <tbody>
              <tr>
                <th>Key</th>
                <th>Value</th>
              </tr>
              {items}
            </tbody>
          </table>
          
      </Modal>
    );
  }
}

