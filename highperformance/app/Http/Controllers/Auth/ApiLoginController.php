<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 2/05/2018
 * Time: 9:30 AM
 */

namespace App\Http\Controllers\Auth;


use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Laravel\Passport\Http\Controllers\AccessTokenController;
use Psr\Http\Message\ServerRequestInterface;
use Log;

class ApiLoginController extends AccessTokenController {

    public function issueToken(ServerRequestInterface $request){
        $requestbody = (object)$request->getParsedBody();

        $user = User::select('u_type')->where('email',$requestbody->username)->first();

        $scope = null;
        if($user){
            if($user->u_type == config('userType.USER')){
                $scope= 'user';
            }else if($user->u_type == config('userType.ADMIN')){
                $scope= 'admin';
            }
        }

        $tokenRequest = $request->withParsedBody([
            'grant_type' => 'password',
            'client_id' => '2',
            'client_secret' => '1ro0u1LynfTZS7BNn6wGLxF3fx2dyyipRkGNr8AB',
            'username' => $requestbody->username,
            'password' => $requestbody->password,
            'scope' => $scope
        ]);
        return parent::issueToken($tokenRequest);
    }



}