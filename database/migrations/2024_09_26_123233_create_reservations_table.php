<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); // Relación con los usuarios
            $table->date('reservation_date'); // Fecha de la reservación
            $table->time('start_time'); // Hora de inicio
            $table->time('end_time'); // Hora de fin
            $table->string('status')->default('pending'); // Estado de la reservación (pending, confirmed, cancelled)
            $table->timestamps();
        });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};
