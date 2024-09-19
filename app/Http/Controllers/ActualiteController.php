<?php

namespace App\Http\Controllers;
use App\Models\Actualite;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class ActualiteController extends Controller
{
    // Crear nueva publicación
    public function store(Request $request)
    {
        // Verifica si el usuario es administrador
         if (Auth::user()->rol !== 'admin') {
             return response()->json(['message' => 'No autorizado'], 403);
        }

        // Validar los datos
        $request->validate([
            'titre' => 'required|string|max:255',
            'content' => 'required|string',
            'image' => 'nullable|url',
        ]);
    
        // Crear una nueva instancia de Actualite
        $actualite = new Actualite();
    
        // Asignar cada atributo manualmente
        $actualite->titre = $request->titre;
        $actualite->content = $request->content;
        $actualite->image = $request->image;
        $actualite->slug = Str::slug($request->titre);
    
        // Guardar el nuevo post en la base de datos
        $actualite->save();
    
        // Retornar la respuesta con el objeto creado
        return response()->json($actualite, 201);
    }

    public function index()
{
    $actualites = Actualite::all(); // Obtener todas las publicaciones
    return response()->json($actualites, 200); // Retornar las publicaciones en formato JSON
}

public function show($id)
{
    $actualite = Actualite::find($id); // Buscar la publicación por ID

    if (!$actualite) {
        return response()->json(['message' => 'Publicación no encontrada'], 404);
    }

    return response()->json($actualite, 200); // Retornar la publicación en formato JSON
}

public function update(Request $request, $id)
{
    $actualite = Actualite::find($id); // Buscar la publicación por ID

    if (!$actualite) {
        return response()->json(['message' => 'Publicación no encontrada'], 404);
    }

    // Validar los datos
    $request->validate([
        'titre' => 'sometimes|string|max:255',
        'content' => 'sometimes|string',
        'image' => 'nullable|url',
    ]);

    // Actualizar los datos solo si fueron proporcionados en la solicitud
    $actualite->titre = $request->titre ?? $actualite->titre;
    $actualite->content = $request->content ?? $actualite->content;
    $actualite->image = $request->image ?? $actualite->image;
    $actualite->slug = Str::slug($request->titre ?? $actualite->titre);
    $actualite->save();

    return response()->json($actualite, 200); // Retornar la publicación actualizada en formato JSON
}

public function destroy($id)
{
    $actualite = Actualite::find($id); // Buscar la publicación por ID

    if (!$actualite) {
        return response()->json(['message' => 'Publicación no encontrada'], 404);
    }

    $actualite->delete(); // Eliminar la publicación
    return response()->json(['message' => 'Publicación eliminada correctamente'], 200); // Retornar el mensaje de confirmación
}


}
