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

    Route::get('clubs/rivals/tournament/{tournamentId}', 'ClubController@rivalsByTournament');
    Route::get('clubs/rivals', 'ClubController@allRivals');
    Route::post('clubs/rival', 'ClubController@addRival');
    Route::put('clubs/rival/{id}', 'ClubController@editRival');
    Route::delete('clubs/rival/{id}', 'ClubController@deleteRival');

    Route::get('tournaments/me', 'TournamentController@allMe');
    Route::post('tournament/me', 'TournamentController@addMe');
    Route::put('tournament/me/{id}', 'TournamentController@editMe');
    Route::delete('tournament/me/{id}', 'TournamentController@deleteMe');

    Route::get('match/{id}', 'MatchController@find');
    Route::get('matches/me', 'MatchController@allMe');
    Route::post('match/me', 'MatchController@addMe');
    Route::put('match/me/{id}', 'MatchController@editMe');
    Route::delete('match/me/{id}', 'MatchController@deleteMe');

    Route::get('chance/{id}', 'ChanceController@find');
    Route::get('chances/me/match/{matchId}', 'ChanceController@allByMatch');
    Route::post('chance/me', 'ChanceController@addMe');
    Route::put('chance/me/{id}', 'ChanceController@editMe');
    Route::delete('chance/me/{id}', 'ChanceController@deleteMe');


    Route::get('report/test', 'ReportController@testReport');
    Route::get('report/lastgame/general', 'ReportController@homeLastGameReport');


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

    Route::post('completionAction', 'CompletionActionController@add');
    Route::put('completionAction/{id}', 'CompletionActionController@edit');
    Route::delete('completionAction/{id}', 'CompletionActionController@delete');

    Route::post('fieldArea', 'FieldAreaController@add');
    Route::put('fieldArea/{id}', 'FieldAreaController@edit');
    Route::delete('fieldArea/{id}', 'FieldAreaController@delete');

    Route::post('fieldZone', 'FieldZoneController@add');
    Route::put('fieldZone/{id}', 'FieldZoneController@edit');
    Route::delete('fieldZone/{id}', 'FieldZoneController@delete');

    Route::post('initialPenetration', 'InitialPenetrationController@add');
    Route::put('initialPenetration/{id}', 'InitialPenetrationController@edit');
    Route::delete('initialPenetration/{id}', 'InitialPenetrationController@delete');

    Route::post('invationLevel', 'InvationLevelController@add');
    Route::put('invationLevel/{id}', 'InvationLevelController@edit');
    Route::delete('invationLevel/{id}', 'InvationLevelController@delete');

    Route::post('numericalBalance', 'NumericalBalanceController@add');
    Route::put('numericalBalance/{id}', 'NumericalBalanceController@edit');
    Route::delete('numericalBalance/{id}', 'NumericalBalanceController@delete');

    Route::post('penetratingPass', 'PenetratingPassController@add');
    Route::put('penetratingPass/{id}', 'PenetratingPassController@edit');
    Route::delete('penetratingPass/{id}', 'PenetratingPassController@delete');

    Route::post('pentagonCompletion', 'PentagonCompletionController@add');
    Route::put('pentagonCompletion/{id}', 'PentagonCompletionController@edit');
    Route::delete('pentagonCompletion/{id}', 'PentagonCompletionController@delete');

    Route::post('playerPosition', 'PlayerPositionController@add');
    Route::put('playerPosition/{id}', 'PlayerPositionController@edit');
    Route::delete('playerPosition/{id}', 'PlayerPositionController@delete');

    Route::post('possessionPass', 'PossessionPassController@add');
    Route::put('possessionPass/{id}', 'PossessionPassController@edit');
    Route::delete('possessionPass/{id}', 'PossessionPassController@delete');

    Route::post('previousAction', 'PreviousActionController@add');
    Route::put('previousAction/{id}', 'PreviousActionController@edit');
    Route::delete('previousAction/{id}', 'PreviousActionController@delete');

    Route::post('progressionType', 'ProgressionTypeController@add');
    Route::put('progressionType/{id}', 'ProgressionTypeController@edit');
    Route::delete('progressionType/{id}', 'ProgressionTypeController@delete');

    Route::post('startType', 'StartTypeController@add');
    Route::put('startType/{id}', 'StartTypeController@edit');
    Route::delete('startType/{id}', 'StartTypeController@delete');

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

    Route::get('completionActions', 'CompletionActionController@all');

    Route::get('fieldAreas', 'FieldAreaController@all');

    Route::get('fieldZones', 'FieldZoneController@all');

    Route::get('initialPenetrations', 'InitialPenetrationController@all');

    Route::get('invationLevels', 'InvationLevelController@all');

    Route::get('numericalBalances', 'NumericalBalanceController@all');

    Route::get('penetratingPasses', 'PenetratingPassController@all');

    Route::get('pentagonCompletions', 'PentagonCompletionController@all');

    Route::get('playerPositions', 'PlayerPositionController@all');

    Route::get('possessionPasses', 'PossessionPassController@all');

    Route::get('previousActions', 'PreviousActionController@all');

    Route::get('progressionTypes', 'ProgressionTypeController@all');

    Route::get('startTypes', 'StartTypeController@all');

    Route::get('stoppedBalls', 'StoppedBallController@all');
});





