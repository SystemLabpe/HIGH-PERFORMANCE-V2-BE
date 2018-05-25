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
    //Local
    //Visitante


    //Ball Recovered
    private function ballRecoveredArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            //TODO Add array variables in config file
            ->whereIn('chances.start_type_id',[6,7,8])
            ->groupBy('chances.field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //Init possesion
    private function startTypeArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.start_type_id AS id','start_types.name AS name', DB::raw('ROUND(100*COUNT(chances.start_type_id)/'.$totalChances.',2) AS percentage'))
            ->join('start_types', 'start_types.id', '=', 'chances.start_type_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.start_type_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function fieldZoneArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function initialPenetrationArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.initial_penetration_id AS id','initial_penetrations.name AS name', DB::raw('ROUND(100*COUNT(chances.initial_penetration_id)/'.$totalChances.',2) AS percentage'))
            ->join('initial_penetrations', 'initial_penetrations.id', '=', 'chances.initial_penetration_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.initial_penetration_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function playerPositionArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.player_position_id AS id','player_positions.name AS name', DB::raw('ROUND(100*COUNT(chances.player_position_id)/'.$totalChances.',2) AS percentage'))
            ->join('player_positions', 'player_positions.id', '=', 'chances.player_position_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.player_position_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //Rival Init Situation

    //Development Possesion

    //End Possesion
    private function previousActionArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.previous_action_id AS id','previous_actions.name AS name', DB::raw('ROUND(100*COUNT(chances.previous_action_id)/'.$totalChances.',2) AS percentage'))
            ->join('previous_actions', 'previous_actions.id', '=', 'chances.previous_action_id')
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('chances.previous_action_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }


    private function getReportArrayData($homeArrayData,$awayArrayData){
        $reportArrayData = array();
        foreach ($homeArrayData as $homeData){
            $is_included = false;
            foreach ($awayArrayData as $awayData){
                if($homeData->id == $awayData->id){
                    array_push($reportArrayData, (object) array('id' => $homeData->id,'name' => $homeData->name, 'homePercentage' => $homeData->percentage,'awayPercentage' => $awayData->percentage));
                    $is_included = true;
                    break;
                }
            }
            if(!$is_included){
                array_push($reportArrayData, (object) array('id' => $homeData->id,'name' => $homeData->name, 'homePercentage' => $homeData->percentage,'awayPercentage' => null));
            }
        }
        foreach ($awayArrayData as $awayData){
            $is_included = false;
            foreach ($reportArrayData as $reportData){
                if($awayData->id == $reportData->id){
                    $is_included = true;
                    break;
                }
            }
            if(!$is_included){
                array_push($reportArrayData, (object) array('id' => $awayData->id,'name' => $awayData->name, 'homePercentage' => null,'awayPercentage' => $awayData->percentage));
            }
        }

        return $reportArrayData;
    }

    private function ballRecoveredZoneGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $homeBallRecoveredArrayData = $this->ballRecoveredArrayData($homeChancesIds,$homeTotalChances);
        $awayBallRecoveredArrayData = $this->ballRecoveredArrayData($awayChancesIds,$awayTotalChances);

        $reportArrayData = $this->getReportArrayData($homeBallRecoveredArrayData,$awayBallRecoveredArrayData);

//        return $reportArrayData;

        $chart = (object)array();
        $chart->type = 'bar';

        if(count($reportArrayData) == 0){
            $chart->data = null;
        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();
            $chart->data->datasets = array();

            $homeDataset = (object)array();
            $homeDataset->label = 'Local';
            $homeDataset->data = array();
            $homeDataset->fill = true;
            $homeDataset->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $homeDataset->borderColor = 'rgb(254, 199, 34)';
            $homeDataset->pointBackgroundColor = 'rgb(254, 199, 34)';
            $homeDataset->pointBorderColor = '#fff';
            $homeDataset->pointHoverBackgroundColor = '#fff';
            $homeDataset->pointHoverBorderColor = 'rgb(254, 199, 34)';

            $awayDataset = (object)array();
            $awayDataset->label = 'Visitante';
            $awayDataset->data = array();
            $awayDataset->fill = true;
            $awayDataset->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $awayDataset->borderColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBackgroundColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBorderColor = '#fff';
            $awayDataset->pointHoverBackgroundColor = '#fff';
            $awayDataset->pointHoverBorderColor = 'rgb(36, 37, 47)';


            foreach ($reportArrayData as $reportData){
                array_push($chart->data->labels,$reportData->name);
                array_push($homeDataset->data,$reportData->homePercentage);
                array_push($awayDataset->data,$reportData->awayPercentage);
            }


            array_push($chart->data->datasets,$homeDataset);
            array_push($chart->data->datasets,$awayDataset);
        }


        return $chart;
    }

    private function previousActionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $homePreviousActionArrayData = $this->previousActionArrayData($homeChancesIds,$homeTotalChances);
        $awayPreviousActionArrayData = $this->previousActionArrayData($awayChancesIds,$awayTotalChances);

        $reportArrayData = $this->getReportArrayData($homePreviousActionArrayData,$awayPreviousActionArrayData);

//        return $reportArrayData;

        $chart = (object)array();
        $chart->type = 'radar';

        if(count($reportArrayData) == 0){
            $chart->data = null;
        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();
            $chart->data->datasets = array();

            $homeDataset = (object)array();
            $homeDataset->label = 'Local';
            $homeDataset->data = array();
            $homeDataset->fill = true;
            $homeDataset->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $homeDataset->borderColor = 'rgb(254, 199, 34)';
            $homeDataset->pointBackgroundColor = 'rgb(254, 199, 34)';
            $homeDataset->pointBorderColor = '#fff';
            $homeDataset->pointHoverBackgroundColor = '#fff';
            $homeDataset->pointHoverBorderColor = 'rgb(254, 199, 34)';

            $awayDataset = (object)array();
            $awayDataset->label = 'Visitante';
            $awayDataset->data = array();
            $awayDataset->fill = true;
            $awayDataset->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $awayDataset->borderColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBackgroundColor = 'rgb(36, 37, 47)';
            $awayDataset->pointBorderColor = '#fff';
            $awayDataset->pointHoverBackgroundColor = '#fff';
            $awayDataset->pointHoverBorderColor = 'rgb(36, 37, 47)';


            foreach ($reportArrayData as $reportData){
                array_push($chart->data->labels,$reportData->name);
                array_push($homeDataset->data,$reportData->homePercentage);
                array_push($awayDataset->data,$reportData->awayPercentage);
            }


            array_push($chart->data->datasets,$homeDataset);
            array_push($chart->data->datasets,$awayDataset);
        }


        return $chart;
    }

    private function endActionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $homePreviousActionArrayData = $this->previousActionArrayData($homeChancesIds,$homeTotalChances);
        $awayPreviousActionArrayData = $this->previousActionArrayData($awayChancesIds,$awayTotalChances);

        $reportArrayData = $this->getReportArrayData($homePreviousActionArrayData,$awayPreviousActionArrayData);

//        return $reportArrayData;

        $chart = (object)array();
        $chart->type = 'bar';
        $chart->options = (object)array();

        $chart->options->tooltips = (object)array();
        $chart->options->tooltips->mode = 'index';
        $chart->options->tooltips->intersect = false;

        $chart->options->responsive = true;

        $chart->options->scales = (object)array();
        $chart->options->scales->xAxes = array();
        $chart->options->scales->yAxes = array();
        $objStacked = (object)array();
        $objStacked->stacked = true;
        array_push($chart->options->scales->xAxes,$objStacked);
        array_push($chart->options->scales->yAxes,$objStacked);



//        if(count($reportArrayData) == 0){
//            $chart->data = null;
//        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();
            array_push($chart->data->labels ,'Jugadas');
            array_push($chart->data->labels ,'Pelota Parada');

            $chart->data->datasets = array();

            $dataset1 = (object)array();
            $dataset1->label = 'Goles del Local';
            $dataset1->backgroundColor = 'rgb(254, 199, 34)';
            $dataset1->stack = 'local';
            $dataset1->data = array();
            array_push($dataset1->data ,10);
            array_push($dataset1->data ,20);

            $dataset2 = (object)array();
            $dataset2->label = 'No Goles del Local';
            $dataset2->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $dataset2->stack = 'local';
            $dataset2->data = array();
            array_push($dataset2->data ,11);
            array_push($dataset2->data ,21);

            $dataset3 = (object)array();
            $dataset3->label = 'Goles del Visitante';
            $dataset3->backgroundColor = 'rgb(36, 37, 47)';
            $dataset3->stack = 'away';
            $dataset3->data = array();
            array_push($dataset3->data ,15);
            array_push($dataset3->data ,25);

            $dataset4 = (object)array();
            $dataset4->label = 'No Goles del Visitante';
            $dataset4->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $dataset4->stack = 'away';
            $dataset4->data = array();
            array_push($dataset4->data ,30);
            array_push($dataset4->data ,40);


            array_push($chart->data->datasets,$dataset1);
            array_push($chart->data->datasets,$dataset2);
            array_push($chart->data->datasets,$dataset3);
            array_push($chart->data->datasets,$dataset4);
//        }


        return $chart;
    }

    private function endZoneRivalGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        return null;
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

        $ballRecoveredZone = (object)array();
        $ballRecoveredZone->name = 'Zona donde más se recupera el balón';
        $ballRecoveredZone->chart = $this->ballRecoveredZoneGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$ballRecoveredZone);

        $previousAction = (object)array();
        $previousAction->name = 'Acción previa a la finalización de la jugada';
        $previousAction->chart = $this->previousActionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$previousAction);

        $endAction = (object)array();
        $endAction->name = 'Finalización de la jugada';
        $endAction->chart = $this->endActionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$endAction);

        $endZoneRival = (object)array();
        $endZoneRival->name = 'Zona donde terminan las jugadas rivales';
//        $endZoneRival->chart = $this->endZoneRivalGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        $endZoneRival->chart = $this->ballRecoveredZoneGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
        array_push($response->reports,$endZoneRival);

        return $this->createDataResponse($response);
    }

}