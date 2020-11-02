<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(["verify"=>true]);

/* Rutas protegidas */
Route::group(["middleware"=>["auth","verified"]],function(){
    /* Rutas de vacantes */
    Route::get("/vacantes","VacanteController@index")->name("vacantes.index");
    Route::get("/vacantes/create","VacanteController@create")->name("vacantes.create");
    Route::post("/vacantes","VacanteController@store")->name("vacantes.store");
    Route::delete("/vacantes/{vacante}","VacanteController@destroy")->name("vacantes.destroy");
    Route::get("/vacantes/{vacante}/edit","VacanteController@edit")->name("vacantes.edit");
    Route::put("/vacantes/{vacante}","VacanteController@update")->name("vacantes.update");

    /* Subir imagenes */
    Route::post("/vacantes/imagen","VacanteController@imagen")->name("vacantes.imagen");
    Route::post("/vacantes/borrarimagen","VacanteController@borrarimagen")->name("vacantes.borrar");
    
    /* Cambiar estado de la vacante */
    Route::post("/vacantes/{vacante}","VacanteController@estado")->name("vacantes.estado");

    /* Notificacion */
    Route::get("/notificaciones","NotificacionesController")->name("notificaciones");
});
/* Pagina de inicio */
Route::get("/","InicioController")->name("inicio");

/* Categorias */
Route::get("/categorias/{categoria}","CategoriaController@show")->name("categorias.show");

Route::get("/candidatos/{id}","CandidatoController@index")->name("candidatos.index");
Route::post("/candidatos/store","CandidatoController@store")->name("candidatos.store");

/* Busqueda de vacantes */
    /* Error orden de rutas:
        para probar este error mueve la ruta con el numero uno comentado abajo del numero 3 y despues recarga y revisa el navegar web
    */
Route::get("/busqueda/buscar","VacantesController@resultados")->name("vacantes.resultados"); /* 1 */
Route::post("/busqueda/buscar","VacanteController@buscar")->name("vacantes.buscar"); /* 2 */

/* Muestra las vacantes en el frontend sin autorisacion o verificacion */
Route::get("/vacantes/{vacante}","VacanteController@show")->name("vacantes.show"); /* 3 */

