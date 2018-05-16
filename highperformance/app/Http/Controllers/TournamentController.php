<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 15/05/2018
 * Time: 6:48 PM
 */

namespace App\Http\Controllers;

use App\Tournament;
use Illuminate\Http\Request;
use Log;

class TournamentController extends Controller{

    public function allMe(){
        $list = Tournament::where('active',config('active.ACTIVE'))
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addMe(Request $request){
        $request->validate([
            'name' => 'required',
            'date_init' => 'required',
            'date_end' => 'required',
        ]);

        $obj = new Tournament();
        $obj->name = $request->name;
        $obj->date_init = $request->date_init;
        $obj->date_end = $request->date_end;
        $obj->club_id = $request->user()->club_id;

        $obj->save();

        return $this->createDataResponse($obj);
    }

    public function editMe(Request $request,$id){
        $obj = Tournament::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $obj->name = $request->name;
        }

        if($request->has('date_init')){
            $obj->date_init = $request->date_init;
        }

        if($request->has('date_end')){
            $obj->date_end = $request->date_end;
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function deleteMe($id){
        $obj = Tournament::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $obj->active = config('active.INACTIVE');
        $obj->save();
        return $this->createSuccessResponse();
    }

}