import React, {useEffect, useState} from 'react';
import Axios from 'axios';
import './indexstyle.css';
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

function AdminLoin(){
    let [alladm,setAlladm] = useState([]); 
    const navigate = useNavigate();
    const [LoggedIn, setLoggedIn] = useState(false)

   useEffect(()=>{
    setLoggedIn(true);
   });


    useEffect(()=>{
        Axios.get("http://localhost:8085/admins")
        .then((response)=>setAlladm(response.data.adm))
        .catch((err)=>console.log(err))
    },[alladm])

    function handellogin(){
        let adm = document.getElementById("us").value;
        let adp = document.getElementById("pass").value;
        alladm.map((admin)=>{
            if (admin.ADMINNAME == adm && admin.ADMINPASS == adp)
            {
                
            setLoggedIn(true);
            navigate('/Mange');
            }
            else{
                alert("Invalid Username or Password");
                setLoggedIn(false);
            }
        });
    }



    return(
        <div className='hero'>
            
            <div className='Fram1'>
                <h1 className='ALtit'>Welcome Back Admin</h1>
                <div className='Frams'>
                    <label id='lable'>Username:</label>
                    <input className="username" id="us" type="text" placeholder=" Enter Your Username"/>
                </div>
                <div className='Frams'>
                    <label id='lable'>Password: </label>
                    <input className="Password" id="pass" type="password" placeholder=" Enter Your Password"/>
				</div>

                <div className='Frams'>
				<button className="btn btn-primary" id='submit3' onClick={handellogin}>Login</button>
                </div>

            </div>

        </div>
    );
}

export default AdminLoin;

