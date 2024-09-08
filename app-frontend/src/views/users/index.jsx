import { useState, useEffect } from 'react';
import api from '../../api';
import { useNavigate, Link } from 'react-router-dom';
import Swal from 'sweetalert2';

export default function UserIndex() {

    const navigate = useNavigate();
    const [user, setUser] = useState({});
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
            setUser(response.data.data);

        })
    }

    const deleteUser = async (id) => {

        const isConfirm = await Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            return result.isConfirmed
          });

          if(!isConfirm){
            return;
          }

          await api.delete(`http://localhost:8000/api/users/${id}`).then(({data})=>{
            Swal.fire({
                icon:"success",
                text:data.message
            })
            fetchData()
            navigate('/')
          }).catch(({response:{data}})=>{
            Swal.fire({
                text:data.message,
                icon:"error"
            })
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
                    <Link to="/users/create" className="btn btn-md btn-success rounded shadow border-0 mb-3">ADD USER</Link>
                    <div className="card border-0 rounded shadow">
                        <div className="card-body">
                            <table className="table table-bordered">
                                <thead className="bg-dark text-white">
                                    <tr><th scope="col">#</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Flag</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {
                                        Object.entries(user).length > 0
                                        ?
                                        user.map((u,i) => 

                                            (
                                                    <tr key={ i }>
                                                        <td>{ i+1 }</td>
                                                        <td>{ u.fullname }</td>
                                                        <td>{ u.email }</td>
                                                        <td>{ u.flag == 0 ? "Admin" : "Normal" }</td>
                                                        <td>
                                                            <Link to={`/users/edit/${u.id}`} className="btn btn-md btn-success rounded shadow border-0 mb-3">EDIT</Link>&nbsp;
                                                            <button className="btn btn-md btn-danger rounded shadow border-0 mb-3" onClick={()=>deleteUser(u.id)}>
                                                                DEL
                                                            </button>
                                                        </td>
                                                    </tr>
                                                ))
                                        :   
                                            <tr>
                                                <td colSpan="4" className="text-center">
                                                    <div className="alert alert-danger mb-0">
                                                         Data Belum Tersedia!
                                                     </div>
                                                 </td>
                                            </tr>
                                           
                                    }
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}