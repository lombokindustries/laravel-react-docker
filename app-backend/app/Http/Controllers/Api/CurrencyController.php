<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\CurrencyResource;
use App\Models\Currency;
use Illuminate\Support\Facades\Validator;

class CurrencyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new CurrencyResource(Currency::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'usd'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $check = Currency::orderBy('id','desc')->first();

        if(!empty($check))
        {
            Currency::where('id',$check->id)->update([
                'usd'     => $request->usd,
                'lastsync'   => date("Y-m-d H:i:s", strtotime($request->lastsync)),
            ]);

            return new CurrencyResource($check);
        }
        else
        {
            $c = Currency::create([
                    'usd'     => $request->usd,
                    'lastsync'   => date("Y-m-d H:i:s", strtotime($request->lastsync)),
            ]);

            return new CurrencyResource($c);
        }

        
    }

    /**
     * Display the specified resource.
     */
    public function show(Currency $currency)
    {
        return new CurrencyResource($currency);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Currency $currency)
    {
        $validator = Validator::make($request->all(), [
            'usd'     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

         $currency->update([
                'usd'     => $request->usd,
                'lastsync'   => $request->lastsync,
            ]);

        return new CurrencyResource($currency);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Currency $currency)
    {
        $currency->delete();
        return response()->noContent();
    }
}
