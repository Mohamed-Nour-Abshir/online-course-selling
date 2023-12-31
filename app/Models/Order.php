<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = "orders";

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function orderItems(){
        return $this->hasMany(OrderItem::class);
    }

    public function shipping(){
        return $this->hasOne(Shipping::class);
    }

    public function transactions(){
        return $this->hasOne(Transaction::class);
    }

    public function courseVideos()
    {
        return $this->hasManyThrough(
            UploadCourseVideo::class,
            OrderItem::class,
            'order_id',
            'course_id',
            'id',
            'product_id'
        );
    }


}
