<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TaskState;

class TaskStateController extends Controller
{
    public function index()
    {
        $taskStates = TaskState::all();

        return response()->json(['data' => $taskStates]);
    }

    public function store(Request $request)
    {

        
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $taskState = TaskState::create([
            'name' => $request->input('name'),
        ]);

        return response()->json(['message' => 'Estado de tarea creado con éxito', 'data' => $taskState], 201);
    }

    public function show($id)
    {
        $taskState = TaskState::findOrFail($id);

        return response()->json(['data' => $taskState]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $taskState = TaskState::findOrFail($id);
        $taskState->update([
            'name' => $request->input('name'),
        ]);

        return response()->json(['message' => 'Estado de tarea actualizado con éxito', 'data' => $taskState]);
    }

    public function destroy($id)
    {
        $taskState = TaskState::findOrFail($id);
        $taskState->delete();

        return response()->json(['message' => 'Estado de tarea eliminado con éxito']);
    }
}
