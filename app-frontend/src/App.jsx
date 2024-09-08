import { useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import { useNavigate, Link } from "react-router-dom";
import Routes from './routes';
import api from './api';

function App() {
  const navigate = useNavigate();

    const [user, setUser] = useState({});
    const [flag, setFlag] = useState(1);
    const token = localStorage.getItem("token");
    const fn = localStorage.getItem("fn");
    const fl = localStorage.getItem("fl");
    const id = localStorage.getItem("id");

    const fetchData = async () => {

        //set axios header dengan type Authorization + Bearer token
        api.defaults.headers.common['Authorization'] = `Bearer ${token}`
        //fetch user from Rest API
        await api.get('http://localhost:8000/api/users')
        .then((response) => {

            //set response user to state
            setUser(response.data.data[0]);
            setFlag(user);
        })
    }

    //hook useEffect
    useEffect(() => {
        if(!token) {

            //redirect login page
            navigate('/');
        }

        fetchData();
    }, []);

    const logoutHanlder = async () => {

        //set axios header dengan type Authorization + Bearer token
        api.defaults.headers.common['Authorization'] = `Bearer ${token}`

            localStorage.removeItem("token");
            // localStorage.removeItem("fl");

            navigate('/');

    };

  return (
    <>
      <div>
        <nav className="navbar navbar-expand-sm bg-dark" data-bs-theme="dark">
          <div className="container">
            <Link to="/" className="navbar-brand">HOME</Link>
            <button
              className="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse" id="navbarSupportedContent">
            
             { fl == 0 ?
              <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
                <li className="nav-item">
                  <Link to="/users" className="nav-link active" aria-current="page">USER</Link>
                </li>
              </ul>
              : <span></span>
            }
              

            
              <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
                <li className="nav-item">
                  <Link to="/currencies" className="nav-link active" aria-current="page">CURRENCY</Link>
                </li>
              </ul>
            

          
              <ul className="navbar-nav ms-auto mb-2 mb-lg-0" role="search">
                <li className="nav-item">
                
                  <button onClick={logoutHanlder} className="btn btn-md btn-danger">LOGOUT</button>
                </li>
              </ul>
              
              

            </div>
          </div>
        </nav>
      </div>

      <Routes />

    </>
  )
}

export default App
