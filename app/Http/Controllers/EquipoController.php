<?php

namespace App\Http\Controllers;

use App\Models\Equipo;
use Illuminate\Http\Request;

class EquipoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Equipo::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $path = $request->file('imagen')->store('public');
            $values = [
                'nombre' => $request->nombre,
                'programa' => $request->programa,
                'escudo' => $path,
            ];

            $equipo = new Equipo($values);
            $equipo->save();

            return "Equipo creado";
        }

        return "Error al crear";
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Equipo::find($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        if ($request->hasFile('imagen')) {
            $path = $request->image->store('public');
            $values = [
                'nombre' => $request->nombre,
                'programa' => $request->programa,
                'escudo' => $path,
            ];
            Equipo::find($id)->update($values);

            return "Equipo actualizado";
        }
        
        return "Error al actualizar";
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Equipo::find($id)->destroy();
        return "Equipo eliminado";
    }
}
