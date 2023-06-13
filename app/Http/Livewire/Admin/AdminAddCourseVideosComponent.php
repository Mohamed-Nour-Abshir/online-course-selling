<?php

namespace App\Http\Livewire\Admin;
use App\Models\product;
use App\Models\UploadCourseVideo;
use Carbon\Carbon;
use Livewire\Component;
use Livewire\WithFileUploads;

class AdminAddCourseVideosComponent extends Component
{
    use WithFileUploads;

    public $title;
    public $duration;
    public $course_id;
    public $status;
    public $video;


    public function updated($fields){
        $this->validateOnly($fields,[
            'title' => 'required',
            'duration' => 'required',
            'course_id' => 'required',
            'status' => 'required',
            'video' => 'required'
        ]);
    }
    public function storeCourseVideo(){

        $this->validate([
            'title' => 'required',
            'duration' => 'required',
            'course_id' => 'required',
            'status' => 'required',
            'video' => 'required'
        ]);
        $course = new UploadCourseVideo();
        $course->title = $this->title;
        $course->duration = $this->duration;
        $course->course_id = $this->course_id;
        $course->status = $this->status;

        $videoName = Carbon::now()->timestamp.'.'.$this->video->extension();
        $this->video->storeAs('Course_Videos', $videoName);
        $course->video = $videoName;
        $course->save();
        session()->flash('message', 'Video has been Uploaded Successfully');
    }
    public function render()
    {
        $courses = product::all();
        return view('livewire.admin.admin-add-course-videos-component',['courses'=>$courses])->layout('layouts.admin');
    }
}
