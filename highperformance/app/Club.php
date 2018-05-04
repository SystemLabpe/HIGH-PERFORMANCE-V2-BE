<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 4:41 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Club extends Model{

    protected $fillable = [
        'full_name', 'picture', 'active'
    ];

    public function rival_club(){
        return $this->belongsTo('App\Club');
    }

    public function rival_clubs(){
        return $this->hasMany('App\Club');
    }

    public function users(){
        return $this->hasMany('App\User');
    }

}