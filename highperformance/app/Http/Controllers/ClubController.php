<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 5:07 PM
 */

namespace App\Http\Controllers;

use App\Club;
use Illuminate\Http\Request;
use Log;


class ClubController extends Controller{

    public function allCustomers(){
        $clubs = Club::where('active',config('active.ACTIVE'))
                ->whereNull('rival_club_id')
//                ->whereHas('users', function ($query) {
//                    $query->where('active',config('active.ACTIVE'));
//                })
                ->get();

        if(count($clubs)>0){
            return $this->createDataResponse($clubs);
        }

        return $this->createErrorResponse('Empty club list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addCustomer(Request $request){
        $request->validate([
            'full_name' => 'required',
        ]);

        $club = new Club();
        $club->full_name = $request->full_name;
        $club->save();

        return $this->createDataResponse($club);
    }

    public function editCustomer(Request $request,$id){
        $club = Club::find($id);
        if(!$club){
            return $this->createErrorResponse('Club not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('full_name')){
            $club->full_name = $request->full_name;
        }

        if($request->has('picture')){
            $club->picture = $request->picture;
        }

        $club->save();
        return $this->createSuccessResponse();
    }

    public function deleteCustomer($id){
        $club = Club::find($id);
        if(!$club){
            return $this->createErrorResponse('Club not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $club->active = config('active.INACTIVE');
        $club->save();
        return $this->createSuccessResponse();
    }
}