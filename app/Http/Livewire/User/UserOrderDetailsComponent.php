<?php

namespace App\Http\Livewire\User;

use App\Models\Order;
use App\Models\product;
use App\Models\UploadCourseVideo;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class UserOrderDetailsComponent extends Component
{
    public $order_id;
    public $courses;
    public $selectedCourse;

    public function mount($order_id){
        $this->order_id = $order_id;
        $this->courses = UploadCourseVideo::all();
        $this->selectedCourse = $this->courses->first();
    }

    public function selectCourse($id)
    {
        $this->selectedCourse = UploadCourseVideo::findOrFail($id);
    }

    public function cancelOrder(){
      $order = Order::find($this->order_id);
      $order->status = 'canceled';
      $order->cancaled_date = DB::raw('CURRENT_DATE');
      $order->save();
      session()->flash('order_message','Order has been canceled successfully!');
    }
    public function render()
    {
        $order = Order::where('user_id', Auth::user()->id)->where('id',$this->order_id)->first();
        $course = Order::with('courseVideos')->find($this->order_id);
        $course_videos = $course->courseVideos;
        // dd($course_videos);
        return view('livewire.user.user-order-details-component',['order'=>$order,'course_videos'=>$course_videos])->layout('layouts.home');
    }

}
