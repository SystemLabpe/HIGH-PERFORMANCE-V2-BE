<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 8:04 PM
 */

namespace App\Http\Controllers;

use App\StartType;
use Illuminate\Http\Request;
use Log;

class StartTypeController extends Controller{

    public function all(){
        $startTypes = StartType::where('active',config('active.ACTIVE'))
            ->get();

        if(count($startTypes)>0){
            return $this->createDataResponse($startTypes);
        }

        return $this->createErrorResponse('Empty Start type list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function add(Request $request){
        $request->validate([
            'name' => 'required',
        ]);

        $startType = new StartType();
        $startType->name = $request->name;

        if($request->has('st_desc')){
            $startType->st_desc = $request->st_desc;
        }

        $startType->save();

        return $this->createDataResponse($startType);
    }

    public function edit(Request $request,$id){
        $startType = StartType::find($id);
        if(!$startType){
            return $this->createErrorResponse('Start type not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $startType->name = $request->name;
        }

        if($request->has('st_desc')){
            $startType->st_desc = $request->st_desc;
        }

        $startType->save();
        return $this->createSuccessResponse();
    }

    public function delete($id){
        $startType = StartType::find($id);
        if(!$startType){
            return $this->createErrorResponse('Start type not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $startType->active = config('active.INACTIVE');
        $startType->save();
        return $this->createSuccessResponse();
    }

}