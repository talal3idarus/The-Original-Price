import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './indexstyle.css';
import backgroundImage from '../images/background.png';

function About(){
    return(
        <div className='hero' style={{backgroundImage: `url(${backgroundImage})`}}>
            <div class="container-fluid">
                <div class="nav">
                    <div className="container-fluid">
                        <div className='row'>

                            <div className='col'>
                                <h3 className='tit'>About us</h3>
                            </div>

                            

                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div className='par'>

                <p>
                    Our original price of product website is helpful for the consumers and to know the actual price of product.
                    the website is easy to use and not complex. Also, our website does ads for client from website.
                    Frist, the client sends an advertisement request, then we accept the request, then the client sends the payment
                </p>
                <p>
                    There are many problems that occur in the markets, one of which is that shop owners take advantage of customers' 
                    ignorance of the prices or quality of products by excessively increasing prices, which is one of the reasons 
                    for high prices for medium or high-quality products. Therefore, we believe that our website will increase 
                    awareness in the community about the prices of electronic devices with tax in the Sultanate of Oman and make 
                    a limit the excessive increase in the price of devices for the owners of electronics stores. There are not 
                    many articles available on our topic, so it’s difficult for us to find other people’s experiences to avoid 
                    the expected problems in making websites and the success of the project. 
                </p>

                </div>
            </div>
            

           
        </div>
    )
}

export default About;
