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
        console.log(index,header);
        return(
          <HeaderCell key={header+index} name={header} />
          )
        }
      );
    }
    let entries;
    if(this.props.data.entries){
      entries = this.props.data.entries.map( (entry,index) => {
        console.log(entry, index);
        return(
          <tr> 
          {
            Object.keys(entry).map( (key, index) => { return(<td key={key+index}> { entry[key] } </td>) })
          }
            <td><a className="btn btn-default" href="edit.html">Edit</a> <a className="btn btn-danger" href="#">Delete</a></td>
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
                        <tr>
                          <td>Bob Smith</td>
                          <td>919-828-3232</td>
                          <td>902 Segdefield St</td>
                          <td>Durham</td>
                          <td>27705</td>
                          <td>$132,000</td>
                          <td><a className="btn btn-default" href="edit.html">Edit</a> <a className="btn btn-danger" href="#">Delete</a></td>
                        </tr>
                        <tr>
                          <td>Kyle Smith</td>
                          <td>201-828-3232</td>
                          <td>8th St</td>
                          <td>Durham</td>
                          <td>27705</td>
                          <td>$75,000</td>
                          <td><a className="btn btn-default" href="edit.html">Edit</a> <a className="btn btn-danger" href="#">Delete</a></td>
                        </tr>
                        <tr>
                          <td>Sam Smith</td>
                          <td>973-828-3232</td>
                          <td>846 Forbs Dr</td>
                          <td>Chapel Hill</td>
                          <td>27705</td>
                          <td>$232,000</td>
                          <td><a className="btn btn-default" href="edit.html">Edit</a> <a className="btn btn-danger" href="#">Delete</a></td>
                        </tr>
                        <tr>
                          <td>Berg Smith</td>
                          <td>804-828-3232</td>
                          <td>1738 Franklin St</td>
                          <td>Raleigh</td>
                          <td>27705</td>
                          <td>$100,000</td>
                          <td><a className="btn btn-default" href="edit.html">Edit</a> <a className="btn btn-danger" href="#">Delete</a></td>
                        </tr>
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

