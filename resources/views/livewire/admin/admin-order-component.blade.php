<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="pull-left card-title">All Orders</p>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        @if (Session::has('order_message'))
                            <div class="alert alert-success" role="alert">{{Session::get('order_message')}}</div>
                        @endif
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Order</th>
                                    <!--<th>Subtotal</th>-->
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Student Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Status</th> 
                                    <th>Order Date</th>
                                    <th colspan="2" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $i = 0;
                                @endphp
                                @foreach ($orders as $order)
                                    <tr>
                                        <td>{{++$i}}</td>
                                        <!--<td>{{$order->subtotal}} <span class="text-danger">BDT</span></td>-->
                                        <td>{{$order->amount}} <span class="text-danger">BDT</span></td>
                                        <td>{{$order->discount}} <span class="text-danger">BDT</span></td>
                                        <td>{{$order->name}}</td>
                                        <td>{{$order->email}}</td>
                                        <td>{{$order->phone}}</td>
                                        <td>{{$order->status}}</td>
                                        <td>{{$order->created_at}}</td>
                                        <td><a href="{{route('admin.orderdetails',['order_id'=>$order->id])}}" class="btn btn-info btn-sm">Details</a></td>
                                        <td>
                                            <div class="dropdown">
                                                <a class="btn btn-success btn-sm dropdown-toggle" type="submit" data-toggle="dropdown">Status
                                                    <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li class="dropdown-item"><a href="#" wire:click.prevent="updateOrderStatus({{$order->id}},'ordered')">Accessed</a></li>
                                                    <li class="dropdown-item"><a href="#" wire:click.prevent="updateOrderStatus({{$order->id}},'canceled')">Canceled</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                        {{$orders->links()}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
