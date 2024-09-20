<?php
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Models\User;

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

    // Iniciar sesión en Laravel (esto almacena el user_id en la tabla sessions)
    Auth::login($user);

    // Crear un token para el usuario autenticado
    $token = $user->createToken('token-name')->plainTextToken;

    return response()->json(['token' => $token, 'rol' => $user->rol]);
});
