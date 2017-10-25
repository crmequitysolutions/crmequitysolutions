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
          <button onClick={this.props.closeModal}>close</button>
          <h2 ref={subtitle => this.subtitle = subtitle} style={titleStyle}>All Info</h2>
          {items}
      </Modal>
    );
  }
}

