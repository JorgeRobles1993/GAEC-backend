<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\ActualiteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

// Ruta para obtener los datos del usuario autenticado
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Rutas protegidas por autenticación para gestionar usuarios
Route::middleware('auth:sanctum')->group(function () {
    // ROUTES FOR USERS
    Route::get('/users', [UserController::class, 'index']); // Obtener todos los usuarios
    Route::post('/users', [UserController::class, 'store']); // Crear un usuario nuevo
    Route::get('/user/{id}', [UserController::class, 'show']); // Obtener un usuario específico
    Route::put('/user/{id}', [UserController::class, 'update']); // Actualizar un usuario
    Route::delete('/user/{id}', [UserController::class, 'destroy']); // Eliminar un usuario
    Route::get('/isAdmin', [UserController::class, 'isAdmin']); // Obtener todos los usuarios

    // ROUTES FOR ACTUALITES (Publicaciones)
    Route::post('/actualites', [ActualiteController::class, 'store']); // Crear una nueva publicación
    Route::put('/actualites/{id}', [ActualiteController::class, 'update']); // Actualizar una publicación existente
    Route::delete('/actualites/{id}', [ActualiteController::class, 'destroy']); // Eliminar una publicación
});

// Rutas para obtener publicaciones abiertas, que no requieren autenticación
Route::get('/actualites', [ActualiteController::class, 'index']); // Obtener todas las publicaciones
Route::get('/actualites/{id}', [ActualiteController::class, 'show']); // Obtener una publicación específica


Route::post('/login', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if (! $user || ! Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['Las credenciales proporcionadas no son correctas.'],
        ]);
    }

    // Crear un token para el usuario autenticado
    $token = $user->createToken('token-name')->plainTextToken;

  
    return response()->json(['token' => $token,
    'user' => $user->id,
    'user_email' => $user->email,
    'user_rol' => $user->rol,
    'user_name' => $user->name
    ]);
});

// Ruta de ejemplo para mostrar mensaje de "Debe iniciar sesión" si el usuario no está autenticado
Route::get('/login', function () {
    return response()->json(['message' => 'Debe iniciar sesión para acceder a esta ruta'], 401);
})->name('login');
