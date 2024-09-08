import { useState, useEffect } from 'react';
import api from '../../api';
import { useNavigate, Link } from 'react-router-dom';

export default function UserCreate() {

    const navigate = useNavigate();
    const [user, setUser] = useState({});
    const [nama, setNama] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [flag, setFlag] = useState(1);
    const token = localStorage.getItem("token");
    const [validation, setValidation] = useState([]);

    const fetchData = async () => {

        //set axios header dengan type Authorization + Bearer token
        api.defaults.headers.common['Authorization'] = `Bearer ${token}`
        //fetch user from Rest API
        await api.get('http://localhost:8000/api/users')
        .then((response) => {

            //set response user to state
            setUser(response.data.data[0]);

        })
    }

    const storeUser = async (e) => {
        e.preventDefault();
        
        //initialize formData
        const formData = new FormData();

        //append data to formData
        formData.append('fullname', nama);
        formData.append('email', email);
        formData.append('password', password);
        formData.append('flag', flag);

        //send data to server
        await api.post('http://localhost:8000/api/users', formData)
        .then((response) => {

            //set token on localStorage
            localStorage.setItem('token', response.data.token);

            //redirect to dashboard
            navigate('/users');
        })
        .catch((error) => {

            //assign error to state "validation"
            setValidation(error.response.data);
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
        //fetch Rest API
        await api.post('http://localhost:8000/api/logout')
        .then(() => {

            //remove token from localStorage
            localStorage.removeItem("token");

            //redirect halaman login
            navigate('/');
        });
    };

    return (
        <div className="container mt-5 mb-5">
            <div className="row">
                <div className="col-md-12">
                    <div className="card border-0 rounded shadow">
                        <div className="card-body">
                            

                            <h4 className="fw-bold">CREATE USER</h4>
                            <hr/>
                            {
                                validation.message && (
                                    <div className="alert alert-danger">
                                        {validation.message}
                                    </div>
                                )
                            }
                            <form onSubmit={storeUser}>
                                <div className="mb-3">
                                    <label className="form-label">Full Name</label>
                                    <input type="text" className="form-control" value={nama} onChange={(e) => setNama(e.target.value)} placeholder="Masukkan Nama"/>
                                </div>
                                {
                                    validation.fullname && (
                                        <div className="alert alert-danger">
                                            {validation.fullname[0]}
                                        </div>
                                    )
                                }
                                <div className="mb-3">
                                    <label className="form-label">Email</label>
                                    <input type="email" className="form-control" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Masukkan Alamat Email"/>
                                </div>
                                {
                                    validation.email && (
                                        <div className="alert alert-danger">
                                            {validation.email[0]}
                                        </div>
                                    )
                                }
                                <div className="mb-3">
                                    <label className="form-label">PASSWORD</label>
                                    <input type="password" className="form-control" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Masukkan Password"/>
                                </div>
                                {
                                    validation.password && (
                                        <div className="alert alert-danger">
                                            {validation.password[0]}
                                        </div>
                                    )
                                }
                                <div className="mb-3">
                                    <input type="hidden" className="form-control" min="1" max="1" value="1" onChange={(e) => setFlag(e.target.value)}/>
                                </div>
                                <div className="d-grid gap-2">
                                    <button type="submit" className="btn btn-primary">SUBMIT</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}