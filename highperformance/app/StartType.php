<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 4/05/2018
 * Time: 5:02 PM
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class StartType extends Model{

    protected $fillable = [
        'name', 'picture', 'active','st_desc'
    ];

}