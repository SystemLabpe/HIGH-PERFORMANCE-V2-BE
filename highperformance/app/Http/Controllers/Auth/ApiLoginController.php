<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 2/05/2018
 * Time: 9:30 AM
 */

namespace App\Http\Controllers\Auth;

use App\User;
use Illuminate\Http\Request;
use Laravel\Passport\Http\Controllers\AccessTokenController;
use Psr\Http\Message\ServerRequestInterface;
use Log;

class ApiLoginController extends AccessTokenController {

    public function issueToken(ServerRequestInterface $request){
        $requestbody = (object)$request->getParsedBody();

        $user = User::select('u_type')->where('email',$requestbody->email)->first();

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
            'username' => $requestbody->email,
            'password' => $requestbody->password,
            'scope' => $scope
        ]);
        return parent::issueToken($tokenRequest);
    }

    public function revokeToken(Request $request) {
        $request->user()->token()->revoke();
        return response()->json([], 204);
    }



}