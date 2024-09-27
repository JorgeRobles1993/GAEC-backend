<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;



class UserController extends Controller
{
    
    public function index()
    {
        $users = User::all(); 
        return response()->json($users); 
    }

   
    public function store(Request $request)
    {
       
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
            'rol' => $request->rol ?? 'user', 
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

   
    $request->validate([
        'name' => 'sometimes|string|max:255',
        'email' => 'sometimes|string|email|max:255|unique:users,email,' . $user->id,
        'telefono' => 'nullable|string|max:20',
        'rol' => 'nullable|string|in:user,admin',
        'password' => 'nullable|string|min:8' 
    ]);

  
    $user->name = $request->name ?? $user->name;
    $user->email = $request->email ?? $user->email;
    $user->telefono = $request->telefono ?? $user->telefono;
    $user->rol = $request->rol ?? $user->rol;

    
    if ($request->filled('password')) {
        $user->password = Hash::make($request->password);
    }

    $user->save();

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
    

}

public function register(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
        'telefono' => 'nullable|string|max:20' 
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'telefono' => $request->telefono,
    ]);

    return response()->json(['message' => 'Usuario registrado correctamente', 'user' => $user], 201);
}
}
