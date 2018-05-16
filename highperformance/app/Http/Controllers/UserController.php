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
        $user = User::with('club')->find($request->user()->id);
        return $user;
    }

    public function allByClub($club_id){
        $users = User::where('club_id',$club_id)->get();
        if(count($users)>0){
            return $this->createDataResponse($users);
        }
        return $this->createErrorResponse('Empty User list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addByClub(Request $request,$club_id){
        $request->validate([
            'name' => 'required',
            'email' => 'required',
        ]);

        $user = User::select('id')->where('email',$request->email)->first();
        if($user){
            return $this->createErrorResponse('Email already exists',config('customErrors.EXISTING_EMAIL'));
        }

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make('123456');
        $user->u_type = config('userType.USER');
        $user->club_id = $club_id;
        $user->save();

        return $this->createDataResponse($user);
    }

    public function editByClub(Request $request,$id){
        $user = User::find($id);
        if(!$user){
            return $this->createErrorResponse('User not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $user->name = $request->name;
        }

        if($request->has('email')){
            $existingUser = User::select('id')->where('email',$request->email)->first();
            if($existingUser){
                return $this->createErrorResponse('Email already exists',config('customErrors.EXISTING_EMAIL'));
            }
            $user->email = $request->email;
        }

        $user->save();
        return $this->createSuccessResponse();
    }

    public function deleteByClub($id){
        $user = User::find($id);
        if(!$user){
            return $this->createErrorResponse('User not found',config('customErrors.ENTITY_NOT_FOUND'));
        }
        $user->delete();
        return $this->createSuccessResponse();
    }

}