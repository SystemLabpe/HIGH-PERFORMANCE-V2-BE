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
        'name', 'date_init', 'date_end'
    ];

    public function club(){
        return $this->belongsTo('App\Club');
    }

}