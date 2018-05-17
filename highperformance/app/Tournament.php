<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 15/05/2018
 * Time: 6:48 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Tournament extends Model{

    protected $fillable = [
        'name', 'date_init', 'date_end','active'
    ];

    public function club(){
        return $this->belongsTo('App\Club');
    }

    public function clubs(){
        return $this->belongsToMany('App\Club','tournament_club','tournament_id','club_id')->withPivot('rival_club_id','active');
    }

}