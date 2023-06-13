<?php

namespace App\Http\Livewire;

use App\Models\Order;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class ThankyouComponent extends Component
{
    public function render()
    {
        // $orders = Order::orderBy('created_at','DESC')->where('user_id',Auth::user()->id)->get()->take(10);
        return view('livewire.thankyou-component')->layout('layouts.home');
    }
}
