<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    public function run()
    {
        // Crear un usuario específico con rol "admin" y valores para email_verified_at y remember_token
        User::create([
            'name' => 'Jorge',
            'email' => 'jorge@example.com',
            'password' => bcrypt('password'),
            'telefono' => '123-456-7890',
            'rol' => 'admin',
            'email_verified_at' => now(),  // Verifica el correo
            'remember_token' => Str::random(10), // Token de recuerdo generado aleatoriamente
        ]);

        // Crear otros 9 usuarios con el rol "user"
        User::factory()->count(19)->create([
            'rol' => 'user',
        ]);
    }
}

