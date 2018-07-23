import React, { Fragment} from 'react';
import logo from './../../logo.png';
import GrayButton from './../../Components/grayButton/';
import Input from './../../Components/Input/';
import './style.css';
import { library } from '@fortawesome/fontawesome-svg-core';
import { faStroopwafel, } from '@fortawesome/free-solid-svg-icons';


library.add(faStroopwafel);


const signUp = () => {
    return (
        <div className="sign">
            <div>
                <img src={logo} />
            </div>
            <div id="input--wraper">
                <Input placeholder='Username'  icon={faStroopwafel} />
                <Input placeholder='Email'  icon={faStroopwafel} />
                <Input placeholder='Password'  icon={faStroopwafel} />
                <Input placeholder='Phone number'  icon={faStroopwafel} />
                <Input placeholder='Address'  icon={faStroopwafel} />
                <Input placeholder='M-pesa number'  icon={faStroopwafel} />
            </div>
            <div id="button">
                <GrayButton title={'sign Up'} />
            </div>
           

            
        </div>
    )

}

export default signUp;