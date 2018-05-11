<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 10/05/2018
 * Time: 4:56 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class PenetratingPass extends  Model{
    protected $table = "penetrating_passes";

    protected $fillable = [
        'name', 'picture', 'active','v_desc'
    ];
}