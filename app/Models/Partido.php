<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Partido extends Model
{
    use HasFactory;

    protected $fillable = [
        'goles_local',
        'goles_rival',
        'penales',
        'equipo_local',
        'equipo_rival',
    ];
}
