<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 15/05/2018
 * Time: 6:48 PM
 */

namespace App\Http\Controllers;

use App\Chance;
use App\Match;
use App\Tournament;
use Illuminate\Http\Request;
use Log;

class TournamentController extends Controller{

    public function allMe(Request $request){
        $myClubId = $request->user()->club_id;
        $list = Tournament::
            with(['clubs'=>function ($query) use($myClubId) {
                $query
                    ->where('tournament_club.rival_club_id',$myClubId);
            }])
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
            'date_init' => 'required',
            'date_end' => 'required',
            'clubs' => 'required',
        ]);

        $obj = new Tournament();
        $obj->name = $request->name;
        $obj->date_init = $request->date_init;
        $obj->date_end = $request->date_end;
        $obj->club_id = $request->user()->club_id;

        $pivot = [];
        foreach ($request->clubs as $club){
            $club = (object)$club;
            $pivot[$club->id] = ['rival_club_id'=>$request->user()->club_id];
        }

        $obj->save();
        $obj->clubs()->sync($pivot);

        $myClubId = $request->user()->club_id;;
        $returnObj =Tournament::
            with(['clubs'=>function ($query) use($myClubId) {
                $query
                    ->where('tournament_club.rival_club_id',$myClubId);
            }])
            ->find($obj->id);

        return $this->createDataResponse($returnObj);
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

        if($request->has('clubs')){
            $pivot = [];
            foreach ($request->clubs as $club){
                $club = (object)$club;
                $pivot[$club->id] = ['rival_club_id'=>$request->user()->club_id];
            }
            $obj->clubs()->sync($pivot);
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function deleteMe($id){
        $obj = Tournament::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }
        $obj->clubs()->sync([]);


        Chance::whereHas('match', function ($query) use($id){
            $query->where('tournament_id',$id);
        })
            ->delete();

        Match::where('tournament_id',$id)
            ->delete();


        $obj->delete();
        return $this->createSuccessResponse();
    }

}