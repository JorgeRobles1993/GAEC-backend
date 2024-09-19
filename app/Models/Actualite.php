<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Actualite extends Model
{
    use HasFactory;
     // Agrega los campos que se pueden asignar masivamente
     protected $fillable = ['titre', 'content', 'image', 'slug'];
}
