<?php

namespace App\Http\Controllers;

use App\Models\Partido;
use Illuminate\Http\Request;

class PartidoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Partido::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Partido::created($request->all());

        return "Partido creado";
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Partido::find($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        Partido::find($id)->update($request->all());

        return "Partido actualizado";
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Partido::find($id)->destroy();

        return "Partido eliminado";
    }
}
