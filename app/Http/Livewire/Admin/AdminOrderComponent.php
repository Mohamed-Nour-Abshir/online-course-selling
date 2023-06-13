<?php

namespace App\Http\Livewire\Admin;
use Carbon\Carbon;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class AdminOrderComponent extends Component
{
    public function updateOrderStatus($order_id,$status){
        $order = Order::find($order_id);
        $order->order_status = $status;
        if($status == "ordered"){
            $order->created_at = Carbon::now();
        }
        elseif($status == "canceled"){
            $order->cancaled_date = DB::raw('CURRENT_DATE');
        }
        $order->save();
        session()->flash('order_message','order Satus has been updated successfully!');
    }
    public function render()
    {
        $orders = Order::orderBy('created_at','DESC')->paginate(12);
        return view('livewire.admin.admin-order-component',['orders'=>$orders])->layout('layouts.admin');
    }
}
