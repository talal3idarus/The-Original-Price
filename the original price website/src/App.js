import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import './Pages/indexstyle.css';
import Home from "./Pages/Home";
import Request from "./Pages/Request";
import Manage from "./Pages/Mange";
import Feedback from "./Pages/Feedback";
import Display from "./Pages/Display";
import About from "./Pages/About";
import AdminLoin from "./Pages/AdminLoin";
import backgroundImage from './images/background.png';
import profile from './images/profile.png';
import Update from './Pages/Update';
import Add from './Pages/Add';


function App() {
  return (
    <div className='hero' style={{backgroundImage: `url(${backgroundImage})`}}>
      <Router>
        <nav>
          <div className='' >
              <ul className="nav justify-content-end" >
              <li className="nav-item">
                      <Link className="nav-link" to="/">Home</Link>
                  </li>
                  <li className="nav-item">
                      <Link className="nav-link" to="/Request">Request For AD</Link>
                  </li>
                  
                  <li className="nav-item">
                      <Link className="nav-link " to="/Feedback">Feedback</Link>
                  </li>
                  
                  <li className="nav-item">
                      <Link className="nav-link "to="/About">About us?</Link>
                  </li>

                  <li className="nav-item">
                       <Link className="nav-link" to="/Adminlogin">AdminLogin</Link>
                  </li>
              </ul>
              
          </div>
        </nav>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/Request" element={<Request />} />
          <Route path="/Feedback" element={<Feedback />} />
          <Route path="/About" element={<About />} />
          <Route path="/Mange" element={<Manage />} />
          <Route path="/Adminlogin" element={<AdminLoin />}/>
          <Route path="/Update/:id" element={<Update />}/>
          <Route path="/Add" element={<Add />}/>
          <Route path="/Display/:brand" element={<Display />}/>
         </Routes>
      </Router>
    </div>
  );
}

export default App;
