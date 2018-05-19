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

        if($request->has('assisted_player')){
            $obj->assisted_player = $request->assisted_player;
        }
        if($request->has('scored_player')){
            $obj->scored_player = $request->scored_player;
        }
        if($request->has('stopped_ball_id')){
            $obj->stopped_ball_id = $request->stopped_ball_id;
        }
        if($request->has('start_type_id')){
            $obj->start_type_id = $request->start_type_id;
        }
        if($request->has('field_zone_id')){
            $obj->field_zone_id = $request->field_zone_id;
        }
        if($request->has('initial_penetration_id')){
            $obj->initial_penetration_id = $request->initial_penetration_id;
        }
        if($request->has('player_position_id')){
            $obj->player_position_id = $request->player_position_id;
        }
        if($request->has('field_area_id')){
            $obj->field_area_id = $request->field_area_id;
        }
        if($request->has('invation_level_id')){
            $obj->invation_level_id = $request->invation_level_id;
        }
        if($request->has('numerical_balance_id')){
            $obj->numerical_balance_id = $request->numerical_balance_id;
        }
        if($request->has('possession_passes_id')){
            $obj->possession_passes_id = $request->possession_passes_id;
        }
        if($request->has('penetrating_passes_id')){
            $obj->penetrating_passes_id = $request->penetrating_passes_id;
        }
        if($request->has('progression_type_id')){
            $obj->progression_type_id = $request->progression_type_id;
        }
        if($request->has('pentagon_completion_id')){
            $obj->pentagon_completion_id = $request->pentagon_completion_id;
        }
        if($request->has('previous_action_id')){
            $obj->previous_action_id = $request->previous_action_id;
        }
        if($request->has('completion_action_id')){
            $obj->completion_action_id = $request->completion_action_id;
        }
        if($request->has('penultimate_field_zone_id')){
            $obj->penultimate_field_zone_id = $request->penultimate_field_zone_id;
        }
        if($request->has('last_field_zone_id')){
            $obj->last_field_zone_id = $request->last_field_zone_id;
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
        $obj = Chance::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        if($request->has('is_home')){
            $obj->is_home = $request->is_home;
        }
        if($request->has('chance_type')){
            $obj->chance_type = $request->chance_type;
        }
        if($request->has('chance_minute')){
            $obj->chance_minute = $request->chance_minute;
        }
        if($request->has('is_goal')){
            $obj->is_goal = $request->is_goal;
        }
        if($request->has('assisted_player')){
            $obj->assisted_player = $request->assisted_player;
        }
        if($request->has('scored_player')){
            $obj->scored_player = $request->scored_player;
        }
        if($request->has('stopped_ball_id')){
            $obj->stopped_ball_id = $request->stopped_ball_id;
        }
        if($request->has('start_type_id')){
            $obj->start_type_id = $request->start_type_id;
        }
        if($request->has('field_zone_id')){
            $obj->field_zone_id = $request->field_zone_id;
        }
        if($request->has('initial_penetration_id')){
            $obj->initial_penetration_id = $request->initial_penetration_id;
        }
        if($request->has('player_position_id')){
            $obj->player_position_id = $request->player_position_id;
        }
        if($request->has('field_area_id')){
            $obj->field_area_id = $request->field_area_id;
        }
        if($request->has('invation_level_id')){
            $obj->invation_level_id = $request->invation_level_id;
        }
        if($request->has('numerical_balance_id')){
            $obj->numerical_balance_id = $request->numerical_balance_id;
        }
        if($request->has('possession_passes_id')){
            $obj->possession_passes_id = $request->possession_passes_id;
        }
        if($request->has('penetrating_passes_id')){
            $obj->penetrating_passes_id = $request->penetrating_passes_id;
        }
        if($request->has('progression_type_id')){
            $obj->progression_type_id = $request->progression_type_id;
        }
        if($request->has('pentagon_completion_id')){
            $obj->pentagon_completion_id = $request->pentagon_completion_id;
        }
        if($request->has('previous_action_id')){
            $obj->previous_action_id = $request->previous_action_id;
        }
        if($request->has('completion_action_id')){
            $obj->completion_action_id = $request->completion_action_id;
        }
        if($request->has('penultimate_field_zone_id')){
            $obj->penultimate_field_zone_id = $request->penultimate_field_zone_id;
        }
        if($request->has('last_field_zone_id')){
            $obj->last_field_zone_id = $request->last_field_zone_id;
        }

        $obj->save();
        return $this->createSuccessResponse();
    }

    public function deleteMe($id){
        $obj = Chance::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }
        $obj->delete();
        return $this->createSuccessResponse();
    }

}