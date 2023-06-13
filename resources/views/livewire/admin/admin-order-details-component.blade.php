<link rel="stylesheet" href="{{asset('assets/css/style.css')}}">
<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                             <p class="card-title"> Order Details</p>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.orders')}}" class="btn btn-success pull-right">All Orders</a>
                            </div>
                        </div>

                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <!--<th>Course Id</th>-->
                                <!--<td class="text-danger">{{$order->id}}</td>-->
                                <th>Ordered Date</th>
                                <td class="text-danger">{{$order->created_at}}</td>
                                <th>Order Status</th>
                                <td class="text-danger">{{$order->order_status}}</td>
                                @if($order->order_status == "ordered")
                                <th>Accessed Date</th>
                                <td class="text-danger">{{$order->created_at}}</td>
                                @elseif($order->order_status == "canceled")
                                <th>Cancellation Date</th>
                                <td class="text-danger">{{$order->cancaled_date}}</td>
                                @endif
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <a class="btn btn-success mt-5 text-center printMerchandiser">Generate Pdf <i class="fas fa-download"></i></a>
        </div>
    <div id="Merchandiser">
       <div class="row mt-5">
           <div class="col-md-12">
               <div class="card p-5">
                   <div class="card-heading">
                    <div class="row">
                        <div class="col-md-6">
                         <p class="card-title">Course Details</p>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>
                   </div>
                   <div class="card-body">
                    <div class="wrap-iten-in-cart">
                        <h3 class="box-title">Course Name</h3>
                        <ul class="products-cart">
                            @foreach ($order->orderItems as $item)
                            <li class="pr-cart-item">
                                <div class="product-image">
                                    <figure><img src="{{asset('assets/images/products')}}/{{$item->product->image}}" alt="{{$item->product->name}}"></figure>
                                </div>
                                <div class="product-name">
                                    <a class="link-to-product" href="{{route('product.details',['slug'=>$item->product->slug])}}">{{$item->product->name}}</a>
                                </div>
                                @if ($item->options)
                                    <div class="product-name">
                                        @foreach (unserialize($item->options) as $key => $value)
                                            <p><b>{{$key}}: {{$value}}</b></p>
                                        @endforeach
                                    </div>
                                @endif
                                <!--<div class="price-field produtc-price"><p class="price">{{$item->price}} <span class="text-danger">BDT</span></p></div>-->
                                <!--<div class="quantity">-->
                                <!--    <h5>{{$item->quantity}}</h5>-->
                                <!--</div>-->
                                <div class="price-field sub-total"><p class="price">{{$item->price * $item->quantity}}  <span class="text-danger">BDT</span></p></div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="summary">
                        <div class="order-summary">
                            <h4 class="title-box"></h4>
                            <!--<p class="summary-info"><span class="title">Subtotal</span><b class="index">{{$order->subtotal}} </b> </p>-->
                            <p class="summary-info"><span class="title">Total</span><b class="index">{{$order->amount}} <span class="text-danger">BDT</span></b></p>
                        </div>
                    </div>
                   </div>
               </div>
           </div>
       </div>

       {{-- <div class="row mt-5">
        <div class="col-md-12">
            <div class="card p-5">
                <div class="card-body">
                   <p class="card-title">Billing Details</p>
                </div>
                <div class="table-responsive">
                 <table class="table table-bordered">
                     <tr>
                         <th>Student Name</th>
                         <td>{{$order->firstname}}</td>
                     </tr>
                     <tr>
                        <th>Phone</th>
                        <td>{{$order->phone}}</td>
                        <th>Email</th>
                        <td>{{$order->email}}</td>
                    </tr>
                 </table>

                </div>
            </div>
        </div>
    </div> --}}

     @if ($order->is_shipping_different)
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                      <p class="card-title">Shipping Details</p>
                    </div>
                    <div class="tabel-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th>First Name</th>
                                <td>{{$order->shipping->firstname}}</td>
                                <th>Last Name</th>
                                <td>{{$order->shipping->lastname}}</td>
                            </tr>
                            <tr>
                               <th>Phone</th>
                               <td>{{$order->shipping->mobile}}</td>
                               <th>Email</th>
                               <td>{{$order->shipping->email}}</td>
                           </tr>
                           <tr>
                               <th>Line1</th>
                               <td>{{$order->shipping->line1}}</td>
                               <th>Line2</th>
                               <td>{{$order->shipping->line2}}</td>
                           </tr>
                           <tr>
                               <th>City</th>
                               <td>{{$order->shipping->city}}</td>
                               <th>Province</th>
                               <td>{{$order->shipping->province}}</td>
                           </tr>
                           <tr>
                               <th>Country</th>
                               <td>{{$order->shipping->country}}</td>
                               <th>Zipcode</th>
                               <td>{{$order->shipping->zipcode}}</td>
                           </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card p-5">
                <div class="card-body">
                   <p class="card-title">User Details</p>
                </div>
                <div class="table-responsive">
                  <table class="table table-bordered">
                      <tr>
                        <th>Student Name</th>
                        <td>{{$order->name}}</td>
                      </tr>
                      <tr>
                        <th>Student Email</th>
                        <td>{{$order->email}}</td>
                      </tr>
                      <tr>
                        <th>Student Phone No.</th>
                        <td>{{$order->phone}}</td>
                      </tr>
                  </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card p-5">
                <div class="card-body">
                   <p class="card-title">Transaction Details</p>
                </div>
                <div class="table-responsive">
                  <table class="table table-bordered">
                      <tr>
                        <th>Transaction Status</th>
                        <td>{{$order->status}}</td>
                      </tr>
                      <tr>
                        <th>Transaction Date</th>
                        <td>{{$order->created_at}}</td>
                      </tr>
                  </table>
                </div>
            </div>
        </div>
    </div>

  </div>

    </div>
</div>
