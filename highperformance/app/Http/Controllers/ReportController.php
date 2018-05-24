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


    //Test
    public function testReport(Request $request){
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

        $homeChances = Chance::where('match_id',$lastMatch->id)
            ->where('is_home',config('isHome.HOME'))
            ->get();

        $homeChancesIds = array();
        foreach ($homeChances as $homeChance){
            array_push($homeChancesIds,$homeChance->id);
        }
        $homeTotalChances = count($homeChancesIds);

        $awayChances = Chance::where('match_id',$lastMatch->id)
            ->where('is_home',config('isHome.AWAY'))
            ->get();

        $awayChancesIds = array();
        foreach ($awayChances as $awayChance){
            array_push($awayChancesIds,$awayChance->id);
        }
        $awayTotalChances = count($awayChancesIds);


        $response =(object)array();
        $response->initPossesion = (object)array();
        $response->initPossesion->name = 'Inicio de la Posesión';
        $response->initPossesion->data = $this->initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);

        return $this->createDataResponse($response);
    }

    //Get Major Percentage data
    private function getMajorPercentageData($homeArrayData, $awayArrayData){
        $homeMajor = null;
        if(count($homeArrayData)>0){
            $homeMajor = $homeArrayData[0];
        }
        $awayMajor = null;
        if(count($awayArrayData)>0){
            $awayMajor = $awayArrayData[0];
        }

        $percentageArrayData = array();
        if(is_null($homeMajor)){
            if(is_null($awayMajor)){
               return null;
            }else{
                $percentageData = (object)array();
                $percentageData->name = $awayMajor->name;
                $percentageData->homePercentage = null;
                $percentageData->awayPercentage = $awayMajor->percentage;
                array_push($percentageArrayData,$percentageData);
                return $percentageArrayData;
            }
        }else{
            if(is_null($awayMajor)){
                $percentageData = (object)array();
                $percentageData->name = $homeMajor->name;
                $percentageData->homePercentage = $homeMajor->percentage;
                $percentageData->awayPercentage = null;
                array_push($percentageArrayData,$percentageData);
                return $percentageArrayData;
            }else{
                if($homeMajor->id == $awayMajor->id){
                    $percentageData = (object)array();
                    $percentageData->name = $homeMajor->name;
                    $percentageData->homePercentage = $homeMajor->percentage;
                    $percentageData->awayPercentage = $awayMajor->percentage;
                    array_push($percentageArrayData,$percentageData);
                }else{
                    $firstPercentageData = (object)array();
                    $firstPercentageData->name = $homeMajor->name;
                    $firstPercentageData->homePercentage = $homeMajor->percentage;
                    $firstPercentageData->awayPercentage = null;
                    foreach ($awayArrayData as $awayData){
                        if($awayData->id == $homeMajor->id){
                            $firstPercentageData->awayPercentage = $awayData->percentage;
                            break;
                        }
                    }
                    array_push($percentageArrayData,$firstPercentageData);

                    $secondPercentageData = (object)array();
                    $secondPercentageData->name = $awayMajor->name;
                    $secondPercentageData->homePercentage = null;
                    $secondPercentageData->awayPercentage = $awayMajor->percentage;
                    foreach ($homeArrayData as $homeData){
                        if($homeData->id == $awayMajor->id){
                            $secondPercentageData->homePercentage = $homeData->percentage;
                            break;
                        }
                    }
                    array_push($percentageArrayData,$secondPercentageData);
                }
            }
        }

        return $percentageArrayData;
    }

    //Init possesion
    private function startTypeData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.start_type_id AS id','start_types.name AS name', DB::raw('ROUND(100*COUNT(chances.start_type_id)/'.$totalChances.',2) AS percentage'))
            ->join('start_types', 'start_types.id', '=', 'chances.start_type_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.start_type_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function fieldZoneData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function initialPenetrationData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.initial_penetration_id AS id','initial_penetrations.name AS name', DB::raw('ROUND(100*COUNT(chances.initial_penetration_id)/'.$totalChances.',2) AS percentage'))
            ->join('initial_penetrations', 'initial_penetrations.id', '=', 'chances.initial_penetration_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.initial_penetration_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function playerPositionData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.player_position_id AS id','player_positions.name AS name', DB::raw('ROUND(100*COUNT(chances.player_position_id)/'.$totalChances.',2) AS percentage'))
            ->join('player_positions', 'player_positions.id', '=', 'chances.player_position_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.player_position_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        //return $this->getMajorPercentageData($homeStartTypeArrayData,$awayStartTypeArrayData);

        $homeStartTypeArrayData = $this->startTypeData($homeChancesIds,$homeTotalChances);
        $awayStartTypeArrayData = $this->startTypeData($awayChancesIds,$awayTotalChances);
        $percentageStartTypeArrayData = $this->getMajorPercentageData($homeStartTypeArrayData,$awayStartTypeArrayData);

        $homeFieldZoneData = $this->fieldZoneData($homeChancesIds,$homeTotalChances);
        $awayFieldZoneData = $this->fieldZoneData($awayChancesIds,$awayTotalChances);
        $percentageFieldZoneArrayData = $this->getMajorPercentageData($homeFieldZoneData,$awayFieldZoneData);

        $homeInitialPenetrationData = $this->initialPenetrationData($homeChancesIds,$homeTotalChances);
        $awayInitialPenetrationData = $this->initialPenetrationData($awayChancesIds,$awayTotalChances);
        $percentageInitialPenetrationArrayData = $this->getMajorPercentageData($homeInitialPenetrationData,$awayInitialPenetrationData);

        $homePlayerPositionData =  $this->playerPositionData($homeChancesIds,$homeTotalChances);
        $awayPlayerPositionData = $this->playerPositionData($awayChancesIds,$awayTotalChances);
        $percentagePlayerPositionArrayData = $this->getMajorPercentageData($homePlayerPositionData,$awayPlayerPositionData);

        $chart = (object)array();
        $chart->type = 'radar';
//        $chart->options = (object)array();
//        $chart->options->responsive = true;
//        $chart->options->maintainAspectRatio = false;
        if(is_null($percentageStartTypeArrayData) && is_null($percentageFieldZoneArrayData) && is_null($percentageInitialPenetrationArrayData) &&is_null($percentagePlayerPositionArrayData) ){
            $chart->data = null;
        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();
            $chart->data->datasets = array();

            $localDataset = (object)array();
            $localDataset->label = 'Local';
            $localDataset->data = array();
            $localDataset->fill = true;
            $localDataset->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $localDataset->borderColor = 'rgb(254, 199, 34)';
            $localDataset->pointBackgroundColor = 'rgb(254, 199, 34)';
            $localDataset->pointBorderColor = '#fff';
            $localDataset->pointHoverBackgroundColor = '#fff';
            $localDataset->pointHoverBorderColor = 'rgb(254, 199, 34)';

            $awayDataset = (object)array();
            $awayDataset->label = 'Local';
            $awayDataset->data = array();
            $awayDataset->fill = true;
            $awayDataset->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $awayDataset->borderColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBackgroundColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBorderColor = '#fff';
            $awayDataset->pointHoverBackgroundColor = '#fff';
            $awayDataset->pointHoverBorderColor = 'rgb(36, 37, 47)';

            if(!is_null($percentageStartTypeArrayData)){
                if(count($percentageStartTypeArrayData)==1){
                    array_push($chart->data->labels,$percentageStartTypeArrayData[0]->name);
                    array_push($localDataset->data,$percentageStartTypeArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageStartTypeArrayData[0]->awayPercentage);
                }else{
                    array_push($chart->data->labels,$percentageStartTypeArrayData[0]->name);
                    array_push($localDataset->data,$percentageStartTypeArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageStartTypeArrayData[0]->awayPercentage);

                    array_push($chart->data->labels,$percentageStartTypeArrayData[1]->name);
                    array_push($localDataset->data,$percentageStartTypeArrayData[1]->homePercentage);
                    array_push($awayDataset->data,$percentageStartTypeArrayData[1]->awayPercentage);
                }
            }

            if(!is_null($percentageFieldZoneArrayData)){
                if(count($percentageFieldZoneArrayData)==1){
                    array_push($chart->data->labels,$percentageFieldZoneArrayData[0]->name);
                    array_push($localDataset->data,$percentageFieldZoneArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageFieldZoneArrayData[0]->awayPercentage);
                }else{
                    array_push($chart->data->labels,$percentageFieldZoneArrayData[0]->name);
                    array_push($localDataset->data,$percentageFieldZoneArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageFieldZoneArrayData[0]->awayPercentage);

                    array_push($chart->data->labels,$percentageFieldZoneArrayData[1]->name);
                    array_push($localDataset->data,$percentageFieldZoneArrayData[1]->homePercentage);
                    array_push($awayDataset->data,$percentageFieldZoneArrayData[1]->awayPercentage);
                }
            }

            if(!is_null($percentageInitialPenetrationArrayData)){
                if(count($percentageInitialPenetrationArrayData)==1){
                    array_push($chart->data->labels,$percentageInitialPenetrationArrayData[0]->name);
                    array_push($localDataset->data,$percentageInitialPenetrationArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageInitialPenetrationArrayData[0]->awayPercentage);
                }else{
                    array_push($chart->data->labels,$percentageInitialPenetrationArrayData[0]->name);
                    array_push($localDataset->data,$percentageInitialPenetrationArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentageInitialPenetrationArrayData[0]->awayPercentage);

                    array_push($chart->data->labels,$percentageInitialPenetrationArrayData[1]->name);
                    array_push($localDataset->data,$percentageInitialPenetrationArrayData[1]->homePercentage);
                    array_push($awayDataset->data,$percentageInitialPenetrationArrayData[1]->awayPercentage);
                }
            }

            if(!is_null($percentagePlayerPositionArrayData)){
                if(count($percentagePlayerPositionArrayData)==1){
                    array_push($chart->data->labels,$percentagePlayerPositionArrayData[0]->name);
                    array_push($localDataset->data,$percentagePlayerPositionArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentagePlayerPositionArrayData[0]->awayPercentage);
                }else{
                    array_push($chart->data->labels,$percentagePlayerPositionArrayData[0]->name);
                    array_push($localDataset->data,$percentagePlayerPositionArrayData[0]->homePercentage);
                    array_push($awayDataset->data,$percentagePlayerPositionArrayData[0]->awayPercentage);

                    array_push($chart->data->labels,$percentagePlayerPositionArrayData[1]->name);
                    array_push($localDataset->data,$percentagePlayerPositionArrayData[1]->homePercentage);
                    array_push($awayDataset->data,$percentagePlayerPositionArrayData[1]->awayPercentage);
                }
            }

            array_push($chart->data->datasets,$localDataset);
            array_push($chart->data->datasets,$awayDataset);
        }


        return $chart;
    }

    public function homeLastMatchReport(Request $request){
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

        $homeChances = Chance::where('match_id',$lastMatch->id)
            ->where('is_home',config('isHome.HOME'))
            ->get();

        $homeChancesIds = array();
        foreach ($homeChances as $homeChance){
            array_push($homeChancesIds,$homeChance->id);
        }
        $homeTotalChances = count($homeChancesIds);

        $awayChances = Chance::where('match_id',$lastMatch->id)
            ->where('is_home',config('isHome.AWAY'))
            ->get();

        $awayChancesIds = array();
        foreach ($awayChances as $awayChance){
            array_push($awayChancesIds,$awayChance->id);
        }
        $awayTotalChances = count($awayChancesIds);


        $response =(object)array();
        $response->reports = array();

        $initPossesion = (object)array();
        $initPossesion->name = 'Inicio de la Posesión';
        $initPossesion->chart = $this->initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$initPossesion);

        $rivalInitSituation = (object)array();
        $rivalInitSituation->name = 'Situación Inicial del Rival';
        $rivalInitSituation->chart = $this->initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$rivalInitSituation);

        $developmentPossesion = (object)array();
        $developmentPossesion->name = 'Desarrollo de la Posesión';
        $developmentPossesion->chart = $this->initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$developmentPossesion);

        $endPossesion = (object)array();
        $endPossesion->name = 'Finalización de la Posesión';
        $endPossesion->chart = $this->initPossesionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$endPossesion);

        return $this->createDataResponse($response);
    }



}