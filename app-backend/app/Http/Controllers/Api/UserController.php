<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
     /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new UserResource(User::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fullname'     => 'required',
            'email'     => 'required',
            'password'     => 'required',
            'flag'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $u = User::create([
                'fullname'     => $request->fullname,
                'email'   => $request->email,
                'password'   => Hash::make($request->password),
                'flag'   => $request->flag,
            ]);
        return new UserResource($u);
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        return new UserResource($user);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $validator = Validator::make($request->all(), [
            'fullname'     => 'required',
            'email'     => 'required',
            'password'     => 'required',
            'flag'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

         $user->update([
                'fullname'     => $request->fullname,
                'email'   => $request->email,
                'password'   => empty($request->password) ? $user->password : Hash::make($request->password),
                'flag'   => $request->flag,
            ]);

        return new UserResource($user);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();
        return response()->noContent();
    }
}
