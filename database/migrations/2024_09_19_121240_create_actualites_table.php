<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActualitesTable extends Migration
{
    public function up()
    {
        Schema::create('actualites', function (Blueprint $table) {
            $table->id(); // ID de la publicación
            $table->string('titre'); // Título de la publicación
            $table->text('content'); // Contenido de la publicación
            $table->string('image')->nullable(); // URL de la imagen (opcional)
            $table->string('slug')->unique(); // Slug para URL amigable
            $table->timestamps(); // created_at y updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('actualites');
    }
}

