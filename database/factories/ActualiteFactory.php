<?php

namespace Database\Factories;

use App\Models\Actualite;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ActualiteFactory extends Factory
{
    protected $model = Actualite::class;

    public function definition()
    {
        return [
            'titre' => $this->faker->sentence, 
            'content' => $this->faker->paragraph, 
            'image' => $this->faker->imageUrl(640, 480, 'technics'), 
            'slug' => Str::slug($this->faker->sentence), 
        ];
    }
}
