<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 5:07 PM
 */

namespace App\Http\Controllers;

use App\Chance;
use App\Club;
use App\Match;
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

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addCustomer(Request $request){
        $request->validate([
            'full_name' => 'required',
        ]);

        $club = new Club();
        $club->full_name = $request->full_name;
        if($request->has('picture')){
            $club->picture = $request->picture;
        }

        $club->save();

        return $this->createDataResponse($club);
    }

    public function editCustomer(Request $request,$id){
        $club = Club::find($id);
        if(!$club){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
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
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        $club->users()->delete();

        $club->active = config('active.INACTIVE');
        $club->save();
        return $this->createSuccessResponse();
    }


    public function allRivals(Request $request){
        $clubs = Club::where('active',config('active.ACTIVE'))
            ->where('rival_club_id',$request->user()->club_id)
            ->get();

        if(count($clubs)>0){
            return $this->createDataResponse($clubs);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addRival(Request $request){
        $request->validate([
            'full_name' => 'required',
        ]);

        $club = new Club();
        $club->full_name = $request->full_name;
        $club->rival_club_id = $request->user()->club_id;

        if($request->has('picture')){
            $club->picture = $request->picture;
        }

        $club->save();

        return $this->createDataResponse($club);
    }

    public function editRival(Request $request,$id){
        $club = Club::find($id);
        if(!$club){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
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

    public function deleteRival($id){
        $club = Club::find($id);
        if(!$club){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }
        $club->tournaments()->sync([]);

        Chance::whereHas('match', function ($query) use($id){
            $query->where('home_club_id',$id)
                  ->orWhere('away_club_id',$id);
            })
            ->delete();

        Match::where('home_club_id',$id)
            ->orWhere('away_club_id',$id)
            ->delete();

        $club->delete();
        return $this->createSuccessResponse();
    }

    public function rivalsByTournament($tournamentId){
//        $clubs = Club::where('active',config('active.ACTIVE'))
//            ->where('rival_club_id',$request->user()->club_id)
//            ->get();

        $clubs = Club::whereHas('tournaments', function ($query) use($tournamentId){
                $query->where('id',$tournamentId);
            })
            ->get();

        if(count($clubs)>0){
            return $this->createDataResponse($clubs);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }
}