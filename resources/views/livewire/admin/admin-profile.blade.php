<div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                Profile
            </div>
            <div class="panel-body">
                <div class="col-md-4">
                    @if ($user->profile->image)
                        <img src="{{asset('assets/images/profile')}}/{{$user->profile->image}}" width="100%" alt="" style="border: 1px solid white; border-radius:20px;">
                    @else
                        <img src="{{asset('assets/images/profile/default.png')}}" width="100%" alt="">
                    @endif
                </div>
                <div class="col-md-8">
                    <p><b>Name:</b>{{$user->name}}</p>
                    <p><b>Email:</b>{{$user->email}}</p>
                    <p><b>Phone No:</b>{{$user->profile->mobile}}</p>
                    <hr>
                    <p><b>Line1:</b>{{$user->profile->line1}}</p>
                    <p><b>Line2:</b>{{$user->profile->line2}}</p>
                    <p><b>City:</b>{{$user->profile->city}}</p>
                    <p><b>Province:</b>{{$user->profile->province}}</p>
                    <p><b>Country:</b>{{$user->profile->country}}</p>
                    <p><b>ZipCode:</b>{{$user->profile->zipcode}}</p>
                    <a href="{{route('admin.editprofile')}}" class="btn btn-info pull-right mb-5">Update Profile</a>
                </div>
            </div>
        </div>
    </div>

</div>
