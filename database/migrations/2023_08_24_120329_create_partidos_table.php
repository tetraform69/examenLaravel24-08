<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('partidos', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer('goles_local')->default(0);
            $table->integer('goles_rival')->default(0);
            $table->integer('penales');
            $table->unsignedBigInteger('equipo_local');
            $table->unsignedBigInteger('equipo_rival');
            $table->foreign('equipo_local')->references('id')->on('equipos');
            $table->foreign('equipo_rival')->references('id')->on('equipos');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('partido');
    }
};
