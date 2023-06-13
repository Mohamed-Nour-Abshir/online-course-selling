<div>
    {{-- <link rel="stylesheet" href="{{asset('assets/libarary/dist/css/ckin.css')}}"> --}}
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                @if (Session::has('order_message'))
                    <div class="alert alert-danger" role="alert">{{Session::get('order_message')}}</div>
                @endif
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                             Course Details
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('user.orders')}}" class="btn btn-success pull-right">My Courses</a>
                                {{-- @if($order->status == 'delivered')
                                    <a href="" wire:click.prevent="cancelOrder" class="btn btn-warning pull-right" style="margin-right: 20px;">Delete Course</a>
                                @endif --}}
                            </div>
                        </div>

                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <tr>
                                <th>Course Code</th>
                                <td>Course-{{$order->id}}</td>
                                <th>Course Start Date</th>
                                <td>{{date('d-m-Y h:i'),strtotime($order->created_at)}}</td>
                                {{-- <th>Order Status</th>
                                <td>{{$order->status}}</td> --}}
                                {{-- @if($order->status == "delivered")
                                <th>Delivered Date</th>
                                <td>{{$order->delivered_date}}</td>
                                @elseif($order->status == "canceled")
                                <th>Cancellation Date</th>
                                <td>{{$order->cancaled_date}}</td>
                                @endif --}}
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

       <div class="row">
           <div class="col-md-12">
               <div class="panel panel-default">
                   <div class="panel-heading">
                       <div class="row">
                           <div class="col-md-6">
                                My Course
                           </div>
                           <div class="col-md-6">
                            {{-- <p class="pull-right">{{$selectedCourse->course->name}}</p> --}}
                                @foreach ($order->orderItems as $item)
                                @if($order->order_status == 'ordered' && $item->rstatus == false)
                                    <div class="price-field sub-total pull-right"><p class="price"><a href="{{route('user.review',['order_item_id'=>$item->id])}}" class="btn btn-success">Write Review </a></p></div>
                                @endif
                                @endforeach
                               {{-- <a href="{{route('user.orders')}}" class="btn btn-success pull-right">My Courses</a> --}}
                           </div>
                       </div>
                   </div>
                   <div class="panel-body">
                    <div class="row">
                        <style>
                            video {
                                width: 100%;
                                height: auto;
                            }
                            .active{
                                background-color: #0EB582 !important;
                            }
                            video::-webkit-media-controls {
                                color: red;
                            }

                        </style>
                        @foreach ($course_videos as $course)
                        @endforeach
                        @if ($course->status == 'demo')
                            <div class="col-md-6">
                                <video width="520" height="340" controls controlsList="nodownload" autoplay src="{{asset('assets/images/Course_Videos')}}/{{ $course->video}}" type="MP4"></video>
                                <h2>{{ $course->title }}</h2>
                                <p>From the course: <b>{{$course->course->name}}</b></p>
                            </div>
                        @elseif ($selectedCourse)
                            <div class="col-md-6">
                                <video width="520" height="340" controls autoplay controlsList="nodownload" src="{{asset('assets/images/Course_Videos')}}/{{ $selectedCourse->video}}" type="MP4"></video>
                                <h2>{{ $selectedCourse->title }}</h2>
                                <p>From the course: <b>{{$selectedCourse->course->name}}</b></p>
                            </div>
                        @endif
                        {{-- <video poster="libarary/ckin.jpg" src="{{asset('assets/libarary/ckin.mp4')}}" data-overlay="1" data-title="The curious case of Chameleon..." width="100"></video> --}}
                         @if ($selectedCourse)
                        <div class="col-md-6">
                            <h3>Course Contents</h3>
                            <div class="list-group list-group-flush">
                                @foreach ($course_videos as $course)

                                   {{-- @if($course->status == 'demo')
                                        <a href="#" wire:click="selectCourse({{ $course->id }})" class="list-group-item {{ $course->status == 'demo' ? 'active' : '' }}" aria-current="true">
                                            <i class="fa fa-play text-dark"></i>
                                            <b> {{$course->title}} </b> <br>
                                            <span style="margin-left: 30px;" class="text-light">{{$course->duration}} minutes</span>
                                        </a>
                                    @else--}}
                                        <a href="#" wire:click="selectCourse({{ $course->id }})" class="list-group-item {{ $selectedCourse->id == $course->id ? 'active' : '' }}" aria-current="true">
                                            <i class="fa fa-play text-dark"></i>
                                            <b> {{$course->title}} </b> <br>
                                            <span style="margin-left: 30px;" class="text-light">{{$course->duration}} minutes</span>
                                        </a>
                                   {{-- @endif--}}
                                @endforeach
                                
                            </div>
                        </div>
                        @endif
                    </div>


                    @foreach ($order->orderItems as $item)
                    @if($order->order_status == 'Pending' && $item->rstatus == false)
                        <div class="price-field sub-total"><p class="price"><a href="{{route('user.review',['order_item_id'=>$item->id])}}">Write Review </a></p></div>
                    @endif
                    @endforeach
                    

                </div>
            </div>
        </div>
     </div>
 </div>

</div>
{{-- <script src="{{asset('assets/libarary/dist/js/ckin.js')}}"></script> --}}



