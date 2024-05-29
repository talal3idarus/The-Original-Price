import React, { useState } from 'react';
import Axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
import { Link } from 'react-router-dom';

// where are u ?
function Add(){

    let [pid, setPID] = useState("");
    let [pna, setNAME] = useState("");
    let [pinfo, setPINFO] = useState("");
    let [pprice, setPRICE] = useState("");
    let [pban, setBRAND] = useState("");
    let [pimg, setIMG] = useState("");
    let [ResMsg, setResMsg] = useState();
    
    const handelID=(e)=>{
        setPID(e.target.value);
    }
    const handelPNAME=(e)=>{
        setNAME(e.target.value);
    }
    const handelPINFO=(e)=>{
        setPINFO(e.target.value);
    }
    const handelPRICE=(e)=>{
        setPRICE(e.target.value);
    }
    
    const handelBRAND=(e)=>{
        setBRAND(e.target.value);
    }
    const handeIMG=(e)=>{
        setIMG(e.target.value);
    }
    

    const handeladdPro=(e)=>{
        Axios.post("http://localhost:8085/addproduct", {
        
        pPID:pid,
        pPNAME:pna,
        pINFO:pinfo,
        pPRICE:pprice+' OMR',
        pTAX:parseInt((Math.round(parseFloat(pprice)*0.05)+parseFloat(pprice)))+' OMR',
        pBRAND:pban,
        pIMAGE:pimg

        })
        .then((res)=>setResMsg(res.data))
        .catch((err) =>console.log(err))
    }

    return(
        <div className='AddClass'>
                <div className='update'>
                    <h1 className='uptit'>ADD PROCUCT</h1>

                    <div className='row'>
                        <div className='col'>
                            <div className='inputbox'>
                                <label>ID:</label>
                                <input className="username1" type="text" onChange={(e)=>handelID(e)}/>
                            </div>
                            <div className='inputbox'>
                                <label>NAME:</label>
                                <input className="username1" type="text" onChange={(e)=>handelPNAME(e)}/>
                            </div>

                            <div className='inputbox'>
                                <label>INFO:</label>
                                <input className="username1" type="text" onChange={(e)=>handelPINFO(e)}/>
                            </div>
                        </div>




                        <div className='col'>
                            <div className='inputbox'>
                                <label>PRICE:</label>
                                <input className="username1" type="number" onChange={(e)=>handelPRICE(e)}/>
                            </div>

                            <div className='inputbox'>
                                <label>BRAND:</label>
                                <input className="username1" type="text" onChange={(e)=>handelBRAND(e)}/>
                            </div>

                            <div className='inputbox'>
                                <label>IMAGE:</label>
                                <input className="username1" type="text" onChange={(e)=>handeIMG(e)} />
                            </div>
                        </div>

                    </div>

                    

                    
                
                    <div className='subBox'>
                        <Link to='/Mange'>
                            <input className='btn btn-primary' id='AddBotton' type='submit' value='ADD' onClick={handeladdPro}/>
                        </Link>
                        <h3>{ResMsg}</h3>
                    </div> 
                </div>
        </div>
    );
}

export default Add;

