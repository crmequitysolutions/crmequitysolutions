import React, {Component} from 'react';
import ReactDOM from 'react-dom'

export default class LoginPage extends Component{
    
    render() {
        return (
    <div>
        <meta charSet="utf-8" />
        <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>CRM Login</title>
        {/* Bootstrap core CSS */}
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <nav className="navbar navbar-default">
          <div className="container">
            <div className="navbar-header">
              <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span className="sr-only">Toggle navigation</span>
                <span className="icon-bar" />
                <span className="icon-bar" />
                <span className="icon-bar" />
              </button>
              <a className="navbar-brand" href="#" />
            </div>
            <div id="navbar" className="collapse navbar-collapse">
            </div>{/*/.nav-collapse */}
          </div>
        </nav>
        <header id="header">
          <div className="container">
            <div className="row">
              <div className="col-md-12">
                <h1 className="text-center"> CRM Equity Solutions <small>Login</small></h1>
              </div>
            </div>
          </div>
        </header>
        <section id="main">
          <div className="container">
            <div className="row">
              <div className="col-md-4 col-md-offset-4">
                <form id="login" action="property_views" className="well">
                  <div className="form-group">
                    <label>Email Address</label>
                    <input type="text" className="form-control" placeholder="Enter Email" />
                  </div>
                  <div className="form-group">
                    <label>Password</label>
                    <input type="password" className="form-control" placeholder="Password" />
                  </div>
                  <button type="submit" className="btn btn-default btn-block">Login</button>
                </form>
              </div>
            </div>
          </div>
        </section>
        <footer id="footer">
          <p>CRM Equity Solutions, © 2017</p>
        </footer>
        {/* Bootstrap core JavaScript
    ================================================== */}
        {/* Placed at the end of the document so the pages load faster */}
    </div>
        )
  }
    
}

ReactDOM.render(<LoginPage />, document.getElementById("loginPage"));

