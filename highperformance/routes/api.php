<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::get('/version', function () {
    return app()->version();
});

//Route::post('login', 'ApiLoginController@issueToken');


Route::namespace('Auth')->group(function () {
    Route::post('login', 'ApiLoginController@issueToken');
});


//USER
Route::middleware(['auth:api','scope:user'])->group(function () {
    Route::get('users', 'UserController@all');
});

//ADMIN
Route::middleware(['auth:api','scope:admin'])->group(function () {
    Route::post('user', 'UserController@add');
});





