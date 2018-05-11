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

    Route::get('completionActions', 'CompletionActionController@all');
    Route::post('completionAction', 'CompletionActionController@add');
    Route::put('completionAction/{id}', 'CompletionActionController@edit');
    Route::delete('completionAction/{id}', 'CompletionActionController@delete');

    Route::get('fieldAreas', 'FieldAreaController@all');
    Route::post('fieldArea', 'FieldAreaController@add');
    Route::put('fieldArea/{id}', 'FieldAreaController@edit');
    Route::delete('fieldArea/{id}', 'FieldAreaController@delete');

    Route::get('fieldZones', 'FieldZoneController@all');
    Route::post('fieldZone', 'FieldZoneController@add');
    Route::put('fieldZone/{id}', 'FieldZoneController@edit');
    Route::delete('fieldZone/{id}', 'FieldZoneController@delete');

    Route::get('initialPenetrations', 'InitialPenetrationController@all');
    Route::post('initialPenetration', 'InitialPenetrationController@add');
    Route::put('initialPenetration/{id}', 'InitialPenetrationController@edit');
    Route::delete('initialPenetration/{id}', 'InitialPenetrationController@delete');

    Route::get('invationLevels', 'InvationLevelController@all');
    Route::post('invationLevel', 'InvationLevelController@add');
    Route::put('invationLevel/{id}', 'InvationLevelController@edit');
    Route::delete('invationLevel/{id}', 'InvationLevelController@delete');

    Route::get('numericalBalances', 'NumericalBalanceController@all');
    Route::post('numericalBalance', 'NumericalBalanceController@add');
    Route::put('numericalBalance/{id}', 'NumericalBalanceController@edit');
    Route::delete('numericalBalance/{id}', 'NumericalBalanceController@delete');

    Route::get('penetratingPasses', 'PenetratingPassController@all');
    Route::post('penetratingPass', 'PenetratingPassController@add');
    Route::put('penetratingPass/{id}', 'PenetratingPassController@edit');
    Route::delete('penetratingPass/{id}', 'PenetratingPassController@delete');

    Route::get('pentagonCompletions', 'PentagonCompletionController@all');
    Route::post('pentagonCompletion', 'PentagonCompletionController@add');
    Route::put('pentagonCompletion/{id}', 'PentagonCompletionController@edit');
    Route::delete('pentagonCompletion/{id}', 'PentagonCompletionController@delete');

    Route::get('playerPositions', 'PlayerPositionController@all');
    Route::post('playerPosition', 'PlayerPositionController@add');
    Route::put('playerPosition/{id}', 'PlayerPositionController@edit');
    Route::delete('playerPosition/{id}', 'PlayerPositionController@delete');

    Route::get('possessionPasses', 'PossessionPassController@all');
    Route::post('possessionPass', 'PossessionPassController@add');
    Route::put('possessionPass/{id}', 'PossessionPassController@edit');
    Route::delete('possessionPass/{id}', 'PossessionPassController@delete');

    Route::get('previousActions', 'PreviousActionController@all');
    Route::post('previousAction', 'PreviousActionController@add');
    Route::put('previousAction/{id}', 'PreviousActionController@edit');
    Route::delete('previousAction/{id}', 'PreviousActionController@delete');

    Route::get('progressionTypes', 'ProgressionTypeController@all');
    Route::post('progressionType', 'ProgressionTypeController@add');
    Route::put('progressionType/{id}', 'ProgressionTypeController@edit');
    Route::delete('progressionType/{id}', 'ProgressionTypeController@delete');

    Route::get('startTypes', 'StartTypeController@all');
    Route::post('startType', 'StartTypeController@add');
    Route::put('startType/{id}', 'StartTypeController@edit');
    Route::delete('startType/{id}', 'StartTypeController@delete');

    Route::get('stoppedBalls', 'StoppedBallController@all');
    Route::post('stoppedBall', 'StoppedBallController@add');
    Route::put('stoppedBall/{id}', 'StoppedBallController@edit');
    Route::delete('stoppedBall/{id}', 'StoppedBallController@delete');
});

//USER AND ADMIN
Route::middleware(['auth:api','scope:user,admin'])->group(function () {
    Route::post('file/upload', 'FileController@upload');
//    Route::get('file/retrieve/{folder}/{filename}/{fileext}', 'FileController@retrieve');


    Route::post('logout', 'Auth\ApiLoginController@revokeToken');
    Route::get('me', 'UserController@me');
});





