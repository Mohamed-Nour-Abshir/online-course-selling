<?php

namespace App\Http\Livewire\Admin;

use App\Models\UploadCourseVideo;
use Livewire\Component;

class AdminCourseVideosComponent extends Component
{
    public $searchTerm;
    public function render()
    {
        $search = '%'. $this->searchTerm . '%';
        $coursevideos = UploadCourseVideo::where('course_id','LIKE',$search)
                              ->orwhere('created_at','LIKE',$search)
                              ->orwhere('title','LIKE',$search)
                              ->orderBy('id','Asc')->paginate(10);
        // $coursevideos = UploadCourseVideo::all();
        return view('livewire.admin.admin-course-videos-component',['coursevideos'=>$coursevideos])->layout('layouts.admin');
    }

    public function deletecoursevideo($id){
        $coursevideo = UploadCourseVideo::find($id);
        $coursevideo->delete();
        session()->flash('message', 'Video has been Deleted Successfully');
    }
}
