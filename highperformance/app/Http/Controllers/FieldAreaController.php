<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 7:41 PM
 */

namespace App\Http\Controllers;

use App\FieldArea;
use Illuminate\Http\Request;
use Log;

class FieldAreaController extends Controller{

    public function all(){
        $fieldAreas = FieldArea::where('active',config('active.ACTIVE'))
            ->get();

        if(count($fieldAreas)>0){
            return $this->createDataResponse($fieldAreas);
        }

        return $this->createErrorResponse('Empty Field Area list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function add(Request $request){
        $request->validate([
            'name' => 'required',
        ]);

        $fieldArea = new FieldArea();
        $fieldArea->name = $request->name;

        if($request->has('fa_desc')){
            $fieldArea->fa_desc = $request->fa_desc;
        }

        $fieldArea->save();

        return $this->createDataResponse($fieldArea);
    }

    public function edit(Request $request,$id){
        $fieldArea = FieldArea::find($id);
        if(!$fieldArea){
            return $this->createErrorResponse('Field Area not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('name')){
            $fieldArea->name = $request->name;
        }

        if($request->has('fa_desc')){
            $fieldArea->fa_desc = $request->fa_desc;
        }

        $fieldArea->save();
        return $this->createSuccessResponse();
    }

    public function delete($id){
        $fieldArea = FieldArea::find($id);
        if(!$fieldArea){
            return $this->createErrorResponse('Club not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $fieldArea->active = config('active.INACTIVE');
        $fieldArea->save();
        return $this->createSuccessResponse();
    }

}