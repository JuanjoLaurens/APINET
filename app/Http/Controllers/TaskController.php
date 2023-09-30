<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;
use App\Models\TaskState;



class TaskController extends Controller
{
    public function index(Request $request)
    {
        $stateId = $request->input('state_id'); 
    
        $query = Task::with('project', 'taskState'); 
    
        if ($stateId !== null) {
            $query->where('task_state_id', $stateId);
        }
    
        $tasks = $query->get();
    
        return response()->json(['data' => $tasks]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'project_id' => 'required|exists:projects,id',
            'task_state_id' => 'required|exists:task_states,id',
        ]);

        $task = Task::create([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'project_id' => $request->input('project_id'),
            'task_state_id' => $request->input('task_state_id'),
        ]);

        return response()->json(['message' => 'Tarea creada con éxito', 'data' => $task], 201);
    }

    public function show($id)
    {
        $task = Task::with('project', 'taskState')->findOrFail($id);
    
        return response()->json(['data' => $task]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'project_id' => 'required|exists:projects,id',
            'task_state_id' => 'required|exists:task_states,id',
        ]);

        $task = Task::findOrFail($id);
        $task->update([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'project_id' => $request->input('project_id'),
            'task_state_id' => $request->input('task_state_id'),
        ]);

        return response()->json(['message' => 'Tarea actualizada con éxito', 'data' => $task]);
    }

    public function destroy($id)
    {
        $task = Task::findOrFail($id);
        $task->delete();

        return response()->json(['message' => 'Tarea eliminada con éxito']);
    }
}
