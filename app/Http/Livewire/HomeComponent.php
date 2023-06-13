<?php

namespace App\Http\Livewire;
use App\Models\Sale;
use App\Models\product;
use Livewire\Component;
use App\Models\category;
use App\Models\HomeSlider;
use App\Models\HomeCategory;
use App\Models\Visitor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class HomeComponent extends Component
{
    // public $slug;
    // public function mount($slug){
    //     $this->slug = $slug;
    // }
    public function render(Request $request)
    {
        $sliders = HomeSlider::where('status',1)->get();
        
        $model = HomeSlider::where('status',1)->first();
        $visitor = Visitor::create([
            'visitable_type' => get_class($model),
            'visitable_id' => $model->id,
            'visitor_ip' => $request->ip(),
            'visited_at' => now(),
        ]);
        
        $lproducts = product::orderBy('created_at','DESC')->get()->take(8);
        $category = HomeCategory::find(1);
        $cats = explode(',',$category->sel_categories);
        $categories = category::whereIn('id',$cats)->get();
        $no_of_products = $category->no_of_products;
        $sproducts = product::where('sale_price','>',0)->inRandomOrder()->get()->take(8);
        $sale = Sale::find(1);
        $c_products = DB::table('products')->where('category_id',$category->id)->get()->take($no_of_products);

        if(Auth::check()){
            Cart::instance('cart')->restore(Auth::user()->email);
            Cart::instance('wishlist')->restore(Auth::user()->email);
        }
        return view('livewire.home-component',['sliders'=>$sliders,'lproducts'=>$lproducts,'sproducts'=>$sproducts,'sale'=>$sale,'categories' => $categories,'no_of_products' =>$no_of_products,['c_products'=>$c_products]])->layout('layouts.home');
    }
}
