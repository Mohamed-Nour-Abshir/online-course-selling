<?php

namespace App\Http\Livewire;

use App\Models\product;
use App\Models\Sale;
use Livewire\Component;
use Livewire\WithPagination;
use Cart;
use App\Models\category;
use Illuminate\Support\Facades\Auth;

class ShopComponent extends Component
{
    public $sorting;
    public $pageSize;

    public $min_price;
    public $max_price;

    public function mount(){
        $this->sorting ="default";
        $this->pageSize = 12;

        $this->min_price = 1;
        $this->max_price = 1000;
    }
// add product to cart list
    public function store($product_id, $product_name, $product_price){
        $product = product::find(Cart::instance('cart')->product_id);
        $duplicateItems = Cart::search(function ($cartItem, $rowId) use ($product) {
            return $cartItem->id === $cartItem->id;
        });
        if ($duplicateItems->count() > 0) {
            return redirect()->back()->with('message', 'Course is already added to the cart.');
        }
        else{
            Cart::instance('cart')->add($product_id,$product_name, 1, $product_price)->associate('App\Models\Product');
            session()->flash('success_message', 'Course added to the Cart');
            return redirect()->route('product.cart');
        }
     
    }
    // add product to wish-list
    public function addToWishlist($product_id, $product_name, $product_price){
        Cart::instance('wishlist')->add($product_id,$product_name, 1, $product_price)->associate('App\Models\Product');
        $this->emitTo('wishlist-count-component','refreshComponent');
    }
    // remove product from wishlist
    public function removeFromWishlist($product_id){
        foreach(Cart::instance('wishlist')->content() as $witem){
            if($witem->id == $product_id){
                Cart::instance('wishlist')->remove($witem->rowId);
                $this->emitTo('wishlist-count-component','refreshComponent');
                return;
            }
        }
    }
    // use WithPagination;
    public function render()
    {
        if($this->sorting == 'date'){
           $products = product::orderBy('created_at','DESC')->paginate($this->pageSize);
        }
        else if($this->sorting == 'price'){
            $products = product::orderBy('regular_price','ASC')->paginate($this->pageSize);
         }
         else if($this->sorting == 'price-desc'){
            $products = product::orderBy('regular_price','DESC')->paginate($this->pageSize);
         }
         else{
            $products = product::paginate($this->pageSize);
            // $products = product::paginate($this->pageSize);
         }

         $categories = category::all();

         if(Auth::check()){
            Cart::instance('cart')->store(Auth::user()->email);
            Cart::instance('wishlist')->store(Auth::user()->email);
        }
        $sale = Sale::find(1);
        $popular_products = product::inRandomOrder()->limit(4)->get();
        return view('livewire.shop-component',['products'=>$products, 'categories'=>$categories,'popular_products'=>$popular_products, 'sale'=>$sale])->layout('layouts.home');
    }
}
