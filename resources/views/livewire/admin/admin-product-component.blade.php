 <div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <p class="pull-left card-title">All Courses</p>
                            </div>
                            <div class="col-md-64">
                                <a href="{{route('admin.Addproduct')}}" class="btn btn-success pull-right">Add Course</a>
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
                                <th>Image</th>
                                <th>Course Name</th>
                                <th>Course Price</th>
                                <th>Course Sale Price</th>
                                <th>Course Category</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i = 0;
                            @endphp
                            @foreach ($products as $product)
                                <tr>
                                    <td>{{++$i}}</td>
                                    <td><img src="{{asset('assets/images/products')}}/{{$product->image}}" alt="products" width="60"></td>
                                    <td>{{$product->name}}</td>
                                    <td><span class="text-danger">&#2547;</span>{{$product->regular_price}}</td>
                                    <td><span class="text-danger">&#2547;</span>{{$product->sale_price}}</td>
                                    <td>{{$product->category->name}}</td>
                                    <td>{{$product->created_at}}</td>
                                    <td>
                                        <a href="{{route('admin.editproduct',['product_slug'=>$product->slug])}}"><i class="fa fa-edit fa-2x"></i></a>
                                        <a href="#" onclick="confirm('Are you sure to Delete this product?') || event.stopImmediatePropagation()" wire:click.prevent="deleteProduct({{$product->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                    </td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
                {{$products->links()}}
                </div>
            </div>
        </div>
    </div>
</div>
