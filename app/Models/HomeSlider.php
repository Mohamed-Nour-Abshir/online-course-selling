<?php

namespace App\Models;
use Coderflex\Laravisit\Concerns\CanVisit;
use Coderflex\Laravisit\Concerns\HasVisits;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeSlider extends Model implements CanVisit
{
    use HasFactory;
    use HasVisits;
    protected $table = "home_sliders";
}
