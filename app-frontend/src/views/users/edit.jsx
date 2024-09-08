import { useState, useEffect } from 'react';
import api from '../../api';
import { useNavigate, Link, useParams } from 'react-router-dom';
import Swal from 'sweetalert2';

export default function UserEdit() {

    const navigate = useNavigate();

    const { id } = useParams()

    const [user, setUser] = useState({});
    const [nama, setNama] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [flag, setFlag] = useState(1);
    const token = localStorage.getItem("token");
    const [validation, setValidation] = useState([]);
    const [validationError, setValidationError] = useState({});

    const fetchData = async () => {

        //set axios header dengan type Authorization + Bearer token
        api.defaults.headers.common['Authorization'] = `Bearer ${token}`
        //fetch user from Rest API
        await api.get(`http://localhost:8000/api/users/${id}`)
        .then(({data})=>{
              const { fullname, email, password, flag } = data.data
              setNama(fullname)
              setEmail(email)
              setPassword(password)
              setFlag(flag)
        }).catch(({response:{data}})=>{
          Swal.fire({
            text:data.message,
            icon:"error"
          })
        })
    }

    const updateUser = async (e) => {
        e.preventDefault();
        
        //initialize formData
        const formData = new FormData();

        //append data to formData
        formData.append('_method', 'PATCH');
        formData.append('fullname', nama);
        formData.append('email', email);
        formData.append('password', password);
        formData.append('flag', flag);

        //send data to server
        await api.post(`http://localhost:8000/api/users/${id}`, formData)
        .then((response) => {

            Swal.fire({
                icon:"success",
                text:response.message
              })

            navigate('/users');
        })
        .catch(({response})=>{
          if(response.status===422){
            setValidationError(response.errors)
          }else{
            Swal.fire({
              text:response.message,
              icon:"error"
            })
          }
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
                            <h4 className="fw-bold">EDIT USER</h4>
                            <hr/>
                            {
                                validation.message && (
                                    <div className="alert alert-danger">
                                        {validation.message}
                                    </div>
                                )
                            }
                            <form onSubmit={updateUser}>
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
                                    <label className="form-label">PASSWORD<sup>(kosongkan saja jika tidak mau ganti)</sup></label>
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
                                    <input type="hidden" className="form-control" min="1" max="1" value="{flag}" onChange={(e) => setFlag(e.target.value)}/>
                                </div>
                                <div className="d-grid gap-2">
                                    <button type="submit" className="btn btn-primary">UPDATE</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}