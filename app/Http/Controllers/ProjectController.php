<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\User;
use Illuminate\Support\Facades\Auth;



class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $startDate = $request->input('start_date'); 
        $endDate = $request->input('end_date'); 
    
        $query = Project::query();
    
        if ($startDate !== null) {
            $query->whereDate('start_date', '>=', $startDate);
        }
    
        if ($endDate !== null) {
            $query->whereDate('end_date', '<=', $endDate);
        }
    
        $projects = $query->get();
    
        return response()->json(['data' => $projects]);
    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
{
    $request->validate([
        'title' => 'required|string|max:255',
        'description' => 'required|string',
        'start_date' => 'required|date',
        'end_date' => 'required|date',
        'user_ids' => 'array', 
    ]);

    $project = Project::create([
        'title' => $request->input('title'),
        'description' => $request->input('description'),
        'start_date' => $request->input('start_date'),
        'end_date' => $request->input('end_date'),
    ]);

    $userIds = $request->input('user_ids', []); 
    $project->users()->attach($userIds);

    return response()->json(['message' => 'Proyecto creado con éxito', 'data' => $project], 201);
}
    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Encuentra el proyecto por su ID junto con los usuarios asignados y las tareas relacionadas
        $project = Project::with('users', 'tasks.state')->findOrFail($id);
    
        return response()->json(['data' => $project]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
{
    $request->validate([
        'title' => 'required|string|max:255',
        'description' => 'required|string',
        'start_date' => 'required|date',
        'end_date' => 'required|date',
        'user_ids' => 'array',
    ]);

    $project = Project::findOrFail($id);
    $project->update([
        'title' => $request->input('title'),
        'description' => $request->input('description'),
        'start_date' => $request->input('start_date'),
        'end_date' => $request->input('end_date'),
    ]);


    $userIds = $request->input('user_ids', []); 
    $project->users()->sync($userIds);

    return response()->json(['message' => 'Proyecto actualizado con éxito', 'data' => $project]);
}

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();

        return response()->json(['message' => 'Proyecto eliminado con éxito']);
    }

    public function userProjects()
{
    $user = Auth::user();

    $projects = $user->projects;

    return response()->json(['data' => $projects]);
}
}