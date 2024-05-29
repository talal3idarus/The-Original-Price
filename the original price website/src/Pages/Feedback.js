import React, { useState } from 'react';
import Axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
// import backgroundImage from '../images/background.png';

function Feedback(){

    let [fnm, setUNM] = useState("");
    let [fph, setFPH] = useState("");
    let [fdb, setFDB] = useState("");
    let [ResMsg, setResMsg] = useState("");

    const handelUNM=(e)=>{
        setUNM(e.target.value);
    }
    const handelFPH=(e)=>{
        setFPH(e.target.value);
    }
    const handelFDB=(e)=>{
        setFDB(e.target.value);
    }

    const handelFeedBack=(e)=>{
        Axios.post("http://127.0.0.1:8085/addFeedback",{
            cFNM:fnm,
            cFPH:fph,
            cFDB:fdb
        })
        .then((response)=>setResMsg(response.data))
        .catch((err)=>console.log(err))
    }

    return(
        <div className='hero'>
            <div className="container-fluid">
                <div className="nav">
                    <div className="container-fluid">
                        <div className='row'>

                            <div className='col'>
                                <h3 className='tit'>Feedback</h3>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div className='form'>
                <div className='row'>
                    <div className='col'>
                        <div className='FRNP'>
                            <div>
                                <label>Username:</label>
                                <input className="username" type="text" onChange={(e)=>handelUNM(e)} placeholder=" Enter Your Username"/>
                            </div>

                            <div>
                                <label>Phone Number:</label>
                                <input className="Phone" type="Phone" onChange={(e)=>handelFPH(e)} placeholder=" Enter Your Phone"/>
                            </div>

                        </div>
                    </div>
                    <div className='col'>
                        <div className='FRFB'>
                            <div>
                                <label>Feedback:</label>
                                <textarea className="textarea"  onChange={(e)=>handelFDB(e)} placeholder="Type your Feedback here..."/>
                            </div>
                            <div className='box2'>
                                <button className="btn btn-primary" onClick={handelFeedBack}>Submit</button>

                                <h3>{ResMsg}</h3>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            

           
        </div>
    )
}

export default Feedback;
