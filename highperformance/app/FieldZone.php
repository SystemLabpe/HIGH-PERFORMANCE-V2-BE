<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 10/05/2018
 * Time: 4:50 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class FieldZone extends  Model {

    protected $fillable = [
        'name', 'picture', 'active','v_desc'
    ];

}