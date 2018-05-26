<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 17/05/2018
 * Time: 3:38 PM
 */

namespace App\Http\Controllers;

use App\Chance;
use App\Match;
use Illuminate\Http\Request;
use Log;

class MatchController extends Controller {

    public function find($id){
        $obj = Match::with(['tournament','home_club','away_club'])
            ->find($id);

        if($obj){
            return $this->createDataResponse($obj);
        }

        return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
    }

    public function allMe(Request $request){
        $list = Match::with(['tournament','home_club','away_club'])
            ->where('club_id',$request->user()->club_id)
            ->orderBy('match_date','DESC')
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function addMe(Request $request){
        $request->validate([
            'match_date' => 'required',
            'home_score' => 'required',
            'away_score' => 'required',
            'tournament_id' => 'required',
            'home_club_id' => 'required',
            'away_club_id' => 'required',
        ]);


        $obj = new Match();
        $obj->match_date = $request->match_date;
        $obj->home_score = $request->home_score;
        $obj->away_score = $request->away_score;
        $obj->tournament_id = $request->tournament_id;
        $obj->club_id = $request->user()->club_id;
        $obj->home_club_id = $request->home_club_id;
        $obj->away_club_id = $request->away_club_id;

        if($request->has('url_detail')){
            $obj->url_detail = $request->url_detail;
        }

        $obj->save();

        $returnObj = Match::with(['tournament','home_club','away_club'])
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

        $returnObj = Match::with(['tournament','home_club','away_club'])
            ->find($obj->id);

        return $this->createDataResponse($returnObj);
    }

    public function deleteMe($id){
        $obj = Match::find($id);
        if(!$obj){
            return $this->createErrorResponse('Not found',config('customErrors.ENTITY_NOT_FOUND'));
        }

        Chance::where('match_id',$id)
            ->delete();

        $obj->delete();
        return $this->createSuccessResponse();
    }

    public function filterMe(Request $request){
        if(!$request->has('tournament_id') || !$request->has('first_club_id') || !$request->has('state_first_club_id') || !$request->has('second_club_id')){
            $request->validate([
                'tournament_id' => 'required',
                'first_club_id' => 'required',
                'state_first_club_id' => 'required',
                'second_club_id' => 'required'
            ]);
        }


        $query = Match::with(['tournament','home_club','away_club'])
            ->where('club_id',$request->user()->club_id);

        if($request->tournament_id){
            $query = $query->where('tournament_id',$request->tournament_id);
        }

        //TODO add value state_first_club_id in config file
        if($request->first_club_id && $request->state_first_club_id){
            if($request->state_first_club_id == 1){
                if($request->second_club_id){
                    $query = $query->where('home_club_id',$request->first_club_id);
                    $query = $query->where('away_club_id',$request->second_club_id);
                }else{
                    $query = $query->where('home_club_id',$request->first_club_id);
                }
            }else if($request->state_first_club_id == 2){
                if($request->second_club_id){
                    $query = $query->where('home_club_id',$request->second_club_id);
                    $query = $query->where('away_club_id',$request->first_club_id);
                }else{
                    $query = $query->where('away_club_id',$request->first_club_id);
                }
            }

        }else if($request->first_club_id){
            if($request->second_club_id){
                $first_club_id = $request->first_club_id;
                $second_club_id = $request->second_club_id;
                $query = $query
                    ->where(function($query)use($first_club_id,$second_club_id){
                        return $query
                            ->where('home_club_id',$first_club_id)
                            ->Where('away_club_id',$second_club_id);
                    })
                    ->orWhere(function($query)use($first_club_id,$second_club_id){
                        return $query
                            ->where('home_club_id',$second_club_id)
                            ->Where('away_club_id',$first_club_id);
                    });
            }else{
                $query = $query->where('home_club_id',$request->first_club_id)
                               ->orWhere('away_club_id',$request->first_club_id);
            }
        }


        $list=$query
            ->orderBy('match_date','DESC')
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

    public function allMeHome(Request $request){
        $list = Match::with(['tournament','home_club','away_club'])
            ->where('club_id',$request->user()->club_id)
            ->orderBy('match_date','DESC')
            ->skip(0)
            ->take(7)
            ->get();

        if(count($list)>0){
            return $this->createDataResponse($list);
        }

        return $this->createErrorResponse('Empty list',config('customErrors.NO_LIST_RESULTS'));
    }

}