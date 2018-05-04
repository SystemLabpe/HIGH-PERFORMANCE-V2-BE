<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function createDataResponse($data){
        return response()->json(['data' => $data], 200);
    }

    public function createSuccessResponse(){
        return response()->json([], 204);
    }

    public function createErrorResponse($message,$code){
        return response()->json(['message' => $message, 'code'=>$code], 400);
    }

    //TODO CREATE VALIDATION CUSTOM RESPONSE
}
