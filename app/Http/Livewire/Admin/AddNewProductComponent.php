<?php

namespace App\Http\Livewire\Admin;

use App\Models\AttributeValue;
use App\Models\category;
use App\Models\product;
use App\Models\ProductAttribute;
use App\Models\subcategory;
use Carbon\Carbon;
use Illuminate\Contracts\Session\Session;
use Livewire\Component;
use illuminate\Support\Str;
use Livewire\WithFileUploads;

class AddNewProductComponent extends Component
{

    use WithFileUploads;

    public $name;
    public $slug;
    public $short_description;
    public $description;
    public $regular_price;
    public $sale_price;
    public $students;
    public $instructor_name;
    public $instrucotr_profession;
    public $instructor_details;
    public $instructor_image;
    public $image;
    public $images;
    public $category_id;
    public $scategory_id;

    public $attr;
    public $inputs = [];
    public $attribute_arr = [];
    public $attribute_values;


    // add attribute
    public function add(){
        if(!in_array($this->attr,$this->attribute_arr)){
            array_push($this->inputs,$this->attr);
            array_push($this->attribute_arr,$this->attr);
        }
    }
    //remove attribute
    public function remove($attr){
        unset($this->inputs[$attr]);
    }

    public function generateSlug(){
        $this->slug = Str::slug($this->name,'-');
    }

    public function updated($fields){
        $this->validateOnly($fields,[
            'name'=>'required',
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'numeric',
            'students'=>'required|numeric',
            'instructor_name'=>'required',
            'instrucotr_profession'=>'required',
            // 'instructor_details'=>'required',
            'instructor_image'=>'required|mimes:jpg,jpeg,png',
            'image'=>'required|mimes:jpg,jpeg,png',
            'category_id'=>'required'
        ]);
    }

    public function addProduct(){

        $this->validate([
            'name'=>'required',
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'numeric',
            'students'=>'required|numeric',
            'instructor_name'=>'required',
            'instrucotr_profession'=>'required',
            // 'instructor_details'=>'required',
            'instructor_image'=>'required|mimes:jpg,jpeg,png',
            'image'=>'required|mimes:jpg,jpeg,png',
            'category_id'=>'required'
        ]);

        $product = new product();
        $product->name = $this->name;
        $product->slug = $this->slug;
        $product->short_description = $this->short_description;
        $product->description = $this->description;
        $product->regular_price = $this->regular_price;
        $product->sale_price = $this->sale_price;
        $product->students = $this->students;
        $product->instructor_name = $this->instructor_name;
        $product->instrucotr_profession = $this->instrucotr_profession;
        $product->instructor_details = $this->instructor_details;
        
        $instructorImageName = Carbon::now()->timestamp.'.'.$this->instructor_image->extension();
        $this->instructor_image->storeAs('instructors', $instructorImageName);
        $product->instructor_image = $instructorImageName;

        $imageName = Carbon::now()->timestamp.'.'.$this->image->extension();
        $this->image->storeAs('products', $imageName);
        $product->image = $imageName;

        if($this->images){
            $imagesname = '';
            foreach($this->images as $key=>$image){
                $imgName = Carbon::now()->timestamp.$key.'.'.$image->extension();
                $image->storeAs('products',$imgName);
                $imagesname = $imagesname . ',' .$imgName;
            }
            $product->images = $imagesname;
        }

        $product->category_id = $this->category_id;
        if($this->scategory_id){
            $product->subcategory_id = $this->scategory_id;
        }

        $product->save();

        if($this->attr){
        foreach($this->attribute_values as $key => $attribute_value){
            $values = explode(",",$attribute_value);
            foreach($values as $value){
                $attr_value = new AttributeValue();
                $attr_value->product_attribute_id = $key;
                $attr_value->value = $value;
                $attr_value->product_id = $product->id;
                $attr_value->save();
            }
        }
    }
        Session()->flash('message','One Product has been added Successfully');
    }

    public function changeSubcategory(){
        $this->scategory_id =0;
    }
    public function render()
    {
        $categories = category::all();
        $scategories = subcategory::where('category_id',$this->category_id)->get();
        $pattributes = ProductAttribute::all();
        return view('livewire.admin.add-new-product-component',['categories'=>$categories,'scategories'=>$scategories,'pattributes'=>$pattributes])->layout('layouts.admin');
    }
}
