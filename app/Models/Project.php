<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $fillable = [
        'title',
        'description',
        'start_date',
        'end_date',
    ];

    public function users()
    {
        return $this->belongsToMany(User::class, 'project_user', 'project_id', 'user_id');
    }
    public function tasks()
{
    return $this->hasMany(Task::class);
}
    
    
}
