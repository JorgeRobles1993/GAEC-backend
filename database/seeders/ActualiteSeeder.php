<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Actualite;

class ActualiteSeeder extends Seeder
{
    public function run()
    {
        Actualite::factory()->count(10)->create();
    }
}
