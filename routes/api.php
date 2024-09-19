<?php

use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActualiteController;

    // ROUTES FOR USERS // 
Route::get('/users', [UserController::class, 'index']);
Route::post('/users', [UserController::class, 'store']);
Route::get('/user/{id}', [UserController::class, 'show']);
Route::put('/user/{id}', [UserController::class, 'update']);
Route::delete('/user/{id}', [UserController::class, 'destroy']);



    // ROUTES FOR ACTUALITES //
Route::get('/actualites', [ActualiteController::class, 'index']); // Obtener todas las publicaciones
Route::get('/actualites/{id}', [ActualiteController::class, 'show']); // Obtener una publicación específica
Route::post('/actualites', [ActualiteController::class, 'store']); // Crear una nueva publicación
Route::put('/actualites/{id}', [ActualiteController::class, 'update']); // Actualizar una publicación existente
Route::delete('/actualites/{id}', [ActualiteController::class, 'destroy']); // Eliminar una publicación


Route::get('/login', function () {
    return response()->json(['message' => 'Debe iniciar sesión para acceder a esta ruta'], 401);
})->name('login');
