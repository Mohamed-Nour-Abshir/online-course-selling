<main id="main">
<div class="container">
    <style>
        #course-wrap-onsale{
            width:200px;
        }
        #course-wrap-category{
            width:300px;
        }
        #course_onsale{
         white-space: nowrap;
         overflow: hidden;
         text-overflow: ellipsis;
        }
        /* #course_description{
            max-height: 30px; 
            overflow: hidden; 
        }
        #course_description:hover{
            max-height: 500px; 
        } */
        #course_description-wrap-onsale{
            width: 200px;
        }
        #course_description-head-onsale{
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        #course_description-wrap{
            width: 350px;
        }
        #course_description-head{
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            /* max-height: 30px; */
        }
        #course-rating-students{
            display: flex;
            justify-content: space-between;
        }
    </style>
<!--MAIN SLIDE-->
<div class="wrap-main-slide">
    <div class="slide-carousel owl-carousel style-nav-1" data-items="1" data-loop="1" data-nav="true" data-dots="false">
        @foreach ($sliders as $slide)
            <div class="item-slide">
                <img src="{{asset('assets/images/sliders')}}/{{$slide->image}}" alt="" class="img-slide img-fluid">
                {{--style="height:400px;"--}}
                <div class="slide-info slide-1">
                    <h2 class="f-title">{{$slide->title}}</h2>
                    <span class="subtitle">{{$slide->subtitle}}</span>
                    {{--<p class="sale-info">Only price: <span class="price">${{$slide->price}}</span></p>--}}
                    {{-- <a href="{{$slide->link}}" class="btn-link">Shop Now</a> --}}
                </div>
            </div>
        @endforeach

    </div>
</div>

<!--BANNER-->
<div class="wrap-banner style-twin-default">
    {{-- <div class="banner-item">
        <a href="/shop" class="link-banner banner-effect-1">
            <figure><img src="{{asset('assets/images/home-1-banner-1.jpg')}}" alt="" width="580" height="190"></figure>
        </a>
    </div> --}}
    {{-- <div class="banner-item">
        <a href="/shop" class="link-banner banner-effect-1">
            <figure><img src="{{asset('assets/images/home-1-banner-2.jpg')}}" alt="" width="580" height="190"></figure>
        </a>
    </div> --}}
</div>

<!--On Sale-->

@if ($sproducts->count() > 0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
<div class="wrap-show-advance-info-box style-1 has-countdown" id="on-sale">
    <h3 class="title-box">Discount Courses</h3>
    <div class="wrap-countdown mercado-countdown" data-expire="{{ Carbon\Carbon::parse($sale->sale_date)->format('Y/m/d h:m:s') }}"></div>
    <div class="wrap-products slide-carousel owl-carousel style-nav-1 equal-container " data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"3"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"3"}}'>
        @foreach ($sproducts as $sproduct)
        <div class="product product-style-2 equal-elem ">
            <div class="product-thumnail">
                <a href="{{route('product.details',['slug'=>$sproduct->slug])}}" title="{{$sproduct->name}}">
                    <figure><img src="{{asset('assets/images/products')}}/{{$sproduct->image}}" width="800" height="800" alt="{{$sproduct->name}}" class="rounded"></figure>
                </a>
                <div class="group-flash">
                    <span class="flash-item sale-label">Offer</span>
                </div>
            </div>
            <div class="product-info">
                <div id="course-wrap-category">
                    <a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="product-name "><span id="course_onsale">{{$sproduct->name}}</span></a>
                </div>
                <div id="course-rating-students">
                    {{-- <div class="col-md-6"> --}}
                        <div class="product-rating">
                            <style>
                                .color-gray{
                                    color: #e6e6e6 !important;
                                }
                            </style>
                            @php
                                $avgrating = 0;
                            @endphp
                            @foreach ($sproduct->orderItems->where('rstatus',1) as $orderItem)
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
                    {{-- </div> --}}
                    <div>
                        <h6 class="fc-name">{{$sproduct->students}} students</h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="course_description-wrap">
                            {{-- <h6 id="course_description-head">{!!$sproduct->short_description!!}<a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="product-name text-danger"><b>..Show Details</b></a></h6> --}}
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="wrap-price"><del><p class="product-price"><b> <span> &#2547;</span>{{$sproduct->regular_price}}</b></p></del>   <ins><p class="product-price text-dark" style="margin-left: 20px;"><b><span class="">&#2547;</span>{{$sproduct->sale_price}}</b></p></ins></div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="btn add-to-cart">Enroll Now</a>
            </div>
        </div>
        @endforeach

    </div>
</div>
@else
<p>No onsale products</p>
@endif

<!--Latest Products-->
<div class="wrap-show-advance-info-box style-1" id="Latest-products">
<h3 class="title-box">Latest Courses</h3>
<div class="wrap-top-banner">
    <a href="#" class="link-banner banner-effect-2">
        <figure><img src="{{asset('assets/images/online-learning.png')}}" width="1170" height="240" alt=""></figure>
    </a>
