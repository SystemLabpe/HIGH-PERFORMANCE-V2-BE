<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 1/05/2018
 * Time: 11:41 AM
 */

namespace App\Http\Controllers;


use App\User;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;
use Log;

class UserController extends Controller {

    public function all(){
        $users = User::all();
        return $this->createDataResponse($users);
    }

    public function add(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'u_type' => 'required',
        ]);

        $user = User::select('id')->where('email',$request->email)->first();
        if($user){
            return $this->createErrorResponse('Email already exists',config('customErrors.EXISTING_EMAIL'));
        }

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->u_type = $request->u_type;
        $user->save();

        return $this->createDataResponse($user);
    }

}