<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    public function run()
    {
        User::create([
            'name' => 'Jorge',
            'email' => 'jorge@example.com',
            'password' => bcrypt('password'),
            'telefono' => '123-456-7890',
            'rol' => 'admin',
            'email_verified_at' => now(),  
            'remember_token' => Str::random(10), 
        ]);

        User::factory()->count(19)->create([
            'rol' => 'user',
        ]);
    }
}

