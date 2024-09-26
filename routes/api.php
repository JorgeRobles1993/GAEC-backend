<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\ActualiteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User; // Asegúrate de importar el modelo User
use App\Http\Controllers\ReservationController;

// Ruta para registrar un usuario (no protegida)
Route::post('/register', [UserController::class, 'register']);

// Ruta para obtener los datos del usuario autenticado
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Rutas protegidas por autenticación para gestionar usuarios
Route::middleware('auth:sanctum')->group(function () {
    // Rutas para gestionar usuarios
    Route::get('/users', [UserController::class, 'index']); // Obtener todos los usuarios
    Route::post('/users', [UserController::class, 'store']); // Crear un usuario nuevo
    Route::get('/user/{id}', [UserController::class, 'show']); // Obtener un usuario específico
    Route::put('/user/{id}', [UserController::class, 'update']); // Actualizar un usuario
    Route::delete('/user/{id}', [UserController::class, 'destroy']); // Eliminar un usuario
    Route::get('/isAdmin', [UserController::class, 'isAdmin']); // Verificar si es admin

    // Rutas para publicaciones (actualites)
    Route::post('/actualites', [ActualiteController::class, 'store']); // Crear una nueva publicación
    Route::put('/actualites/{id}', [ActualiteController::class, 'update']); // Actualizar una publicación existente
    Route::delete('/actualites/{id}', [ActualiteController::class, 'destroy']); // Eliminar una publicación

    // Ruta para cerrar sesión (logout)
    Route::post('/logout', function (Request $request) {
        $request->user()->currentAccessToken()->delete(); // Elimina el token actual del usuario
        return response()->json(['message' => 'Logout successful']);
    });

    // Rutas para Admin-reservations
    Route::get('/reservations', [ReservationController::class, 'index']);
    Route::post('/reservations', [ReservationController::class, 'store']);
    Route::get('/reservations/{id}', [ReservationController::class, 'show']);
    Route::put('/reservations/{id}', [ReservationController::class, 'update']);
    Route::delete('/reservations/{id}', [ReservationController::class, 'destroy']);

});


// Rutas para obtener publicaciones abiertas (sin protección de autenticación)
Route::get('/actualites', [ActualiteController::class, 'index']); // Obtener todas las publicaciones
Route::get('/actualites/{id}', [ActualiteController::class, 'show']); // Obtener una publicación específica
Route::get('/last-post', [ActualiteController::class, 'getLastPost']); // Obtener la última publicación

// Ruta para iniciar sesión (login)
Route::post('/login', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    // Importación de User
    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['Las credenciales proporcionadas no son correctas.'],
        ]);
    }

    // Crear un token para el usuario autenticado
    $token = $user->createToken('token-name')->plainTextToken;

    return response()->json([
        'token' => $token,
        'user_id' => $user->id,
        'user_email' => $user->email,
        'user_rol' => $user->rol,
        'user_name' => $user->name
    ]);
});
