import React, {useEffect, useState} from 'react';
import {useParams} from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
import backgroundImage from '../images/background.png';
import bubble from '../images/bubble.png';
import axios from 'axios';




function Display(){
    let {brand} = useParams()
    let [allpro,setAllpro] = useState([]);

    const getProducts = ()=>{
        axios.get("http://localhost:8085/products/"+brand)
        .then((response)=>setAllpro(response.data))
        .catch((err)=>console.log(err))
    }

    useEffect(()=>{
        getProducts()
    },[])


    return(
        <div className='hero' style={{backgroundImage: `url(${backgroundImage})`}}>
            <div class="container-fluid">
                <div class="nav">
                    <div className="container-fluid">
                        <div className='row'>

                            <div className='col'>
                                <h3 className='tit'>Product Info</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className='card-container'>
                    {allpro.map((pro)=>(
                        <div className="card">
                            <img src={pro.IMAGE} style={{maxWidth: '40rem', maxHeight:'15rem', marginBottom:'10px'}}/>
                                <h3 className="card-title">Name: {pro.PNAME}</h3>
                                <h4 className="card-text">Brand: {pro.BRAND}</h4>

                            <div className="card-body">
                                <div className='row'>
                                    <div className='col'>
                                    <p className="card-text" id='ptxt'>
                                    Info: {pro.PINFO}<br/>
                                    </p>
                                    </div>
                                    <div className='col'>
                                    <p className="card-text" id='ptxt'>
                                    Price: {pro.PPRICE}<br/>
                                    After Tax:{pro.PPRICE}
                                    </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ))}
            </div>

            <div className="bubbles">
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
                <img src= {bubble} />
		    </div>
        </div>
    )
}

export default Display;
