<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'email_verified_at' => now(),
            'password' => bcrypt('password'), // Contraseña encriptada
            'remember_token' => Str::random(10),
            'telefono' => $this->faker->phoneNumber, // Generar número de teléfono falso
            'rol' => $this->faker->randomElement(['user', 'admin']), // Generar un rol al azar
        ];
    }
}


