<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 17/05/2018
 * Time: 3:38 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Match extends Model{

    protected $fillable = [
      'url_detail', 'match_date','home_score','away_score'
    ];

    public function tournament(){
        return $this->belongsTo('App\Tournament');
    }

    public function club(){
        return $this->belongsTo('App\Club','club_id');
    }

    public function home_club(){
        return $this->belongsTo('App\Club','home_club_id');
    }

    public function away_club(){
        return $this->belongsTo('App\Club','away_club_id');
    }


}