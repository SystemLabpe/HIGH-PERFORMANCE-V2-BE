<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 22/05/2018
 * Time: 11:24 AM
 */

namespace App\Http\Controllers;

use App\Chance;
use App\Match;
use Illuminate\Http\Request;
use Log;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller {

    //Torneo
    //Equipo
    //Local -  Visitante
    //Gano - Perdio
    //Equipo Rival


    private function startTypeReport($chancesIds){
        $count = Chance::whereIn('id', $chancesIds)->count();

        $report = Chance::
        select('chances.start_type_id AS id','start_types.name AS name', DB::raw('ROUND(100*COUNT(chances.start_type_id)/'.$count.',2) AS percentage'))
            ->join('start_types', 'start_types.id', '=', 'chances.start_type_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.start_type_id')
            ->get();

        return $report;
    }

    public function lastGameGeneralReport(Request $request){
        $userClubId = $request->user()->club_id;

        $lastMatch = Match::
            where('club_id',$userClubId)
            ->where(function($query)use($userClubId){
                return $query
                    ->where('home_club_id',$userClubId)
                    ->orWhere('away_club_id',$userClubId);
            })
            ->orderBy('match_date','ASC')
            ->first();

        $chances = Chance::where('match_id',$lastMatch->id)->get();

        $chancesIds = array();
        foreach ($chances as $chance){
            array_push($chancesIds,$chance->id);
        }

        if(count($chancesIds)>0){
            $response =(object)array();
            $response->startType = $this->startTypeReport($chancesIds);
            return $this->createDataResponse($response);
        }

        return $this->createErrorResponse('Not Chances Found',config('customErrors.ENTITY_NOT_FOUND'));

    }

}