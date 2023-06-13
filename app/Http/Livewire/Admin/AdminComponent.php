<?php

namespace App\Http\Livewire\Admin;

use App\Models\HomeSlider;
use App\Models\Order;
use App\Models\User;
use App\Models\Visitor;
use Carbon\Carbon;
use Livewire\Component;

class AdminComponent extends Component
{
    public function render()
    {
        // $ordders = Order::orderBy('created_at','DESC')->paginate(10);
        $ordders = Order::orderBy('id','DESC')->paginate(10);
        $totalSales = Order::where('status','Processing')->orWhere('status','Complete')->count();
        $totalRevenue = Order::where('status','Processing')->orWhere('status','Complete')->sum('amount');
        $todaySales = Order::where('status','Processing')->orWhere('status','Complete')->whereDate('created_at',Carbon::today())->count();
        $todayRevenue = Order::where('status','Processing')->orWhere('status','Complete')->whereDate('created_at',Carbon::today())->sum('amount');

        // Total visitors 
        $totalVisitors = Visitor::count();
        // today visitors 
        $today = Carbon::today();
        $startDate = $today->copy()->startOfDay();
        $endDate = $today->copy()->endOfDay();
        $todayVisitors = Visitor::whereBetween('visited_at', [$startDate, $endDate])->count();
        // last month visitors
        $lastMonth = Carbon::now()->subMonth();
        $startDate = $lastMonth->copy()->startOfMonth();
        $endDate = $lastMonth->copy()->endOfMonth();
        $lastMonthvisitors = Visitor::whereBetween('visited_at', [$startDate, $endDate])->count();
        
        // last year visitors 
        $lastYear = Carbon::now()->subYear();
        $startDate = $lastYear->copy()->startOfYear();
        $endDate = $lastYear->copy()->endOfYear();
        $lastYearvisitors = Visitor::whereBetween('visited_at', [$startDate, $endDate])->count();


        return view('livewire.admin.admin-component',['orders'=>$ordders,'totalSales'=>$totalSales,'totalRevenue'=>$totalRevenue,'todaySales'=>$todaySales,'todayRevenue'=>$todayRevenue,'todayVisitors'=>$todayVisitors,'totalVisitors'=>$totalVisitors,'lastMonthvisitors'=>$lastMonthvisitors,'lastYearvisitors'=>$lastYearvisitors])->layout('layouts.admin');  
    }
}
