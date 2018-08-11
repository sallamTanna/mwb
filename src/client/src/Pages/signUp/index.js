/*eslint-disable*/
import React, { Component } from 'react';

import './style.css';
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import {
  faEnvelope, faUnlockAlt, faUser, faPhoneVolume, faMapMarkerAlt, faAddressCard, faArrowLeft,
} from '@fortawesome/free-solid-svg-icons';
import logo from '../../logo.png';
import Input from '../../Components/Input';

library.add(
  faEnvelope, faUnlockAlt, faUser, faPhoneVolume, faMapMarkerAlt, faAddressCard, faArrowLeft,
);

const initState = {
  fullName: '',
  password: '',
  mobileNumber: '',
  address: '',
  tillNumber: '',
};

class SignUp extends Component {
  constructor(props) {
    super(props);
    this.state = { ...initState };
  }

  handleInputChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit = (e) => {
    e.preventDefault();
    this.setState({ ...initState });
    fetch('/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(this.state),
    })
      .then(res => res.json())
      .then((res) => {
        if (res.message === 'signup successful') window.location = '/signin';
      });
  }

    render() {
      return (
        <form onSubmit={this.handleSubmit}>
          <div className="sign">
            <div className="logo--continer">
              <img src={logo} alt="logo" />
            </div>
            <div id="input--wraper">
              <Input placeholder="Full Name" required icon={faUser} name="fullName" value={this.state.username} onChange={this.handleInputChange} />
              <Input placeholder="Password" required icon={faUnlockAlt} type="password" name="password" value={this.state.password} onChange={this.handleInputChange} />
              <Input placeholder="Mobile number" required icon={faPhoneVolume} type="number" name="mobileNumber" value={this.state.phone} onChange={this.handleInputChange} />
              <Input placeholder="Address" required icon={faMapMarkerAlt} name="address" value={this.state.address} onChange={this.handleInputChange} />
              <Input placeholder="Till Number" required icon={faAddressCard} name="tillNumber" value={this.state.mPesa} onChange={this.handleInputChange} />
            </div>
            <div id="button">
              <Input value="Sign Up" type="submit" />
            </div>
            <div className="sign-in-redirect">
            <p>Already have an account? </p>
            <a href="/signin">
              Sign in now
            </a>
            </div>
          </div>
        </form>
      );
    }
}

export default SignUp;
