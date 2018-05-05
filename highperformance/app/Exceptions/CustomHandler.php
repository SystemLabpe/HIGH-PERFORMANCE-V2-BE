<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 2/05/2018
 * Time: 7:26 PM
 */

namespace App\Exceptions;


use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Validation\ValidationException;
use Laravel\Passport\Exceptions\MissingScopeException;
use Log;

class CustomHandler extends Handler{

    public function render($request, Exception $e){
        if ($e instanceof ValidationException) {
            return response()->json($e->errors(), 400);
        }else if($e instanceof \BadMethodCallException){
            return response()->json(['message' => 'Unauthorized', 'code'=> config('customErrors.UNAUTHORIZED')], 401);
        }else if($e instanceof  MissingScopeException){
            return response()->json(['message' => 'Invalid scope', 'code'=> config('customErrors.UNAUTHORIZED')], 401);
        }else if($e instanceof AuthenticationException){
            return response()->json(['message' => 'Unauthorized', 'code'=> config('customErrors.UNAUTHORIZED')], 401);
        } else{
            return response()->json(['message' => "Internal Error",'code' => 500], 500);
//            Log::info($e->getTraceAsString());
//            return response()->json($e->getTraceAsString());
        }
//        return parent::render($request, $e);
    }

}

//League\OAuth2\Server\Exception\OAuthServerException