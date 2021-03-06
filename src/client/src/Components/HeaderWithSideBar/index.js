/*eslint-disable*/
import React from 'react';
import './index.css';
import logo from './images/logo.png';
import NotificationDiv from '../NotificationDiv';
import ReactLoading from 'react-loading';
var arrayToSaveNearOrders = [];
var notificationCounter=0;

class HeaderWithSideBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ordersArray: [],
      nearOrders: [],
      showRedDot: false
    };
    this.openNav = this.openNav.bind(this);
    this.closeNav = this.closeNav.bind(this);
    this.openNotification = this.openNotification.bind(this);
    this.closeNotification = this.closeNotification.bind(this);
    this.handleSignout = this.handleSignout.bind(this);
  }

  handleSignout() {
    fetch('/api/signout', {
      method: 'POST',
      credentials: 'same-origin',
    })
    .then(res => res.json())
    .then(res => {
      if (res.message) window.location = 'signin';
      localStorage.removeItem('user')
    })
    .catch(err => console.log('network error'));
  }


  componentDidMount() {
    fetch('/api/getAllOrders', {
      method:'POST',
      credentials: 'same-origin',
      headers :{'content-type': 'application/json'},
      body:JSON.stringify({userId: localStorage.getItem('userId') })

    })
      .then(response => response.json())
      .then(data => {
        if (data.message) {
          if (data.message.includes('redirect to signin page')) this.props.history.push('/signin');
          if (data.message.includes('unauthorized')) this.props.history.push('/signin');
        }


        this.setState({ ordersArray: data.data ? data.data : [] }, () => {
          let orderDate;
          let currentDate = new Date();

          this.state.ordersArray.map(order => {

            orderDate = new Date(order.delivery_date);

            var timeDiff = Math.abs(orderDate.getTime() - currentDate.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));




            if (diffDays === 3 || diffDays === 2 || diffDays === 1) {

            arrayToSaveNearOrders.push(order);
            notificationCounter ++;
            this.setState({showRedDot: arrayToSaveNearOrders.filter(order => order.seen === false).length === arrayToSaveNearOrders.length,
          })

            }




           });
        });
      })
      .catch(err => {
        console.log(
          'Something error happened while trying getting all orders: ',
          err
        );
      });
  }

  openNav() {
    document.getElementById('mySidenav').style.width = '250px';
  }

  closeNav() {
    document.getElementById('mySidenav').style.width = '0';
  }

  openNotification(e) {
    document.getElementById('mySideNotification').style.width = '250px';
    document.getElementById('mySideNotification').classList.add('hidden47');
    this.setState({ showRedDot: false });
  }

  closeNotification(e) {
    document.getElementById('mySideNotification').classList.remove('hidden47');
    document.getElementById('mySideNotification').style.width = '0';
    fetch('/api/updateSeenValue', {
      method: 'POST',
      credentials: 'same-origin',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({
        ids: arrayToSaveNearOrders.map(order => order.id)
      })
    }).then()
    .catch(err=>console.log('Something went wrong white update seen value'))
  }

  render() {

    return (
      <div>
        <div className="headerDiv">
          <div>
            <i onClick={this.openNav} className="fas fa-bars menuIcon" />
          </div>

          <div>
            <h2
              className={`headerTitle ${
                this.props.newStyle ? 'takeNewStyle' : ''
              }`}
            >
              {this.props.title}
            </h2>
          </div>

          <div>
            <i onClick={this.openNotification} className="fas fa-bell notificationIcon">
              <span className={`dot notificationNumber ${this.state.showRedDot ? 'visible' : 'hidden'}`} ref="dot">
                {notificationCounter}
               </span>
            </i>

          </div>
        </div>

        <div id="mySidenav" className="sidenav">
          <a
            href="javascript:void(0)"
            className="closebtn"
            onClick={this.closeNav}
          >
            <span className="crossIconForHeader">&times;</span>
          </a>

          <div className="sideBarImgDiv">
            <img src={logo} className="sideBarImg" alt="LOGO" />
          </div>

          <a href="/" className="sideMenuLabel">
            <i className="fas fa-home sideMenuLabel" /> Home
          </a>

          <a href="#">
            <i className="fas fa-user" /> Profile
          </a>

          <button className="sign-out-link" onClick={this.handleSignout} >
            <i className="fas fa-sign-out-alt" /> Sign out
          </button>
        </div>

        <div id="mySideNotification" className="sideNotification">
          <a
            href="javascript:void(0)"
            className="closebtn"
            onClick={this.closeNotification}
          >
            <span className="crossIconForNotification">&times;</span>
          </a>

          <div>
            {arrayToSaveNearOrders.length !== 0 &&
            arrayToSaveNearOrders.filter(order => {
              return order.seen === false;
            }).length === arrayToSaveNearOrders.length ? (
              arrayToSaveNearOrders.map((order, index) => {
                return (
                  <NotificationDiv
                    id={order.id}
                    delivery_date={order.delivery_date.split('T')[0]}
                    key={index}
                  />
                );
              })
            ) : (
              <div className="centerLoadingIcon">
                <span className="noNotification">
                  There is no notifications!!
                </span>
              </div>
            )}
          </div>
        </div>
      </div>
    );
  }
}

export default HeaderWithSideBar;
