<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 10/05/2018
 * Time: 6:57 PM
 */

namespace App\Http\Controllers;

use App\PlayerPosition;
use Illuminate\Http\Request;
use Log;

class PlayerPositionController extends Controller{

    public function all(){
        $list = PlayerPosition::where('active',config('active.ACTIVE'))
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function add(Request $request){
        $request->validate([
            'name' => 'required',
        ]);

        $obj = new PlayerPosition();
        $obj->name = $request->name;

        if($request->has('v_desc')){
            $obj->v_desc = $request->v_desc;
        }

        if($request->has('picture')){
            $obj->picture = $request->picture;
        }

        $obj->save();

        return $this->createDataResponse($obj);
    }

    public function edit(Request $request,$id){
        $obj = PlayerPosition::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $obj->name = $request->name;
        }

        if($request->has('v_desc')){
            $obj->v_desc = $request->v_desc;
        }

        if($request->has('picture')){
            $obj->picture = $request->picture;
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function delete($id){
        $obj = PlayerPosition::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $obj->active = config('active.INACTIVE');
        $obj->save();
        return $this->createSuccessResponse();
    }

}