</div>
<div class="wrap-products">
    <div class="wrap-product-tab tab-style-1">
        <div class="tab-contents">
            <div class="tab-content-item active" id="digital_1a">
                {{-- data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"4"},"1200":{"items":"5"}}'  --}}
                <div class="wrap-products slide-carousel owl-carousel style-nav-1 equal-container"   data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"3"}}' >
                  @foreach ($lproducts as $lproduct)
                    <div class="product product-style-2 equal-elem ">
                        <div class="product-thumnail">
                            <a href="{{route('product.details',['slug'=>$lproduct->slug])}}" title="{{$lproduct->name}}">
                                <figure><img src="{{asset('assets/images/products')}}/{{$lproduct->image}}" width="800" height="800" alt="{{$lproduct->name}}"></figure>
                            </a>
                        </div>
                        <div class="product-info">
                            <div id="course-wrap-category">
                                <a href="{{route('product.details',['slug'=>$lproduct->slug])}}" class="product-name text-nowrap"><span id="course_onsale"><b>{{$lproduct->name}}</b></span></a>
                            </div>
                            <div id="course-rating-students">
                                {{-- <div class="col-md-6"> --}}
                                    <div class="product-rating">
                                        <style>
                                            .color-gray{
                                                color: #e6e6e6 !important;
                                            }
                                        </style>
                                        @php
                                            $avgrating = 0;
                                        @endphp
                                        @foreach ($lproduct->orderItems->where('rstatus',1) as $orderItem)
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
                                {{-- </div> --}}
                                <div>
                                    <h6 class="fc-name">{{$lproduct->students}} students</h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="course_description-wrap">
                                        {{-- <h6 id="course_description-head">{!!$lproduct->short_description!!}<a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="product-name text-danger"><b>..Show Details</b></a></h6> --}}
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-5">
                                    <div class="wrap-price text-center"><span class="product-price text-center">&#2547; {{$lproduct->regular_price}}</span></div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                            <a href="#" class="btn add-to-cart" wire:click.prevent="store('{{$lproduct->id}}','{{$lproduct->name}}','{{$lproduct->regular_price}}')">Enroll Now</a>
                        </div>
                    </div>
                  @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--Product Categories-->

<div class="wrap-show-advance-info-box style-1" id="Product-categories">
<h3 class="title-box">Course Categories</h3>
{{-- <div class="wrap-top-banner">
    <a href="#" class="link-banner banner-effect-2">
        <figure><img src="{{asset('assets/images/fashion-accesories-banner.jpg')}}" width="1170" height="240" alt=""></figure>
    </a>
</div> --}}
<div class="wrap-products">
    <div class="wrap-product-tab tab-style-1">
        <div class="tab-control">
            @foreach ($categories as $key=>$category)
              <a href="#category_{{$category->id}}" class="tab-control-item {{$key==0 ? 'active' : ''}}">{{$category->name}}</a>
            @endforeach
        </div>
        <div class="tab-contents">
            @foreach ($categories as $key=>$category)
            <div class="tab-content-item {{$key==0 ? 'active':''}}" id="category_{{$category->id}}">
                <div class="wrap-products slide-carousel owl-carousel style-nav-1 equal-container"   data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"3"}}'>
                    @php
                        $c_products = DB::table('products')->where('category_id',$category->id)->get()->take($no_of_products);
                    @endphp
                        @foreach ($c_products as $c_product)
                        <div class="product product-style-2 equal-elem ">
                            <div class="product-thumnail">
                                <a href="{{route('product.details',['slug'=>$c_product->slug])}}" title="{{$c_product->name}}">
                                    <figure><img src="{{asset('assets/images/products')}}/{{$c_product->image}}" width="800" height="800" alt="{{$c_product->name}}"></figure>
                                </a>
                            </div>
                            <div class="product-info">
                                <div id="course-wrap-category">
                                    <a href="{{route('product.details',['slug'=>$c_product->slug])}}" class="product-name text-nowrap"><span id="course_onsale"><b>{{$c_product->name}}</b></span></a>
                                </div>
                                <div id="course-rating-students">
                                    {{-- <div class="col-md-6"> --}}
                                        <div class="product-rating">
                                            <style>
                                                .color-gray{
                                                    color: #e6e6e6 !important;
                                                }
                                            </style>
                                            @foreach ($sproducts as $sproduct)
                                                
                                            @endforeach
                                            @php
                                                $avgrating = 0;
                                            @endphp
                                            @foreach ($sproduct->orderItems->where('rstatus',1) as $orderItem)
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
                                    {{-- </div> --}}
                                    <div>
                                        <h6 class="fc-name">{{$c_product->students}} students</h6>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                         <div id="course_description-wrap">
                                            {{-- <h6 id="course_description-head">{!!$c_product->short_description!!}<a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="product-name text-danger"><b>..Show Details</b></a></h6> --}}
                                         </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-5">
                                        <div class="wrap-price"><span class="product-price">&#2547; {{$c_product->regular_price}}</span></div>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                                <a href="#" class="btn add-to-cart" wire:click.prevent="store('{{$c_product->id}}','{{$c_product->name}}','{{$c_product->regular_price}}')">Enroll Now</a>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                 @endforeach
            </div>
         </div>
     </div>
    </div>
</div>
</main>
