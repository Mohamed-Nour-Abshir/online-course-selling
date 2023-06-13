<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <p class="pull-left card-title">All Course Videos</p>
                            </div>
                            <div class="col-md-64">
                                <a href="{{route('admin.addcoursevideos')}}" class="btn btn-success pull-right">Add Course Video</a>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="Search..." wire:model="searchTerm">
                            </div>
                        </div>
                    </div>

                    @if (Session::has('message'))
                        <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                    @endif
                    <div class="table-responsive">
                    <table class="table table-striped table-bordered mb-3">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Video</th>
                                <th>Course Name</th>
                                <th>Lesson Title</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i = 0;
                            @endphp
                            @foreach ($coursevideos as $coursevideo)
                                <tr>
                                    <td>{{++$i}}</td>
                                    <td>
                                        <video width="160" height="60" controls>
                                            <source src="{{asset('assets/images/Course_Videos')}}/{{$coursevideo->video}}" type="video/mp4">
                                        </video>
                                    </td>
                                    <td>{{$coursevideo->course->name}}</td>
                                    <td>{{$coursevideo->title}}</td>
                                    <td>{{date('d-m-Y T h:i'),strtotime($coursevideo->created_at)}}</td>
                                    <td>
                                        <a href="{{route('admin.editcoursevideos',['id'=>$coursevideo->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                        <a href="#" onclick="confirm('Are you sure to Delete this coursevideo?') || event.stopImmediatePropagation()" wire:click.prevent="deletecoursevideo({{$coursevideo->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                    </td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
                {{$coursevideos->links()}}
                </div>
            </div>
        </div>
    </div>
</div>
