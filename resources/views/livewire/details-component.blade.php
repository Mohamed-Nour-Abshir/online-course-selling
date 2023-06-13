<div>
<main id="main" class="main-site">

    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="/" class="link">home</a></li>
                <li class="item-link"><span>Course Details</span></li>
            </ul>
        </div>
        <div class="row">

            @if (Session::has('message'))
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    {{Session::get('message')}}
                </div>
            @endif

            <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">
                <div class="wrap-product-detail">
                    <div class="detail-media">
                        <div class="product-gallery" wire:ignore>
                          <ul class="slides">
                            <li data-thumb="{{asset('assets/images/products')}}/{{$product->image}}">
                                <img src="{{asset('assets/images/products')}}/{{$product->image}}" alt="{{$product->name}}" />
                            </li>
                            @php
                                $images = explode(",",$product->images);
                            @endphp
                            @foreach ($images as $image)
                                @if ($image)
                                    <li data-thumb="{{asset('assets/images/products')}}/{{$image}}">
                                        <img src="{{asset('assets/images/products')}}/{{$image}}" alt="{{$product->name}}" />
                                    </li>
                                @endif
                            @endforeach
                          </ul>
                        </div>
                    </div>
                    <div class="detail-info">
                        
                        <p class="product-name"><b>{{$product->name}}</b></p>
                        {{-- <hr> --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="product-rating">
                                        <style>
                                            .color-gray{
                                                color: #e6e6e6 !important;
                                            }
                                        </style>
                                        @php
                                            $avgrating = 0;
                                        @endphp
                                        @foreach ($product->orderItems->where('rstatus',1) as $orderItem)
                                            @php
                                                $avgrating = $avgrating + $orderItem->review->rating;
                                            @endphp
                                        @endforeach
                                        @for ($i=1;$i<=5;$i++)
                                            @if ($i<=$avgrating)
                                              <i class="fa fa-star" aria-hidden="true"></i>
                                            @else
                                               <i class="fa fa-star color-gray" aria-hidden="true"></i>
                                            @endif
                                        @endfor
                                        <a href="#" class="count-review">({{$product->orderItems->where('rstatus',1)->count()}} review)</a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4>{{$product->students}} students</h4>
                                </div>
                            </div>
                        <div class="short-desc">

                            {!!$product->description!!}
                        </div>
                        @if ($product->sale_price > 0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
                            <div class="wrap-price"><ins><p class="product-price"><span class="text-danger">&#2547;</span>{{$product->sale_price}}</p></ins> <del><p class="product-price"><span class="text-danger">&#2547;</span>{{$product->regular_price}}</p></del></div>
                        @else
                            <div class="wrap-price"><span class="product-price"><span class="text-danger">&#2547;</span> {{$product->regular_price}}</span></div>
                        @endif

                        <div>
                            
                        </div>

                        <div class="wrap-butons">
                            @if ($product->sale_price > 0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
                             <a href="#" class="btn add-to-cart" wire:click.prevent="store('{{$product->id}}','{{$product->name}}','{{$product->sale_price}}')">Buy Now</a>
                            @else
                             <a href="#" class="btn add-to-cart" wire:click.prevent="store('{{$product->id}}','{{$product->name}}','{{$product->regular_price}}')">Buy Now</a>
                            @endif
                            <div class="wrap-btn">
                                <a href="" class="btn btn-wishlist" wire:click.prevent="addToWishlist('{{$product->id}}','{{$product->name}}','{{$product->regular_price}}')">Add Favourites</a>
                                {{-- <a href="#" class="btn btn-wishlist">Add Wishlist</a> --}}
                            </div>
                        </div>
                    </div>
                    <div class="advance-info">
                        <div class="tab-control normal">
                            <a href="#description" class="tab-control-item active">Overview</a>
                            <a href="#course_details" class="tab-control-item">Course Curriculum</a>
                            <a href="#add_infomation" class="tab-control-item">Instructor</a>
                            <a href="#review" class="tab-control-item">Reviews</a>
                        </div>
                        <div class="tab-contents">
                            <div class="tab-content-item" id="course_details">
                                    <style>
                                        video {
                                            width: 100%;
                                            height: auto;
                                        }
                                        #p_disabled:hover{
                                            cursor: default;
                                        }
                                    </style>
                                {{-- <div class="list-group list-group-flush">
                                    @foreach ($course_videos as $course_video)
                                    @if ($course_video->course_id == $product->id)
                                    @if ($course_video->status === 'demo')
                                        <a href="#{{$course_video->id}}" class="list-group-item active" aria-current="true" rel="modal:open">
                                            <i class="fa fa-play text-danger"></i>
                                        <b> {{$course_video->title}} <br>
                                        <span style="margin-left: 30px;" class="text-muted">{{$course_video->duration}} minutes</span></b>
                                        </a>
                                        <div id="{{$course_video->id}}" class="modal">
                                            <video width="420" height="240" controls controlsList="nodownload" src="{{asset('assets/images/Course_Videos')}}/{{$course_video->video}}" type="video/mp4"></video>
                                            <a href="#" rel="modal:close"></a>
                                        </div>
                                    @else
                                        <p class="list-group-item" id="p_disabled"><i class="fa fa-lock text-secondary" ></i> <b> {{$course_video->title}} 
                                        <br> <span style="margin-left: 30px;" class="text-muted">{{$course_video->duration}} minutes</span></b>
                                        </p>
                                        <div id="{{$course_video->id}}" class="modal">
                                            <video width="420" height="240" controls>
                                                <source src="{{asset('assets/images/Course_Videos')}}/{{$course_video->video}}" type="video/mp4">
                                            </video>
                                            <a href="#" rel="modal:close"></a>
                                        </div>
                                    @endif

                                    
                                    @endif
                                    @endforeach
                                </div> --}}




                                <div class="list-group list-group-flush">
                                    @foreach ($course_videos as $course_video)
                                    @if ($course_video->course_id == $product->id)
                                    @if ($course_video->status === 'demo')
                                        <a href="#{{$course_video->id}}" class="list-group-item active" aria-current="true" id="modalBtn">
                                            <i class="fa fa-play text-danger"></i>
                                        <b> {{$course_video->title}} <br>
                                        <span style="margin-left: 30px;" class="text-muted">{{$course_video->duration}} minutes</span></b>
                                        </a>
                                        <div id="modalDemo" class="jqModal">
                                            <!-- Our Content for the Modal Dialog Box-->
                                            <div class="content">
                                               <span class="exit">&times;</span>
                                               <video width="420" height="240" controls controlsList="nodownload">
                                                    <source src="{{asset('assets/images/Course_Videos')}}/{{$course_video->video}}" type="video/mp4">
                                                </video>
                                            </div>
                                        </div>
                                    @else
                                        <p class="list-group-item" id="p_disabled"><i class="fa fa-lock text-secondary" ></i> <b> {{$course_video->title}} 
                                        <br> <span style="margin-left: 30px;" class="text-muted">{{$course_video->duration}} minutes</span></b>
                                        </p>
                                        <div id="{{$course_video->id}}" class="modal">
                                            <video width="420" height="240" controls>
                                                <source src="{{asset('assets/images/Course_Videos')}}/{{$course_video->video}}" type="video/mp4">
                                            </video>
                                            <a href="#" rel="modal:close"></a>
                                        </div>
                                    @endif

                                    
                                    @endif
                                    @endforeach
                                </div>

                                <style>
                                    /* CSS for The Modal Dialog Box(background) */
                                    .jqModal {
                                    display: none; /* By default, display will be hidden */
                                    position: fixed; /* Position will be fixed */
                                    z-index: 1; /* makes the modal box display on the top */
                                    padding-top: 100px; /* Location of the modal box */
                                    left: 0;
                                    top: 0;
                                    width: 100%; /* width 100%, resizable according to window size */
                                    height: 100%; /* height 100%, resizable according to window size */
                                    overflow: auto; /* Enable scroll if needed */
                                    background-color: rgb(0,0,0); /* color for the Fallback */
                                    background-color: rgba(0,0,0,0.7); /* Opacity for the fallback */
                                    z-index: 10;
                                    }
                                    /* CSS for Modal Dialog Content Text */
                                    .content {
                                    background-color:#FFF;
                                    margin: auto;
                                    padding: 20px;
                                    /* border: 2px solid rgb(75, 155, 0); */
                                    border-radius: 10px;
                                    width: 50%;
                                    z-index: 10;
                                    }
                                    /* CSS for Cross or exit or close Button */
                                    .exit {
                                    color: red;
                                    float: right;
                                    font-size: 30px;
                                    font-weight: bold;
                                    /* background: #000; */
                                    /* border-radius: 50%; */
                                    padding: 20px;
                                    width: 30px;
                                    height: 30px;
                                    background-color: #020101;
                                    border-radius: 50%;
                                    display: flex;
                                    justify-content: center;
                                    align-items: center;
                                    margin-bottom: 10px;
                                    }
                                    .exit:hover,
                                    .exit:focus {
                                    color: #740505;
                                    cursor: pointer;
                                    }
                                </style>
                            </div>
                            <div class="tab-content-item active" id="description">
                                <div class="row">
                                <div class="col-md-8">
                                        {!!$product->description!!}
                                    {{-- </div>
                                    <div class="col-md-6"> --}}
                                        <h4>Course Requirements</h4>
                                        <table class="shop_attributes">
                                            <tbody>
                                                @foreach ($product->attributeValues->unique('product_attribute_id') as $av)
                                                    <tr>
                                                        <th>{{$av->productAttribute->name}} : </th>
                                                        @foreach ($av->productAttribute->attributeValues->where('product_id',$product->id) as $pav)
                                                            <td><p>{{$pav->value}}</p></td>
                                                        @endforeach
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item " id="add_infomation">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="{{asset('assets/images/instructors')}}/{{$product->instructor_image}}" alt="{{$product->name}}" class="rounded-circle" />
                                    </div>
                                    <div class="col-md-8">
                                        <span><b>{{$product->instructor_name}}</b></span><br>
                                        <span class="text-muted">{{$product->instrucotr_profession}}</span>
                                        <p>{!!$product->instructor_details!!}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item " id="review">

                                <div class="wrap-review-form">
                                    <style>
                                        .width-0-percent{
                                            width: 0%;
                                        }
                                        .width-20-percent{
                                            width: 20%;
                                        }
                                        .width-40-percent{
                                            width: 40%;
                                        }
                                        .width-60-percent{
                                            width: 60%;
                                        }
                                        .width-80-percent{
                                            width: 80%;
                                        }
                                        .width-100-percent{
                                            width: 100%;
                                        }
                                    </style>
                                    <div id="comments">
                                        <h2 class="woocommerce-Reviews-title">{{$product->orderItems->where('rstatus',1)->count()}} review for <span>{{$product->name}}</span></h2>
                                        <ol class="commentlist">
                                            @foreach ($product->orderItems->where('rstatus',1) as $orderItem)
                                                <li class="comment byuser comment-author-admin bypostauthor even thread-even depth-1" id="li-comment-20">
                                                    <div id="comment-20" class="comment_container">
                                                        <img alt="{{$orderItem->order->user->name}}" src="@if($orderItem->order->user->profile){{asset('assets/images/profile')}}/{{$orderItem->order->user->profile->image}} @else {{asset('assets/images/profile/default.png')}} @endif " height="80" width="80">
                                                        <div class="comment-text">
                                                            <div class="star-rating">
                                                                <span class="width-{{$orderItem->review->rating * 20}}-percent">Rated <strong class="rating">{{$orderItem->review->rating}}</strong> out of 5</span>
                                                            </div>
                                                            <p class="meta">
                                                                <strong class="woocommerce-review__author">{{$orderItem->order->user->name}}</strong>
                                                                <span class="woocommerce-review__dash">–</span>
                                                                <time class="woocommerce-review__published-date" datetime="2008-02-14 20:00" >{{Carbon\Carbon::parse($orderItem->review->created_at)->format('d F Y g:i A')}}</time>
                                                            </p>
                                                            <div class="description">
                                                                <p>{{$orderItem->review->comment}}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ol>
                                    </div><!-- #comments -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--end main products area-->

            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
                <div class="widget mercado-widget categories-widget">
                    <h2 class="widget-title">All Course Categories</h2>
                    <div class="widget-content">
                        <ul class="list-category">
                            @foreach ($categories as $category)
                                <li class="category-item {{count($category->subcategories) > 0 ? 'has-child-cate' : ''}}">
                                    <a href="{{route('product.category',['category_slug'=>$category->slug])}}" class="cate-link">{{$category->name}}</a>
                                    @if (count($category->subcategories) > 0)
                                        <span class="toggle-control">+</span>
                                        <ul class="sub-cate">
                                            @foreach ($category->subcategories as $scategory)
                                                <li class="category-item">
                                                    <a href="{{route('product.category',['category_slug'=>$category->slug, 'scategory_slug'=>$scategory->slug])}}" class="cat-link"><i class="fa fa-caret-right"></i> {{$scategory->name}}</a>
                                                </li>
                                            @endforeach

                                        </ul>
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div><!-- Categories widget-->

                <div class="widget mercado-widget widget-product">
                    <h2 class="widget-title">Popular Courses</h2>
                    <div class="widget-content">
                        <ul class="products">
                            @foreach ($popular_products as $p_products)
                            <li class="product-item">
                                <div class="product product-widget-style">
                                    <div class="thumbnnail">
                                        <a href="{{route('product.details',['slug'=>$p_products->slug])}}" title="{{$p_products->name}}">
                                            <figure><img src="{{asset('assets/images/products')}}/{{$p_products->image}}" alt="{{$p_products->name}}"></figure>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <a href="{{route('product.details',['slug'=>$p_products->slug])}}" class="product-name"><span>{{$p_products->name}}</span></a>
                                        <div class="wrap-price"><span class="product-price"><span class="text-danger">&#2547;</span>{{$p_products->regular_price}}</span></div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

            </div><!--end sitebar-->

            <div class="single-advance-box col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="wrap-show-advance-info-box style-1 box-in-site">
                    <h3 class="title-box">Related Courses</h3>
                    <div class="wrap-products">
                        <div class="products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"5"}}' >
                            @foreach ($related_products as $r_product)
                            <div class="product product-style-2 equal-elem ">
                                <div class="product-thumnail">
                                    <a href="{{route('product.details',['slug'=>$r_product->slug])}}" title="{{$r_product->name}}">
                                        <figure><img src="{{asset('assets/images/products')}}/{{$r_product->image}}" width="214" height="214" alt="{{$r_product->name}}"></figure>
                                    </a>
                                    <div class="group-flash">
                                        <span class="flash-item new-label">new</span>
                                    </div>
                                    <div class="wrap-btn">
                                        <a href="{{route('product.details',['slug'=>$r_product->slug])}}" class="function-link">quick view</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <a href="{{route('product.details',['slug'=>$r_product->slug])}}" class="product-name"><span>{{$r_product->name}}</span></a>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="product-rating">
                                                <style>
                                                    .color-gray{
                                                        color: #e6e6e6 !important;
                                                    }
                                                </style>
                                                @php
                                                    $avgrating = 0;
                                                @endphp
                                                @foreach ($r_product->orderItems->where('rstatus',1) as $orderItem)
                                                    @php
                                                        $avgrating = $avgrating + $orderItem->review->rating;
                                                    @endphp
                                                @endforeach
                                                @for ($i=1;$i<=5;$i++)
                                                    @if ($i<=$avgrating)
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    @else
                                                    <i class="fa fa-star color-gray" aria-hidden="true"></i>
                                                    @endif
                                                @endfor
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <h6 class="fc-name">120 students</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <style>
                                                #course_description{
                                                    max-height: 30px; 
                                                    overflow: hidden; 
                                                }
                                                #course_description:hover{
                                                    max-height: 500px; 
                                                    /* overflow: hidden;  */
                                                }
                                            </style>
                                            <h6 id="course_description">{!!$r_product->short_description!!}<a href="{{route('product.details',['slug'=>$r_product->slug])}}" class="product-name text-danger"><b>..Show Details</b></a></h6>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-5">
                                            <div class="wrap-price"><span class="product-price"><span class="text-danger">&#2547;</span>{{$r_product->regular_price}}</span></div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div><!--End wrap-products-->
                </div>
            </div>

        </div><!--end row-->

    </div><!--end container-->

</main>
<!--main area-->
</div>
{{-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> --}}
{{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script> --}}
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>


@push('scripts')
{{-- <script>
    $(function() {
        $('#vidBox').VideoPopUp({
            backgroundColor: "#17212a",
            opener: "video1",
            idvideo: "v1",
            pausevideo: true
        });
    });
</script> --}}
<script>
    // Set object for the modal
    var myModal = document.getElementById("modalDemo");
    // Set object for the button that will trigger the modal box
    var myButton = document.getElementById("modalBtn");
    // Set an element that will close the modal box
    var exitBtn = document.getElementsByClassName("exit")[0];
    // Allows display of modal box, when user clicks the button
    myButton.onclick = function() {
    myModal.style.display = "block";
    }
    // Allows the user to close the modal box, when user will click on (x) button
    exitBtn.onclick = function() {
    myModal.style.display = "none";
    }
    // Allows the user to close the modal box, even when the user clicks anywhere outside of the modal box
    window.onclick = function(event) {
    if (event.target == myModal) {
    myModal.style.display = "none";
    }
    }
</script>

@endpush