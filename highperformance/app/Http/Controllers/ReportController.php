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

    //CHANCE TYPE BY GOL / NO GOL
    private function chanceTypeGoalArrayDataCount($chancesIds){
        $data = Chance::
        select('chance_type AS name',DB::raw('COUNT(*) AS count'))
            ->whereIn('id', $chancesIds)
            //TODO Add is goal / is not goal in config file
            ->where('is_goal', 1)
            ->groupBy('chance_type')
            ->get();

        $returnData = array();

        foreach ($data as $obj){
            //TODO Add chance type in config file
            if($obj->name === 1){
                array_push($returnData, (object) array('id' => $obj->name,'name' => 'Jugada', 'count' => $obj->count));
            }else{
                array_push($returnData, (object) array('id' => $obj->name,'name' => 'Pelota parada', 'count' => $obj->count));
            }
        }

        return $returnData;
    }

    private function chanceTypeNoGoalArrayDataCount($chancesIds){
        $data = Chance::
        select('chance_type AS name',DB::raw('COUNT(*) AS count'))
            ->whereIn('id', $chancesIds)
            //TODO Add is goal / is not goal in config file
            ->where('is_goal', 0)
            ->groupBy('chance_type')
            ->get();

        $returnData = array();

        foreach ($data as $obj){
            //TODO Add chance type in config file
            if($obj->name === 1){
                array_push($returnData, (object) array('id' => $obj->name,'name' => 'Jugada', 'count' => $obj->count));
            }else{
                array_push($returnData, (object) array('id' => $obj->name,'name' => 'Pelota parada', 'count' => $obj->count));
            }
        }

        return $returnData;
    }


    //GOAL PERCENTAGE
    private function goalPercentageArrayData($chancesIds,$totalChances){
        $data = Chance::
        select('is_goal AS id','is_goal AS name', DB::raw('ROUND(100*COUNT(is_goal)/'.$totalChances.',2) AS percentage'))
            ->whereIn('chances.id', $chancesIds)
            ->groupBy('is_goal')
            ->orderByRaw('percentage DESC')
            ->get();

        $returnData = array();
        foreach ($data as $obj){
            //TODO Add chance type in config file
            if($obj->name === 0){
                array_push($returnData, (object) array('id' => $obj->id,'name' => 'No Gol', 'percentage' => $obj->percentage));
            }else{
                array_push($returnData, (object) array('id' => $obj->id,'name' => 'Gol', 'percentage' => $obj->percentage));
            }
        }

        return $returnData;
    }


    //BALL RECOVERED
    private function ballRecoveredArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            //TODO Add array variables in config file
            ->whereIn('chances.start_type_id',[6,7,8])
            ->where('field_zones.active',config('active.ACTIVE'))
            ->groupBy('chances.field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //COMPLETION ACTION BY GOL / NO GOL
    private function completionActionGoalArrayDataCount($chancesIds){
        $data = Chance::
        select('chances.completion_action_id AS id','completion_actions.name AS name',DB::raw('COUNT(chances.completion_action_id) AS count'))
            ->join('completion_actions', 'completion_actions.id', '=', 'chances.completion_action_id')
            ->whereIn('chances.id', $chancesIds)
            //TODO Add is goal / is not goal in config file
            ->where('chances.is_goal', 1)
            ->where('completion_actions.active',config('active.ACTIVE'))
            ->groupBy('chances.completion_action_id')
            ->orderByRaw('count DESC')
            ->get();

        return $data;
    }

    private function completionActionNoGoalArrayDataCount($chancesIds){
        $data = Chance::
        select('chances.completion_action_id AS id','completion_actions.name AS name', DB::raw('COUNT(chances.completion_action_id) AS count'))
            ->join('completion_actions', 'completion_actions.id', '=', 'chances.completion_action_id')
            ->whereIn('chances.id', $chancesIds)
            //TODO Add is goal / is not goal in config file
            ->where('chances.is_goal', 0)
            ->where('completion_actions.active',config('active.ACTIVE'))
            ->groupBy('chances.completion_action_id')
            ->orderByRaw('count DESC')
            ->get();

        return $data;
    }






    //INIT POSSESSION
    private function startTypeArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.start_type_id AS id','start_types.name AS name', DB::raw('ROUND(100*COUNT(chances.start_type_id)/'.$totalChances.',2) AS percentage'))
            ->join('start_types', 'start_types.id', '=', 'chances.start_type_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('start_types.active',config('active.ACTIVE'))
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
            ->where('field_zones.active',config('active.ACTIVE'))
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
            ->where('initial_penetrations.active',config('active.ACTIVE'))
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
            ->where('player_positions.active',config('active.ACTIVE'))
            ->groupBy('chances.player_position_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //RIVAL INIT SITUATION
    private function fieldAreaArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.field_area_id AS id','field_areas.name AS name', DB::raw('ROUND(100*COUNT(chances.field_area_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_areas', 'field_areas.id', '=', 'chances.field_area_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('field_areas.active',config('active.ACTIVE'))
            ->groupBy('chances.field_area_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function invationLevelArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.invation_level_id AS id','invation_levels.name AS name', DB::raw('ROUND(100*COUNT(chances.invation_level_id)/'.$totalChances.',2) AS percentage'))
            ->join('invation_levels', 'invation_levels.id', '=', 'chances.invation_level_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('invation_levels.active',config('active.ACTIVE'))
            ->groupBy('chances.invation_level_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function numericalBalanceArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.numerical_balance_id AS id','numerical_balances.name AS name', DB::raw('ROUND(100*COUNT(chances.numerical_balance_id)/'.$totalChances.',2) AS percentage'))
            ->join('numerical_balances', 'numerical_balances.id', '=', 'chances.numerical_balance_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('numerical_balances.active',config('active.ACTIVE'))
            ->groupBy('chances.numerical_balance_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }


    //DEVELOPMENT POSSESSION
    private function possessionPasessArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.possession_passes_id AS id','possession_passes.name AS name', DB::raw('ROUND(100*COUNT(chances.possession_passes_id)/'.$totalChances.',2) AS percentage'))
            ->join('possession_passes', 'possession_passes.id', '=', 'chances.possession_passes_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('possession_passes.active',config('active.ACTIVE'))
            ->groupBy('chances.possession_passes_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function penetrationPasessArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.penetrating_passes_id AS id','penetrating_passes.name AS name', DB::raw('ROUND(100*COUNT(chances.penetrating_passes_id)/'.$totalChances.',2) AS percentage'))
            ->join('penetrating_passes', 'penetrating_passes.id', '=', 'chances.penetrating_passes_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('penetrating_passes.active',config('active.ACTIVE'))
            ->groupBy('chances.penetrating_passes_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function progretionTypeArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.progression_type_id AS id','progression_types.name AS name', DB::raw('ROUND(100*COUNT(chances.progression_type_id)/'.$totalChances.',2) AS percentage'))
            ->join('progression_types', 'progression_types.id', '=', 'chances.progression_type_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('progression_types.active',config('active.ACTIVE'))
            ->groupBy('chances.progression_type_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //END POSSESSION
    private function pentagonCompetionArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.pentagon_completion_id AS id','pentagon_completions.name AS name', DB::raw('ROUND(100*COUNT(chances.pentagon_completion_id)/'.$totalChances.',2) AS percentage'))
            ->join('pentagon_completions', 'pentagon_completions.id', '=', 'chances.pentagon_completion_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('pentagon_completions.active',config('active.ACTIVE'))
            ->groupBy('chances.pentagon_completion_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function previousActionArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.previous_action_id AS id','previous_actions.name AS name', DB::raw('ROUND(100*COUNT(chances.previous_action_id)/'.$totalChances.',2) AS percentage'))
            ->join('previous_actions', 'previous_actions.id', '=', 'chances.previous_action_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('previous_actions.active',config('active.ACTIVE'))
            ->groupBy('chances.previous_action_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function completionActionArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.completion_action_id AS id','completion_actions.name AS name', DB::raw('ROUND(100*COUNT(chances.completion_action_id)/'.$totalChances.',2) AS percentage'))
            ->join('completion_actions', 'completion_actions.id', '=', 'chances.completion_action_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('completion_actions.active',config('active.ACTIVE'))
            ->groupBy('chances.completion_action_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function penultimateFieldZoneArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.penultimate_field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.penultimate_field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.penultimate_field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('field_zones.active',config('active.ACTIVE'))
            ->groupBy('chances.penultimate_field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    private function lastFieldZoneArrayData($chancesIds, $totalChances){
        $data = Chance::
        select('chances.last_field_zone_id AS id','field_zones.name AS name', DB::raw('ROUND(100*COUNT(chances.last_field_zone_id)/'.$totalChances.',2) AS percentage'))
            ->join('field_zones', 'field_zones.id', '=', 'chances.last_field_zone_id')
            ->whereIn('chances.id', $chancesIds)
            ->where('field_zones.active',config('active.ACTIVE'))
            ->groupBy('chances.last_field_zone_id')
            ->orderByRaw('percentage DESC')
            ->get();

        return $data;
    }

    //PERCENTAGE DATA
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
                array_push($reportArrayData, (object) array('id' => $homeData->id,'name' => $homeData->name, 'homePercentage' => $homeData->percentage,'awayPercentage' => 0));
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
                array_push($reportArrayData, (object) array('id' => $awayData->id,'name' => $awayData->name, 'homePercentage' => 0,'awayPercentage' => $awayData->percentage));
            }
        }

        return $reportArrayData;
    }

    //COUNT DATA
    private function getReportArrayDataCount($homeArrayData,$awayArrayData){
        $reportArrayData = array();
        foreach ($homeArrayData as $homeData){
            $is_included = false;
            foreach ($awayArrayData as $awayData){
                if($homeData->id == $awayData->id){
                    array_push($reportArrayData, (object) array('id' => $homeData->id,'name' => $homeData->name, 'homeCount' => $homeData->count,'awayCount' => $awayData->count));
                    $is_included = true;
                    break;
                }
            }
            if(!$is_included){
                array_push($reportArrayData, (object) array('id' => $homeData->id,'name' => $homeData->name, 'homeCount' => $homeData->count,'awayCount' => 0));
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
                array_push($reportArrayData, (object) array('id' => $awayData->id,'name' => $awayData->name, 'homeCount' => 0,'awayCount' => $awayData->count));
            }
        }

        return $reportArrayData;
    }

    private function getStackedGoalReportArrayDataCount($goalArrayData,$noGoalArrayData){
        $stackedGoalReportArrayData = array();
        foreach ($goalArrayData as $goalData){
            $is_included = false;
            foreach ($noGoalArrayData as $noGoalData){
                if($goalData->id == $noGoalData->id){
                    array_push($stackedGoalReportArrayData, (object) array('id' => $goalData->id,'name' => $goalData->name,
                                                                           'homeGoalCount' => $goalData->homeCount,'awayGoalCount' => $goalData->awayCount,
                                                                           'homeNoGoalCount' => $noGoalData->homeCount,'awayNoGoalCount' => $noGoalData->awayCount));
                    $is_included = true;
                    break;
                }
            }
            if(!$is_included){
                array_push($stackedGoalReportArrayData, (object) array('id' => $goalData->id,'name' => $goalData->name,
                                                                       'homeGoalCount' => $goalData->homeCount,'awayGoalCount' => $goalData->awayCount,
                                                                       'homeNoGoalCount' => 0,'awayNoGoalCount' => 0));
            }
        }
        foreach ($noGoalArrayData as $noGoalData){
            $is_included = false;
            foreach ($stackedGoalReportArrayData as $stackedGoalReportData){
                if($noGoalData->id == $stackedGoalReportData->id){
                    $is_included = true;
                    break;
                }
            }
            if(!$is_included){
                array_push($stackedGoalReportArrayData, (object) array('id' => $noGoalData->id,'name' => $noGoalData->name,
                                                                       'homeGoalCount' => 0,'awayGoalCount' => 0,
                                                                       'homeNoGoalCount' => $noGoalData->homeCount,'awayNoGoalCount' => $noGoalData->awayCount));
            }
        }

        return $stackedGoalReportArrayData;
    }



    //GENERAL - 1
    private function chanceTypeGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $homeChanceTypeGoalArrayDataCount = $this->chanceTypeGoalArrayDataCount($homeChancesIds);
        $awayChanceTypeGoalArrayDataCount = $this->chanceTypeGoalArrayDataCount($awayChancesIds);

        $homeChanceTypeNoGoalArrayDataCount = $this->chanceTypeNoGoalArrayDataCount($homeChancesIds);
        $awayChanceTypeNoGoalArrayDataCount = $this->chanceTypeNoGoalArrayDataCount($awayChancesIds);


        $goalReportArrayData = $this->getReportArrayDataCount($homeChanceTypeGoalArrayDataCount,$awayChanceTypeGoalArrayDataCount);
        $NoGoalReportArrayData = $this->getReportArrayDataCount($homeChanceTypeNoGoalArrayDataCount,$awayChanceTypeNoGoalArrayDataCount);;

        $reportArrayData = $this->getStackedGoalReportArrayDataCount($goalReportArrayData,$NoGoalReportArrayData);

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

        if(count($reportArrayData) == 0){
            $chart->data = null;
        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();

            $chart->data->datasets = array();

            $homeGoalDataset = (object)array();
            $homeGoalDataset->label = 'Goles del Local';
            $homeGoalDataset->backgroundColor = 'rgb(254, 199, 34)';
            $homeGoalDataset->stack = 'home';
            $homeGoalDataset->data = array();

            $homeNoGoalCount = (object)array();
            $homeNoGoalCount->label = 'No Goles del Local';
            $homeNoGoalCount->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $homeNoGoalCount->stack = 'home';
            $homeNoGoalCount->data = array();

            $awayGoalCount = (object)array();
            $awayGoalCount->label = 'Goles del Visitante';
            $awayGoalCount->backgroundColor = 'rgb(36, 37, 47)';
            $awayGoalCount->stack = 'away';
            $awayGoalCount->data = array();

            $awayNoGoalCount = (object)array();
            $awayNoGoalCount->label = 'No Goles del Visitante';
            $awayNoGoalCount->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $awayNoGoalCount->stack = 'away';
            $awayNoGoalCount->data = array();

            foreach ($reportArrayData as $reportData){
                array_push($chart->data->labels,$reportData->name);
                array_push($homeGoalDataset->data,$reportData->homeGoalCount);
                array_push($homeNoGoalCount->data,$reportData->homeNoGoalCount);
                array_push($awayGoalCount->data,$reportData->awayGoalCount);
                array_push($awayNoGoalCount->data,$reportData->awayNoGoalCount);
            }


            array_push($chart->data->datasets,$homeGoalDataset);
            array_push($chart->data->datasets,$homeNoGoalCount);
            array_push($chart->data->datasets,$awayGoalCount);
            array_push($chart->data->datasets,$awayNoGoalCount);
        }


        return $chart;
    }

    //GENERAL - 2
    private function goalPercentageGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $homeGoalPercentageArrayData = $this->goalPercentageArrayData($homeChancesIds,$homeTotalChances);
        $awayGoalPercentageArrayData = $this->goalPercentageArrayData($awayChancesIds,$awayTotalChances);

        $reportArrayData = $this->getReportArrayData($homeGoalPercentageArrayData,$awayGoalPercentageArrayData);

//        return $reportArrayData;

        $chart = (object)array();
        $chart->type = 'doughnut';

        if(count($reportArrayData) == 0){
            $chart->data = null;
        }else{
            $chart->options = (object)array();
            $chart->options->responsive = true;
            $chart->options->legend = (object)array();
            $chart->options->legend->position = 'top';
            $chart->options->animation = (object)array();
            $chart->options->animation->animateScale = true;
            $chart->options->animation->animateRotate = true;

            $chart->data = (object)array();

            $chart->data->labels = ['Goles Local', 'No Goles Local', 'Goles de Visitante', 'No Goles de Visitante'];


            $chart->data->datasets = array();

            $homeDataset = (object)array();
            $homeDataset->data = array();
            $homeDataset->backgroundColor = ['rgb(254, 199, 34)', 'rgba(254, 199, 34, 0.2)', 'rgb(36, 37, 47)', 'rgba(36, 37, 47, 0.2)'];
            $homeDataset->label = 'home';

            $awayDataset = (object)array();
            $awayDataset->data = array();
            $awayDataset->backgroundColor = ['rgb(254, 199, 34)', 'rgba(254, 199, 34, 0.2)', 'rgb(36, 37, 47)', 'rgba(36, 37, 47, 0.2)'];
            $awayDataset->label = 'away';

            $homeGoal = null;
            $homeNoGoal = null;
            $awayGoal = null;
            $awayNoGoal = null;
            foreach ($reportArrayData as $reportData){
                if($reportData->id == 1){
                    $homeGoal = $reportData->homePercentage;
                    $awayGoal = $reportData->awayPercentage;
                }else{
                    $homeNoGoal = $reportData->homePercentage;
                    $awayNoGoal = $reportData->awayPercentage;
                }

            }

            $homeDataset->data = [$homeGoal, $homeNoGoal, 0, 0];
            $awayDataset->data = [0, 0, $awayGoal, $awayNoGoal];

            array_push($chart->data->datasets,$homeDataset);
            array_push($chart->data->datasets,$awayDataset);
        }


        return $chart;
    }

    //GENERAL - 3
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

    //GENERAL - 4
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

    //GENERAL - 5
    private function completionActionGeneralReport($homeChancesIds,$awayChancesIds){
        $homeCompletionActionGoalArrayDataCount = $this->completionActionGoalArrayDataCount($homeChancesIds);
        $awayCompletionActionGoalArrayDataCount = $this->completionActionGoalArrayDataCount($awayChancesIds);

        $homeCompletionActionNoGoalArrayDataCount = $this->completionActionNoGoalArrayDataCount($homeChancesIds);
        $awayCompletionActionNoGoalArrayDataCount = $this->completionActionNoGoalArrayDataCount($awayChancesIds);

        $goalReportArrayData = $this->getReportArrayDataCount($homeCompletionActionGoalArrayDataCount,$awayCompletionActionGoalArrayDataCount);
        $NoGoalReportArrayData = $this->getReportArrayDataCount($homeCompletionActionNoGoalArrayDataCount,$awayCompletionActionNoGoalArrayDataCount);;

        $reportArrayData = $this->getStackedGoalReportArrayDataCount($goalReportArrayData,$NoGoalReportArrayData);

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

        if(count($reportArrayData) == 0){
            $chart->data = null;
        }else{
            $chart->data = (object)array();

            $chart->data->labels = array();

            $chart->data->datasets = array();

            $homeGoalDataset = (object)array();
            $homeGoalDataset->label = 'Goles del Local';
            $homeGoalDataset->backgroundColor = 'rgb(254, 199, 34)';
            $homeGoalDataset->stack = 'local';
            $homeGoalDataset->data = array();

            $homeNoGoalCount = (object)array();
            $homeNoGoalCount->label = 'No Goles del Local';
            $homeNoGoalCount->backgroundColor = 'rgba(254, 199, 34, 0.2)';
            $homeNoGoalCount->stack = 'local';
            $homeNoGoalCount->data = array();

            $awayGoalCount = (object)array();
            $awayGoalCount->label = 'Goles del Visitante';
            $awayGoalCount->backgroundColor = 'rgb(36, 37, 47)';
            $awayGoalCount->stack = 'away';
            $awayGoalCount->data = array();

            $awayNoGoalCount = (object)array();
            $awayNoGoalCount->label = 'No Goles del Visitante';
            $awayNoGoalCount->backgroundColor = 'rgba(36, 37, 47, 0.2)';
            $awayNoGoalCount->stack = 'away';
            $awayNoGoalCount->data = array();

            foreach ($reportArrayData as $reportData){
                array_push($chart->data->labels,$reportData->name);
                array_push($homeGoalDataset->data,$reportData->homeGoalCount);
                array_push($homeNoGoalCount->data,$reportData->homeNoGoalCount);
                array_push($awayGoalCount->data,$reportData->awayGoalCount);
                array_push($awayNoGoalCount->data,$reportData->awayNoGoalCount);
            }


            array_push($chart->data->datasets,$homeGoalDataset);
            array_push($chart->data->datasets,$homeNoGoalCount);
            array_push($chart->data->datasets,$awayGoalCount);
            array_push($chart->data->datasets,$awayNoGoalCount);
        }


        return $chart;
    }

    //GENERAL - 6
    private function lastFieldZoneRivalGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances){
        $lastFieldZoneRivalArrayData = $this->lastFieldZoneArrayData($awayChancesIds,$awayTotalChances);
        $lastFieldZoneRivalArrayData = $this->lastFieldZoneArrayData($awayChancesIds,$awayTotalChances);

        $reportArrayData = $this->getReportArrayData($lastFieldZoneRivalArrayData,$lastFieldZoneRivalArrayData);

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
                array_push($homeDataset->data,$reportData->awayPercentage);
                array_push($awayDataset->data,$reportData->homePercentage);
            }


            array_push($chart->data->datasets,$homeDataset);
            array_push($chart->data->datasets,$awayDataset);
        }


        return $chart;
    }

    //HOME - GENERAL - LAST MATCH
    public function homeLastMatchReport(Request $request){
        $userClubId = $request->user()->club_id;

        $lastMatch = Match::
            where('club_id',$userClubId)
                ->where(function($query)use($userClubId){
                    return $query
                        ->where('home_club_id',$userClubId)
                        ->orWhere('away_club_id',$userClubId);
                })
            ->with(['home_club','away_club'])
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
        $response->match = $lastMatch;

        $response->reports = array();

        //GENERAL - 1
        $chanceType = (object)array();
        $chanceType->name = 'Tipo de ocación de Gol';
        $chanceType->chart = $this->chanceTypeGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
//        $chanceType->chart = null;
        array_push($response->reports,$chanceType);

        //GENERAL - 2
        $goalPercentage = (object)array();
        $goalPercentage->name = 'Porcentaje de Gol';
        $goalPercentage->chart = $this->goalPercentageGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
//        $goalPercentage->chart = null;
        array_push($response->reports,$goalPercentage);

        //GENERAL - 3
        $ballRecoveredZone = (object)array();
        $ballRecoveredZone->name = 'Zona donde más se recupera el balón';
        $ballRecoveredZone->chart = $this->ballRecoveredZoneGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
//        $ballRecoveredZone->chart = null;
        array_push($response->reports,$ballRecoveredZone);

        //GENERAL - 4
        $previousAction = (object)array();
        $previousAction->name = 'Acción previa a la finalización de la jugada';
        $previousAction->chart = $this->previousActionGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
//        $previousAction->chart =null;
        array_push($response->reports,$previousAction);

        //GENERAL - 5
        $completionAction = (object)array();
        $completionAction->name = 'Finalización de la jugada';
        $completionAction->chart = $this->completionActionGeneralReport($homeChancesIds, $awayChancesIds);
//        $completionAction->chart = null;
        array_push($response->reports,$completionAction);

        //GENERAL - 6
        $lastFieldZoneRival = (object)array();
        $lastFieldZoneRival->name = 'Zona donde terminan las jugadas rivales';
        $lastFieldZoneRival->chart = $this->lastFieldZoneRivalGeneralReport($homeChancesIds, $homeTotalChances,$awayChancesIds, $awayTotalChances);
//        $lastFieldZoneRival->chart = null;
        array_push($response->reports,$lastFieldZoneRival);

        return $this->createDataResponse($response);
    }

}