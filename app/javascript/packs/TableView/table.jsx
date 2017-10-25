import React from 'react'
import ReactDOM from 'react-dom'
import HeaderCell from './headerCell'



export default class Table extends React.Component{
  
  constructor(){
    super();
  }
    
  render(){
    let headers;
    if(this.props.data.headers){
      headers = this.props.data.headers.map( (header,index) => {
        return(
          <HeaderCell key={header+index} name={header} />
          )
        }
      );
    }
    let entries;
    if(this.props.data.entries){
      entries = this.props.data.entries.map( (entry,index) => {
        return(
          <tr key={index} onClick={(event) => {this.props.entryClicked(event, entry)}}> 
          {
            entry.map( (item, index) => { return(<td key={item+index}> { item } </td>) })
          }
          {this.props.button? <td>{this.props.button}</td> : null}
          </tr>
        )    
      })
    }
                          
    return(
        <section id="table">
          <div className="container" >
            <div className="row">
              <div className="col-md-9">
                {/* Website Overview */}
                <div className="panel panel-default">
                  <div className="panel-heading main-color-bg">
                    <h3 className="panel-title">Properties</h3>
                  </div>
                  <div className="panel-body">
                    <div className="row">
                      <div className="col-md-12">
                        <input className="form-control" type="text" placeholder="Filter..." />
                      </div>
                    </div>
                    <br />
                    <table className="table table-striped table-hover">
                      <tbody>
                        <tr>
                        {headers}
                        </tr>
                        {entries}
                      </tbody></table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
    );
  }
  
}

