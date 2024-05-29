import React,{ useState } from "react";
import Axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
import backgroundImage from '../images/background.png';
import { Link } from 'react-router-dom';

function Request(){

    let [rnm, setRNM] = useState("");
    let [rph, setRPH] = useState("");
    let [shp, setSHP] = useState("");
    let [rem, setREM] = useState("");
    let [ResMsg, setResMsg] = useState();
    
    const handelRNM=(e)=>{
        setRNM(e.target.value);
    }
    const handelRPH=(e)=>{
        setRPH(e.target.value);
    }
    const handelSHP=(e)=>{
        setSHP(e.target.value);
    }
    
    const handelREM=(e)=>{
        setREM(e.target.value);
    }

    const handeladdReq=(e)=>{
        Axios.post("http://localhost:8085/addRequest", {
        cRNAME: rnm,
        cRPHONE: rph,
        cSHOPL: shp,
        cREMAIL: rem
        })
        .then((res)=>setResMsg(res.data))
        .catch((err) =>console.log(err))
    }


    return(
        <div className='hero' style={{backgroundImage: `url(${backgroundImage})`}}>
            <div className="container-fluid">
                <div className="nav">
                    <div className="container-fluid">
                        <div className='row'>
                            <div className='col'>
                                <h3 className='tit'>Request For ADs</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            

            <div className='f4'>
                <div>
                    <label>Username:</label>
                    <input className="username" type="text" placeholder=" Enter Your Username"
                    onChange={(e)=>handelRNM(e)}/>
                </div>

                <div>
                    <label>Phone Number: </label>
                    <input className="Phone" type="number" placeholder=" Enter Your Phone Number"
                    onChange={(e)=>handelRPH(e)}/>
				</div>
                
                <div>
                    <label>Shop Loaction: </label>
                    <input className="Loaction" type="text" placeholder=" Enter Loaction"
                    onChange={(e)=>handelSHP(e)}/>
				</div>

                <div>
                    <label>Email:</label>
                    <input className="Email" type="text" placeholder=" Enter Your Email"
                    onChange={(e)=>handelREM(e)}/>
                </div>
                <Link to='/Mange'>
				<button className="btn btn-primary" onClick={handeladdReq}>Submit</button>
				</Link>
                {/* <h3>{ResMsg}</h3> */}
            </div>
        </div>
    )
}

export default Request;
