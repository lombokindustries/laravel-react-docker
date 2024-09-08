//import useState dan useEffect
import { useState, useEffect } from 'react';

//import api
import api from '../../api';

//import Link
import { useNavigate, Link } from 'react-router-dom';

export default function CurrencyIndex() {

    //ini state
    const navigate = useNavigate();
    const [currencies, setCurrencies] = useState([]);
    const [duit, setDuit] = useState([]);
    const [tgl, setTgl] = useState('');
    const [tukar, setTukar] = useState('');
    const [ls, setLs] = useState(new Date());
    const token = localStorage.getItem("token");
    const fn = localStorage.getItem("fn");
    const fl = localStorage.getItem("fl");
    const id = localStorage.getItem("id");

    //define method
    const fetchDataCurrencies = async () => {

        //fetch data from API with Axios
        await api.get('https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json')
            .then(response => {
                setTukar(JSON.stringify(response.data.usd));
                setCurrencies(response.data.usd);
            })
        
    }

    const storeCurrencies = async () => {
        await api.post('http://localhost:8000/api/currencies', {
            usd: tukar,
            lastsync: ls
        })
        .then(() => {
            //redirect
            // history.push('/currencies');
            window.location.href('/currencies');
        })
        // .catch((error) => {
        //     setValidation(error.response.data);
        // })
    }

    const fetchLocalCurrencies = async () => {

        //fetch data from API with Axios
        await api.get('http://localhost:8000/api/currencies')
            .then(response => { 
                setDuit(JSON.parse(response.data.data[0].usd));
                setTgl(response.data.data[0].lastsync);
            })
        
    }

    //run hook useEffect
    useEffect(() => {
        if(!token) {

            //redirect login page
            navigate('/');
        }

        //call method "fetchDataCurrencies"
        fetchDataCurrencies();
        storeCurrencies();
        fetchLocalCurrencies();

    }, []);

    const syncHanlder = async () => {

        // navigate('/currencies');
        location.reload();

    };

    return (
        <div className="container mt-5 mb-5">
            <div className="row">
                <div className="col-md-12">
                    <button onClick={syncHanlder} className="btn btn-md btn-warning">SYNC NOW!</button>
                    <h1>{ tgl }</h1>
                    <div className="card border-0 rounded shadow">
                        <div className="card-body">
                            <table className="table table-bordered">
                                <thead className="bg-dark text-white">
                                    <tr>
                                        <th scope="col">Exchange</th>
                                        <th scope="col">Rate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {
                                        Object.entries(duit).length > 0
                                        ?
                                        Object.entries(duit).map((c,i) => 

                                            (
                                                    <tr key={ i }>
                                                        <td>{ c[0] }</td>
                                                        <td>{ c[1] }</td>
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