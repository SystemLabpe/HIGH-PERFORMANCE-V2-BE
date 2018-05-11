<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 10/05/2018
 * Time: 4:54 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class PossessionPass extends Model{
    protected $table = "possession_passes";

    protected $fillable = [
        'name', 'picture', 'active','v_desc'
    ];
}