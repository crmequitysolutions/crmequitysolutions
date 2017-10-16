import React from 'react'
import ReactDOM from 'react-dom'


export default class PropertyView extends React.Component{
  constructor() 
    {
        super();
    }
    
    render(){
      return(
      <div>
        <meta charSet="utf-8" />
        <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
        <meta name="PropertyViews" content="width=device-width, initial-scale=1" />
        <title>CRM | Properties</title>
        {/* Bootstrap core CSS */}
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        
        
        <section id="main">
          <div className="container">
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
                      <tbody><tr>
                          <th>Owner</th>
                          <th>Contact</th>
                          <th>Address</th>
                          <th>City</th>
                          <th>Zip</th>
                          <th>Value</th>
                          <th />
                        </tr>
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
        <footer id="footer">
          <p>CRM Equity Solutions, © 2017</p>
        </footer>
        {/* Modals */}
        {/* Add Page */}
        <div className="modal fade" id="addPage" tabIndex={-1} role="dialog" aria-labelledby="myModalLabel">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <form>
                <div className="modal-header">
                  <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                  <h4 className="modal-title" id="myModalLabel">Add Page</h4>
                </div>
                <div className="modal-body">
                  <div className="form-group">
                    <label>Page Title</label>
                    <input type="text" className="form-control" placeholder="Page Title" />
                  </div>
                  <div className="form-group">
                    <label>Page Body</label>
                    <textarea name="editor1" className="form-control" placeholder="Page Body" defaultValue={""} />
                  </div>
                  <div className="checkbox">
                    <label>
                      <input type="checkbox" /> Published
                    </label>
                  </div>
                  <div className="form-group">
                    <label>Meta Tags</label>
                    <input type="text" className="form-control" placeholder="Add Some Tags..." />
                  </div>
                  <div className="form-group">
                    <label>Meta Description</label>
                    <input type="text" className="form-control" placeholder="Add Meta Description..." />
                  </div>
                </div>
                <div className="modal-footer">
                  <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="submit" className="btn btn-primary">Save changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        {/* Bootstrap core JavaScript
          ============================================================ */}
        {/* Placed at the end of the document so the pages load faster */}
      </div>  
      );
    }
  
}

