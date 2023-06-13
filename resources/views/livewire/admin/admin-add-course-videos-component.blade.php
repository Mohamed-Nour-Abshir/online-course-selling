<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Add Video To Course</p>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.coursevideos')}}" class="btn btn-success pull-right">All Course Videso</a>
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="storeCourseVideo" class="forms-sample" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" class="form-control input-md" placeholder="Lesson Title" wire:model="title">
                                @error('title')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Duration</label>
                                <input type="text" class="form-control input-md" placeholder="Video duration in Minutes" wire:model="duration">
                                @error('duration')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Course</label>
                                <select class="form-control input-md" wire:model="course_id">
                                    <option value="">Select Course for this video</option>
                                    @foreach ($courses as $course)
                                        <option value="{{$course->id}}">{{$course->name}}</option>
                                    @endforeach
                                </select>
                                @error('course')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Video Status</label>
                                <select class="form-control input-md" wire:model="status">
                                    <option value="">Select Video Status</option>
                                    <option value="demo">Demo</option>
                                    <option value="lock">Lock</option>
                                </select>
                                @error('course')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Upload Video</label>
                                <input type="file" class="form-control input-file" wire:model="video">
                                @if ($video)
                                <video width="320" height="240" controls>
                                    <source src="{{ $video->temporaryUrl() }}" type="video/mp4">
                                </video>
                                @endif
                                @error('video')<span class="text-danger">{{$message}}</span> @enderror <br>
                              </div>
    

                            <div class="form-group">
                                <label></label>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>

