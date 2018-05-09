<?php
/**
 * Created by PhpStorm.
 * User: josue
 * Date: 8/05/2018
 * Time: 6:33 PM
 */

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Log;

class FileController extends  Controller{

    public function upload(Request $request){
//        Log::info($request->file('file')->get);
//        Log::info($request->file('file')->getClientOriginalExtension());
//        return 'caca';

        $type = $request->input('type');
        $path = $request->file('file')->store($type,'public_server');
        $response =(object)array();
        return $this->createDataResponse( env('PUBLIC_FOLDER_PATH').$path);
    }

    public function retrieve($folder,$filename,$fileext){
        return Storage::disk('public_server')->download($folder.'/'.$filename.'.'.$fileext, 'filetest.png', []);
//        return Storage::disk('public_server')->download('test/'.$filename.'.png', 'Uno', []);
    }

}