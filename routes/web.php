<?php

use App\Http\Controllers\EquipoController;
use App\Http\Controllers\PartidoController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resources([
    'api/equipo' => EquipoController::class,
    'api/partido' => PartidoController::class
]);

Route::get('/equipo', function () {
   return view('equipo'); 
});

Route::get('/sorteo', function () {
   return view('sorteos'); 
});