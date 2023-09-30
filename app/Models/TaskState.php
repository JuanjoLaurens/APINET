<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskState extends Model
{
    protected $fillable = [
        'name',
    ];

    public function tasks()
    {
        return $this->hasMany(Task::class, 'task_state_id');
    }
}
