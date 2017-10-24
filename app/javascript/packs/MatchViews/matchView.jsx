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
      backgroundColor: '#13F090',
      marginLeft: 'auto',
      marginRight: 'auto',
      position: 'relative',
      textAlign: 'center'
};


export default class MatchView extends React.Component {
  constructor() {
    super();
    this.send = this.send.bind(this);
  }
  
  send(){
    console.log("Send Clicked");
  }

  render() {
    return (
      <Modal isOpen={this.props.modalIsOpen}
                        onAfterOpen={this.props.afterOpenModal}
                        onRequestClose={this.props.closeModal}
                        style={customStyles}
                        contentLabel="Example Modal">
          <button onClick={this.props.closeModal}>close</button>
          <h2 ref={subtitle => this.subtitle = subtitle} style={titleStyle}>Matches</h2>
          {this.props.table}
          <button onClick={this.send}> {this.props.sendButtonTitle} </button>
      </Modal>
    );
  }
}

