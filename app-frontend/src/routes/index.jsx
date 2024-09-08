import { Routes, Route } from "react-router-dom";

import Home from '../views/home.jsx';

import Login from '../views/login.jsx';
import UserIndex from '../views/users/index.jsx';
import UserCreate from '../views/users/create.jsx';
import UserEdit from '../views/users/edit.jsx';

import CurrencyIndex from '../views/currencies/index.jsx';

function RoutesIndex() {
    return (
        <Routes>
            <Route path="/" element={<Login />} />
            <Route path="/dashboard" element={<Home />} />

            <Route path="/users" element={<UserIndex />} />
            <Route path="/users/create" element={<UserCreate />} />
            <Route path="/users/edit/:id" element={<UserEdit />} />

            <Route path="/currencies" element={<CurrencyIndex />} />

        </Routes>
    )
}

export default RoutesIndex