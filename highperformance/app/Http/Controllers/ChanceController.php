<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 17/05/2018
 * Time: 8:32 PM
 */

namespace App\Http\Controllers;

use App\Chance;
use Illuminate\Http\Request;
use Log;

class ChanceController extends Controller{

    public function allByMatch($matchId){
        $list = Chance::with([
            'match','stopped_ball','start_type','field_zone','initial_penetration','player_position',
            'field_area','invation_level','numerical_balance','possession_pass','penetrating_pass','progression_type',
            'pentagon_completion','previous_action','completion_action','penultimate_field_zone','last_field_zone'])
            ->where('match_id',$matchId)
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addMe(Request $request){
        $request->validate([
            'is_home' => 'required',
            'chance_type' => 'required',
            'chance_minute' => 'required',
            'is_goal' => 'required',
            'match_id' => 'required'
        ]);

        $obj = new Chance();
        $obj->is_home = $request->is_home;
        $obj->chance_type = $request->chance_type;
        $obj->chance_minute = $request->chance_minute;
        $obj->is_goal = $request->is_goal;
        $obj->match_id = $request->match_id;

        if($request->has('url_detail')){
            $obj->url_detail = $request->url_detail;
        }

        $obj->save();

        $returnObj = Chance::with([
            'match','stopped_ball','start_type','field_zone','initial_penetration','player_position',
            'field_area','invation_level','numerical_balance','possession_pass','penetrating_pass','progression_type',
            'pentagon_completion','previous_action','completion_action','penultimate_field_zone','last_field_zone'])
            ->find($obj->id);

        return $this->createDataResponse($returnObj);
    }

    public function editMe(Request $request,$id){
        $obj = Match::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('match_date')){
            $obj->match_date = $request->match_date;
        }

        if($request->has('home_score')){
            $obj->home_score = $request->home_score;
        }

        if($request->has('away_score')){
            $obj->away_score = $request->away_score;
        }

        if($request->has('tournament_id')){
            $obj->tournament_id = $request->tournament_id;
        }

        if($request->has('home_club_id')){
            $obj->home_club_id = $request->home_club_id;
        }

        if($request->has('away_club_id')){
            $obj->away_club_id = $request->away_club_id;
        }

        if($request->has('url_detail')){
            $obj->url_detail = $request->url_detail;
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function deleteMe($id){
        $obj = Match::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }
        $obj->delete();
        return $this->createSuccessResponse();
    }

}