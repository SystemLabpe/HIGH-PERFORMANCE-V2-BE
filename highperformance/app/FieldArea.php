<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 5:05 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class FieldArea extends  Model{

    protected $fillable = [
        'name', 'picture', 'active','fa_desc'
    ];

}