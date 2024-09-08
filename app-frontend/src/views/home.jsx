import { useState, useEffect } from 'react';
import api from '../api';
import { useNavigate, Link } from 'react-router-dom';

export default function Home() {
    const navigate = useNavigate();
    const [user, setUser] = useState({});
    const token = localStorage.getItem("token");
    const fn = localStorage.getItem("fn");
    const fl = localStorage.getItem("fl");
    const id = localStorage.getItem("id");


    return (
        <div className="p-5 mb-4 bg-light rounded-3">
            <div className="container-fluid py-5">
                <h1 className="display-5 fw-bold">Dashboard</h1>

                SELAMAT DATANG <strong className="text-uppercase">{fn}</strong>

            </div>
        </div>
    )
}