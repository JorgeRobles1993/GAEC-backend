<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    // Método para listar los usuarios
    public function index()
    {
        $users = User::all(); // Obtener todos los usuarios
        return response()->json($users); // Retornar los usuarios en formato JSON
    }

    // Método para crear un nuevo usuario (que ya tienes)
    public function store(Request $request)
    {
        // Validar y crear el usuario
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'telefono' => 'nullable|string|max:20',
            'rol' => 'nullable|string|in:user,admin',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'telefono' => $request->telefono,
            'rol' => $request->rol ?? 'user', // Rol por defecto 'user'
            'email_verified_at' => now(),
            'remember_token' => \Illuminate\Support\Str::random(10),
        ]);

        return response()->json($user, 201);
    }

    public function show($id)
{
    $user = User::find($id);

    if (!$user) {
        return response()->json(['message' => 'Usuario no encontrado'], 404);
    }

    return response()->json($user, 200);
}

public function update(Request $request, $id)
{
    $user = User::find($id);

    if (!$user) {
        return response()->json(['message' => 'Usuario no encontrado'], 404);
    }

    // Validar los datos
    $request->validate([
        'name' => 'sometimes|string|max:255',
        'email' => 'sometimes|string|email|max:255|unique:users,email,' . $user->id,
        'password' => 'sometimes|string|min:8',
        'telefono' => 'nullable|string|max:20',
        'rol' => 'nullable|string|in:user,admin',
    ]);

    // Actualizar los datos del usuario
    $user->update([
        'name' => $request->name ?? $user->name,
        'email' => $request->email ?? $user->email,
        'password' => $request->password ? Hash::make($request->password) : $user->password,
        'telefono' => $request->telefono ?? $user->telefono,
        'rol' => $request->rol ?? $user->rol,
    ]);

    return response()->json($user, 200);
}

public function destroy($id)
{
    $user = User::find($id);

    if (!$user) {
        return response()->json(['message' => 'Usuario no encontrado'], 404);
    }

    $user->delete();

    return response()->json(['message' => 'Usuario eliminado correctamente'], 200);
}

public function isAdmin($token) { 
    // recuperer les donnes du header 

    // checker dans la BDD le role en se basant sur le token et la liaison dans la session 

}


}
