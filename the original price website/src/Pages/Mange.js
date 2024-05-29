import React, {useEffect, useState} from 'react';
import Axios from 'axios';
import './indexstyle.css';
import { Link } from 'react-router-dom';
// import {BrowserRouter as Router,Routes,Route,Link} from 'react-router-dom';

function Manage(){
    var [allpro,setAllpro] = useState([]);

    useEffect(()=>{
        Axios.get("http://localhost:8085/products")
        .then((response)=>setAllpro(response.data.pros))
        .catch((err)=>console.log(err))
    },[allpro])

    const delProduct=(PID)=>{
        Axios.delete(`http://localhost:8085/delproduct/${PID}`)
        .then((response)=>alert(response.data))
        .catch((err)=>console.log(err))
    }

    return(
        <div className='adminFram'>

            <h1 className='ptit'>PROCUCT TABLE</h1>
  
            <Link to='/Add'><input type='button' className='btn btn-primary' id='add' value='Add Product'/></Link>
            <div className='row'>
                <div className='col'>
                    <table border='1' className='table table-srtiped'>
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>NAME</td>
                                <td>INFO</td>
                                <td>PRICE</td>
                                <td>TAX</td>
                                <td>BRAND</td>
                                <td>IMAGE</td>
                                <td>DELETE   |   UPDATE</td>
                            </tr>
                        </thead>
                        <tbody>
                            {allpro.map((pro)=>(
                                <tr>
                                    <td>{pro.PID}</td>
                                    <td>{pro.PNAME}</td>
                                    <td>{pro.PINFO}</td>
                                    <td>{pro.PPRICE}</td>
                                    <td>{pro.PPTAX}</td>
                                    <td>{pro.BRAND}</td>
                                    <td><img src={pro.IMAGE} width={'50px'} height={'50px'}/></td>
                                   
                                   
                                    <td style={{textAlign:"center"}}>
                                         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fillRule="currentColor" className="bi bi-x-circle" viewBox="0 0 16 16"
                                        style={{marginRight:'20px'}}
                                        onClick={()=>delProduct(pro.PID)}
                                        >
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                        </svg>
                                      |   
                                        <Link to={`/Update/${pro._id}`}><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fillRule="currentColor" className="bi bi-pencil-square" viewBox="0 0 16 16"
                                        style={{marginLeft:'20px'}}>
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                        </svg> </Link>
                                    
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
                <br/>
            </div>
        </div>
    );
}
export default Manage;