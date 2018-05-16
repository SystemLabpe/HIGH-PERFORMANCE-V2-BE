<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 15/05/2018
 * Time: 6:47 PM
 */

namespace App\Http\Controllers;

use App\Player;
use Illuminate\Http\Request;
use Log;

class PlayerController extends Controller{

    public function allMe(Request $request){
        $list = Player::where('active',config('active.ACTIVE'))
            ->where('club_id',$request->user()->club_id)
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addMe(Request $request){
        $request->validate([
            'name' => 'required',
        ]);

        $obj = new Player();
        $obj->name = $request->name;
        $obj->club_id = $request->user()->club_id;

        if($request->has('birth_date')){
            $obj->birth_date = $request->birth_date;
        }

        $obj->save();

        return $this->createDataResponse($obj);
    }

    public function editMe(Request $request,$id){
        $obj = Player::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $obj->name = $request->name;
        }

        if($request->has('birth_date')){
            $obj->birth_date = $request->birth_date;
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function deleteMe($id){
        $obj = Player::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $obj->active = config('active.INACTIVE');
        $obj->save();
        return $this->createSuccessResponse();
    }



}