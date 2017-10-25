import React from 'react'
import ReactDOM from 'react-dom'
import HeaderCell from './headerCell'




export default class Table extends React.Component{
  
  constructor(){
    super();
  }
    
  render(){
    console.log(this.props.data)
    let headers = this.props.data.headers? 
    <tr>{this.props.data.headers.map( (header,index) => {
        return(
          <HeaderCell key={header+""+index} name={header} />
          );
        }
      )}</tr> : null;
    let entries = this.props.data.entries? Object.keys(this.props.data.entries).map( (key,index) => {
        let entry = this.props.data.entries[key]
        return(
          <tr key={index} onClick={(event) => {this.props.entryClicked(event, entry.full)}}> 
          {
            entry.display.map( (item, index) => { return(<td key={item+index}> { item } </td>) })
          }
          </tr>)    
        }
      ) : null;
                          
    return(
        <section id="table">
          <div className="container" style={style}>
              <div className="col-md-9">
                {/* Website Overview */}
                <div className="panel panel-default">
                  <div className="panel-heading main-color-bg">
                    <h3 className="panel-title">Properties </h3>
                    
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
                        
                        {headers}
                        
                        {entries}
                        
                      </tbody></table>
                  </div>
                </div>
              </div>
          </div>
        </section>
    );
  }
  
}


const style = {
    content : {
    width: 'auto',
    marginLeft: 'auto',
    marginRight: 'auto'
    }
}
