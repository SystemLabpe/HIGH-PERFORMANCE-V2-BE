<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 15/05/2018
 * Time: 6:10 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Player extends Model{

    protected $fillable = [
        'name', 'birth_date','club_id'
    ];

    public function club(){
        return $this->belongsTo('App\Club');
    }

    public function rival_club(){
        return $this->belongsTo('App\Club','rival_club_id');
    }

    public function tournaments(){
        return $this->belongsToMany('App\Language','user_languages','user_id','language_id');
    }

}