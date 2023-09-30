<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = [
        'title',
        'description',
        'project_id',
        'task_state_id',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
    
    public function state()
    {
        return $this->belongsTo(TaskState::class, 'task_state_id');
    }
    
    // Agregar la relación con estados
    public function taskState()
    {
        return $this->belongsTo(TaskState::class, 'task_state_id');
    }
}
    

