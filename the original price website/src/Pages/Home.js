import React from 'react';
import {useNavigate} from 'react-router-dom'
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
import backgroundImage from '../images/background.png';
import profile from '../images/profile.png';
import bubble from '../images/bubble.png';


function Home(){

    // let brand = document.getElementById("search");
    const navigate = useNavigate()
    const Search = ()=>{
        let brand = document.getElementById("search").value;
        navigate('/Display/'+brand.toUpperCase())



    let [allpro,setAllpro] = useState([]);

    const getProducts = ()=>{
        axios.get("http://localhost:8085/products/")
        .then((response)=>setAllpro(response.data))
        .catch((err)=>console.log(err))
    }

    useEffect(()=>{
        getProducts()
    },[])
    }

    return(
        
        <div className='hero' >
            <div className="">
                <div className="">
                    <div className="container-fluid">
                        <div className='row'>

                            <div className='col-5'>
                                <h3 className='tit'>The Original Prices of Product</h3>
                            </div>

                            

                        </div>
                    </div>
                </div>
            </div>
            
            <div className='box1'>
                <h1 className='H1'>Tip: Don't Pay Before<br/>You make sure<br/>About The prices</h1>
            </div>

            <div className='f1'>

                <input className="search" name="search" type="text" placeholder="Search By Brand " id="search" />
			
            
            
            	<input className="submit" name="submit" type="submit" value="Search" onClick={Search}/>
				
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
    );
}

export default Home;
