<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 8/05/2018
 * Time: 6:33 PM
 */

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Log;

class FileController extends  Controller{

    public function upload(Request $request){
        $type = $request->input('type');
        $path = $request->file('file')->store($type,'public_server');
        return $this->createDataResponse( env('PUBLIC_FOLDER_PATH').$path);
    }

}