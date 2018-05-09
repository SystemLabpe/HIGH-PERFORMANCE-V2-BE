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



//PUBLIC
Route::namespace('Auth')->group(function () {
    Route::post('login', 'ApiLoginController@issueToken');
});



//USER
Route::middleware(['auth:api','scope:user'])->group(function () {

});

//ADMIN
Route::middleware(['auth:api','scope:admin'])->group(function () {
    Route::get('users/club/{club_id}', 'UserController@allByClub');
    Route::post('user/club/{club_id}', 'UserController@addByClub');
    Route::put('user/club/{id}', 'UserController@editByClub');
    Route::delete('user/club/{id}', 'UserController@deleteByClub');

    Route::get('clubs/customers', 'ClubController@allCustomers');
    Route::post('clubs/customer', 'ClubController@addCustomer');
    Route::put('clubs/customer/{id}', 'ClubController@editCustomer');
    Route::delete('clubs/customer/{id}', 'ClubController@deleteCustomer');

    Route::get('fieldAreas', 'FieldAreaController@all');
    Route::post('fieldArea', 'FieldAreaController@add');
    Route::put('fieldArea/{id}', 'FieldAreaController@edit');
    Route::delete('fieldArea/{id}', 'FieldAreaController@delete');

    Route::get('startTypes', 'StartTypeController@all');
    Route::post('startType', 'StartTypeController@add');
    Route::put('startType/{id}', 'StartTypeController@edit');
    Route::delete('startType/{id}', 'StartTypeController@delete');
});

//USER AND ADMIN
Route::middleware(['auth:api','scope:user,admin'])->group(function () {
    Route::post('file/upload', 'FileController@upload');
//    Route::get('file/retrieve/{folder}/{filename}/{fileext}', 'FileController@retrieve');


    Route::post('logout', 'Auth\ApiLoginController@revokeToken');
    Route::get('me', 'UserController@me');
});





