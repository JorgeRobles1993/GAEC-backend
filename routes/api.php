<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\ActualiteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User; 
use App\Http\Controllers\ReservationController;


Route::post('/register', [UserController::class, 'register']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware('auth:sanctum')->group(function () {

    Route::get('/users', [UserController::class, 'index']); 
    Route::post('/users', [UserController::class, 'store']); 
    Route::get('/user/{id}', [UserController::class, 'show']); 
    Route::put('/user/{id}', [UserController::class, 'update']); 
    Route::delete('/user/{id}', [UserController::class, 'destroy']); 
    Route::get('/isAdmin', [UserController::class, 'isAdmin']); 


    Route::post('/actualites', [ActualiteController::class, 'store']); 
    Route::put('/actualites/{id}', [ActualiteController::class, 'update']); 
    Route::delete('/actualites/{id}', [ActualiteController::class, 'destroy']); 

    
    Route::post('/logout', function (Request $request) {
        $request->user()->currentAccessToken()->delete(); 
        return response()->json(['message' => 'Logout successful']);
    });

    
    Route::get('/reservations', [ReservationController::class, 'index']);
    Route::post('/reservations', [ReservationController::class, 'store']);
    Route::get('/reservations/{id}', [ReservationController::class, 'show']);
    Route::put('/reservations/{id}', [ReservationController::class, 'update']);
    Route::delete('/reservations/{id}', [ReservationController::class, 'destroy']);

});



Route::get('/actualites', [ActualiteController::class, 'index']); 
Route::get('/actualites/{id}', [ActualiteController::class, 'show']); 
Route::get('/last-post', [ActualiteController::class, 'getLastPost']); 


Route::post('/login', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

   
    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['Las credenciales proporcionadas no son correctas.'],
        ]);
    }

    
    $token = $user->createToken('token-name')->plainTextToken;

    return response()->json([
        'token' => $token,
        'user_id' => $user->id,
        'user_email' => $user->email,
        'user_rol' => $user->rol,
        'user_name' => $user->name
    ]);
});
