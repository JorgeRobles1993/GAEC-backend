<?php

namespace Database\Factories;

use App\Models\Actualite;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ActualiteFactory extends Factory
{
    // Define el modelo correspondiente para este factory
    protected $model = Actualite::class;

    // Define cómo se generan los datos de ejemplo
    public function definition()
    {
        return [
            'titre' => $this->faker->sentence, // Genera un título aleatorio
            'content' => $this->faker->paragraph, // Genera un párrafo de contenido
            'image' => $this->faker->imageUrl(640, 480, 'technics'), // Genera una URL de imagen aleatoria
            'slug' => Str::slug($this->faker->sentence), // Genera un slug basado en el título
        ];
    }
}
