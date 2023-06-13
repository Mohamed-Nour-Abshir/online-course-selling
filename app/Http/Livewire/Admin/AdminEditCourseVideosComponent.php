<?php

namespace App\Http\Livewire\Admin;

use App\Models\product;
use App\Models\UploadCourseVideo;
use Carbon\Carbon;
use Livewire\Component;
use Livewire\WithFileUploads;

class AdminEditCourseVideosComponent extends Component
{
    use WithFileUploads;

    public $title;
    public $duration;
    public $course_id;
    public $status;
    public $video;
    public $course_video_id;
    public $newvideo;

    public function mount($id){
        $course_video = UploadCourseVideo::find($id);
        $this->title = $course_video->title;
        $this->duration = $course_video->duration;
        $this->course_id = $course_video->course_id;
        $this->status = $course_video->status;
        $this->video = $course_video->video;
        $this->course_video_id = $course_video->id;
    }


    public function updated($fields){
        $this->validateOnly($fields,[
            'title' => 'required',
            'duration' => 'required',
            'course_id' => 'required',
            'status' => 'required',
            'video' => 'required'
        ]);
    }
    public function updateCourseVideo(){

        $this->validate([
            'title' => 'required',
            'duration' => 'required',
            'course_id' => 'required',
            'status' => 'required',
            'video' => 'required'
        ]);
        $course = UploadCourseVideo::find($this->course_video_id);
        $course->title = $this->title;
        $course->duration = $this->duration;
        $course->course_id = $this->course_id;
        $course->status = $this->status;

        if($this->newvideo){
            unlink('assets/images/Course_Videos'.'/'.$course->video);
            $videoName = Carbon::now()->timestamp.'.'.$this->newvideo->extension();
            $this->newvideo->storeAs('Course_Videos', $videoName);
            $course->video = $videoName;
        }
        $course->save();
        session()->flash('message', 'Video has been Uploaded Successfully');
    }
    public function render()
    {
        $courses = product::all();
        return view('livewire.admin.admin-edit-course-videos-component',['courses'=>$courses])->layout('layouts.admin');
    }
}
