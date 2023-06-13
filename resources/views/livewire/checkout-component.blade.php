<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Kaizen IT Ltd">
    <title>Kaizen Institute</title>
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('admin/images/logo-fav.jpeg')}}">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        #sslczPayBtn:before{
            background: none !important;
        }
        #sslczPayBtn{
            background: #0EB582 !important;
        }
        #sslczPayBtn:after{
            background: #0EB582 !important;
        }
    </style>
</head>
<body class="bg-light">
<div class="container">
    <div class="py-5 text-center">
        <p>Pay with Bkash/Nagad/Rocket Credit/Debit card with any Bank you need</p>

        {{-- <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. We have provided this
            sample form for understanding EasyCheckout (Popup) Payment integration with SSLCommerz.</p> --}}
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            
        </div>
        <div class="col-md-4 order-md-1">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
            </h4>
            @if (Cart::instance('cart')->count() > 0)
            <ul class="list-group mb-3">
                @foreach (Cart::instance('cart')->content() as $item)
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Course name</h6>
                       {{-- <figure><img src="{{asset('assets/images/products')}}/{{$item->image}}" alt="{{$item->name}}" class="img-fluid" width="50" height="50"></figure>--}}
                        <small class="text-muted">{{$item->name}}</small>
                    </div>
                    {{--<span class="text-muted"><del><span class="text-danger">&#2547;</span>{{$item->regular_price}}</del></span>
                    <span class="text-muted"><span class="text-danger">&#2547;</span>{{$item->sale_price}}</span>--}}
                </li>
            
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (BDT)</span>
                    @if (Session::has('checkout'))
                        <p class="summary-info total-info "><span class="title"></span><b class="index"><span class="text-danger">&#2547;</span>{{Session::get('checkout')['total']}}</b></p>
                    @else
                        <strong><b class="index"><span class="text-danger">&#2547;</span>{{Cart::instance('cart')->total()}}</b></strong>
                    @endif
                </li>
                @endforeach
            </ul>
            @endif
            <form method="POST" class="needs-validation" novalidate>
                {{-- <hr class="mb-4"> --}}
                <div class="d-flex justify-content-center">
                    <button class="btn btn-success btn-sm" id="sslczPayBtn"
                        token="if you have any token validation"
                        postdata="your javascript arrays or objects which requires in backend"
                        order="If you already have the transaction generated for current order"
                        endpoint="{{ url('/pay-via-ajax') }}"> Pay Now
                </button>
                </div>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; <?php echo date("Y");?> Kaizen IT LTD</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>


<!-- If you want to use the popup integration, -->
<script>
    var obj = {};
    obj.cus_name = $('#customer_name').val();
    obj.cus_phone = $('#mobile').val();
    obj.cus_email = $('#email').val();
    obj.cus_addr1 = $('#address').val();
    obj.amount = $('#total_amount').val();

    $('#sslczPayBtn').prop('postdata', obj);

    
    (function (window, document) {
        var loader = function () {
            var script = document.createElement("script"), tag = document.getElementsByTagName("script")[0];
            script.src = "https://sandbox.sslcommerz.com/embed.min.js?" + Math.random().toString(36).substring(7);
            tag.parentNode.insertBefore(script, tag);
        };

        window.addEventListener ? window.addEventListener("load", loader, false) : window.attachEvent("onload", loader);
    })(window, document);
</script>
</body>
</html>
