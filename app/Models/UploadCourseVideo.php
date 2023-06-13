<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UploadCourseVideo extends Model
{
    use HasFactory;
    protected $table = "upload_course_videos";
    public function course(){
        return $this->belongsTo(product::class,'course_id');
    }
}
