import React, { useState, useEffect } from 'react';
import {useParams,useNavigate} from 'react-router-dom'
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
// import { Link } from 'react-router-dom';


function Update(){
    let Navigate = useNavigate()
    var [allpro,setAllpro] = useState([]);
    const [Product,setProduct] = useState([])
    const [PNAME,setPNAME] = useState(Product.PNAME);
    const [PINFO,setPINFO] = useState("");
    const [PPRICE,setPPRICE] = useState("");
    // const [PPTAX,setPPTAX] = useState("");
    const [BRAND,setBRAND] = useState("");
    const [IMAGE,setIMAGE] = useState("");
    // let [ResMsg, setResMsg] = useState();

    let {id} = useParams();
    const getProductData = ()=>{
        axios.get(`http://localhost:8085/product-details/${id}`)
        .then((res)=>{
            setPNAME(res.data.PNAME)
            setPINFO(res.data.PINFO)
            setPPRICE(res.data.PPRICE)
            // setPPTAX(res.data.PPTAX)
            setBRAND(res.data.BRAND)
            setIMAGE(res.data.IMAGE)
            setProduct(res.data)})
        .catch((err)=>console.log(err))
    }
    
    useEffect(()=>{
        getProductData()
    },[])

    
    
   
    

    
    const updateProd = (e) => {
        e.preventDefault()
        axios.put('http://localhost:8085/update2',{
            _id : id,
            PNAME:PNAME,
            PINFO:PINFO,
            PPRICE:PPRICE,
            PPTAX:parseFloat((Math.round(parseFloat(PPRICE)*0.05)+parseFloat(PPRICE))),
            BRAND:BRAND,
            IMAGE:IMAGE,
        }).then((res) =>{
            console.log(res)
            getProductData()
            Navigate('/Mange')
        }).catch((err)=>{
            console.log(err)
        })
    };
    // useEffect(()=>{
    //     Axios.get(`http://localhost:8085/getProd/${PID}`)
    //     .then((Response) =>{
    //         setPNAME(Response.result.PNAME);
    //         setPINFO(Response.result.PINFO);
    //         setPPRICE(Response.result.PPRICE);
    //         setPPTAX(Response.result.PPTAX);
    //         setBRAND(Response.result.BRAND);
    //         setIMAGE(Response.result.IMAGE);
    //     }).catch((err)=>{
    //         console.log(err);
    //     });
    // });

    // var [allpro,setAllpro] = useState([]);

    // useEffect(()=>{
    //     Axios.get("http://localhost:8085/products")
    //     .then((response)=>setAllpro(response.data.pros))
    //     .catch((err)=>console.log(err))
    // },[allpro])



    return(
        <div className='updateClass'>
           
            
                <form className='update' onSubmit={updateProd}>
                     <h1 className='uptit'>UPDATE PROCUCT</h1>
                    <div className='row'> 
                        

                        <div className='col'>
                            <div>
                                <label>NAME:</label>
                                <input name='PNAME' className="username" type="text" id="PNAME" value={PNAME} onChange={()=>setPNAME(document.getElementById('PNAME').value)}/>
                            </div>

                            <div>
                                <label>INFO:</label>
                                <input name='PINFO'  className="username" type="text"  id="PINFO" value={PINFO} onChange={()=>setPINFO(document.getElementById('PINFO').value)}/>
                            </div>

                            <div>
                                <label>PRICE:</label>
                                <input name='PPRICE'  className="username" type="text"  id="PPRICE" value={PPRICE} onChange={()=>setPPRICE(document.getElementById('PPRICE').value)}/>
                            </div>
                        </div>


                        <div className='col'>
                            {/* <div>
                                <label>TAX:</label>
                                <input name='PPTAX' className="username" type="text" placeholder={Product.PPTAX}  />
                            </div> */}

                            <div>
                                <label>BRAND:</label>
                                <input name='BRAND' className="username" type="text" id="BRAND" value={BRAND} onChange={()=>setBRAND(document.getElementById('BRAND').value)} />
                            </div>

                            <div>
                                <label>IMAGE:</label>
                                <input  name='IMAGE' className="username" type="text" id="IMAGE" value={IMAGE} onChange={()=>setIMAGE(document.getElementById('IMAGE').value)}  />
                            </div>

                        </div>
                    </div>
                        <div className='row'>
                            <div className='subBox'>
                            {/* <Link to='/Mange'> */}
                                <input className='btn btn-primary' id='UpdateBotton' type='submit' value='UPDATE'/>
                            {/* </Link> */}
                            </div>
                        </div>
                </form>

                    
            
        </div>

    );
}

export default Update;
