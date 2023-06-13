<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Visitor extends Model
{
    use HasFactory;
    protected $fillable = [
        'visitable_type', // add visitable_type to the fillable fields
        'visitable_id',
        'visitor_ip',
        'visited_at',
    ];
}
