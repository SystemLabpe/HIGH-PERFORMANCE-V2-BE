<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 17/05/2018
 * Time: 8:32 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Chance extends Model{

    protected $fillable = [
        'is_home', 'chance_type','chance_minute','is_goal','assisted_player','scored_player'
    ];


    public function match(){
        return $this->belongsTo('App\Match','match_id');
    }

    public function stopped_ball(){
        return $this->belongsTo('App\StoppedBall','stopped_ball_id');
    }

    public function start_type(){
        return $this->belongsTo('App\StartType','start_type_id');
    }

    public function field_zone(){
        return $this->belongsTo('App\FieldZone','field_zone_id');
    }

    public function initial_penetration(){
        return $this->belongsTo('App\InitialPenetration','initial_penetration_id');
    }

    public function player_position(){
        return $this->belongsTo('App\PlayerPosition','player_position_id');
    }

    public function field_area(){
        return $this->belongsTo('App\FieldArea','field_area_id');
    }

    public function invation_level(){
        return $this->belongsTo('App\InvationLevel','invation_level_id');
    }

    public function numerical_balance(){
        return $this->belongsTo('App\NumericalBalance','numerical_balance_id');
    }

    public function possession_pass(){
        return $this->belongsTo('App\PosessionPass','possession_pass_id');
    }

    public function penetrating_pass(){
        return $this->belongsTo('App\PenetratingPass','penetrating_pass_id');
    }

    public function progression_type(){
        return $this->belongsTo('App\ProgressionType','progression_type_id');
    }

    public function pentagon_completion(){
        return $this->belongsTo('App\PentagonCompletion','pentagon_completion_id');
    }

    public function previous_action(){
        return $this->belongsTo('App\PreviousAction','previous_action_id');
    }

    public function completion_action(){
        return $this->belongsTo('App\CompletionAction','completion_action_id');
    }

    public function penultimate_field_zone(){
        return $this->belongsTo('App\FieldZone','penultimate_field_zone_id');
    }

    public function last_field_zone(){
        return $this->belongsTo('App\FieldZone','last_field_zone_id');
    }

}