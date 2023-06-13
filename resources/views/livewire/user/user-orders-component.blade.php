<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="text-success h3">All Courses</span>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="text-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>Course</th>
                                    <th>Course Name</th>
                                    {{-- <th>Subtotal</th> --}}
                                    <th>Discount</th>
                                    <th>Price</th>
                                    {{-- <th>Date</th> --}}
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $i = 0;
                                @endphp
                                @foreach ($orders as $order)
                                @if ($order->status == 'Complete' && $order->order_status == 'ordered' || $order->status == 'Processing' && $order->order_status == 'ordered')
                                    
                                    <tr>
                                        <td>{{++$i}}</td>
                                        @foreach ($order->orderItems as $item)
                                            <td>
                                                <a href="{{route('user.orderdetails',['order_id'=>$order->id])}}">
                                                    <figure><img src="{{asset('assets/images/products')}}/{{$item->product->image}}" alt="{{$item->product->name}}" width="60" height="60"></figure>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="{{route('user.orderdetails',['order_id'=>$order->id])}}">{{$item->product->name}}</a>
                                            </td>
                                        @endforeach
                                        
                                        {{-- <td><span class="text-danger">&#2547;</span>{{$order->subtotal}}</td> --}}
                                        <td><span class="text-danger">&#2547;</span>{{$order->discount}}</td>
                                        <td><span class="text-danger">&#2547;</span>{{$order->amount}}</td>
                                        {{-- <td>{{$order->created_at}}</td> --}}
                                        <td><a href="{{route('user.orderdetails',['order_id'=>$order->id])}}" class="btn btn-info btn-sm"><i class="fa fa-eye"></i> View</a></td>
                                    </tr>
                                    @endif
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                        <div class="wrap-pagination-info">
                            {{$orders->links()}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

