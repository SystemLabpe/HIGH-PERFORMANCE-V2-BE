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

    public function me(Request $request){
        return $request->user();
    }

//Route::get('users/club/{club_id}', 'UserController@allByClub');
//Route::post('user/club/{club_id}', 'UserController@addByClub');


    public function allByClub($club_id){
        $users = User::where('active',config('active.ACTIVE'))
                ->where('club_id',$club_id)
                ->get();
        if(count($users)>0){
            return $this->createDataResponse($users);
        }
        return $this->createErrorResponse('Empty club list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addByClub(Request $request){
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