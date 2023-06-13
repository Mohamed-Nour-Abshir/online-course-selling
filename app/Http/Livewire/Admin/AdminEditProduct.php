<?php

namespace App\Http\Livewire\Admin;

use App\Models\AttributeValue;
use App\Models\category;
use App\Models\product;
use App\Models\ProductAttribute;
use App\Models\subcategory;
use Attribute;
use Livewire\Component;
use illuminate\Support\Str;
use Carbon\Carbon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Livewire\WithFileUploads;
class AdminEditProduct extends Component
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
    public $instructor_image;
    public $newinstructor_image;
    public $instructor_details;
    public $image;
    public $newimage;
    public $category_id;
    public $product_id;

    public $images;
    public $newimages;
    public $scategory_id;

    public $attr;
    public $inputs = [];
    public $attribute_arr = [];
    public $attribute_values = [];

    public function mount($product_slug){
        $product = product::where('slug',$product_slug)->first();

        $this->name = $product->name;
        $this->slug = $product->slug;
        $this->short_description = $product->short_description;
        $this->description = $product->description;
        $this->regular_price = $product->regular_price;
        $this->sale_price = $product->sale_price;
        $this->students = $product->students;
        $this->instructor_name = $product->instructor_name;
        $this->instrucotr_profession = $product->instrucotr_profession;
        $this->instructor_details = $product->instructor_details;
        $this->instructor_image = $product->instructor_image;
        $this->image = $product->image;
        $this->images = explode(",",$product->images);
        $this->category_id = $product->category_id;
        $this->scategory_id = $product->subcategory_id;
        $this->product_id = $product->id;
        $this->inputs = $product->attributeValues->where('product_id',$product->id)->unique('product_attribute_id')->pluck('product_attribute_id');
        $this->attribute_arr = $product->attributeValues->where('product_id',$product->id)->unique('product_attribute_id')->pluck('product_attribute_id');

        foreach($this->attribute_arr as $a_arr){
            $allAttributeValue = AttributeValue::where('product_id',$product->id)->where('product_attribute_id',$a_arr)->get()->pluck('value');
            $valueString ='';
            foreach($allAttributeValue as $value){
                $valueString = $valueString . $value . ",";
            }
            $this->attribute_values[$a_arr] = rtrim($valueString,",");
        }
    }
    //add attribute-input
    public function add(){
        if(!$this->attribute_arr->contains($this->attr)){
            $this->inputs->push($this->attr);
            $this->attribute_arr->push($this->attr);
        }
    }
    // remove input-attribues
    public function remove($attr){
        unset($this->inputs[$attr]);
    }
    // generate slug
    public function generateSlug(){
        $this->slug = Str::slug($this->name,'-');
    }
    //validation
    public function updated($fields){
        $this->validateOnly($fields,[
            'name'=>'required',
            'slug'=>'required',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'students'=>'required|numeric',
            'instructor_name'=>'required',
            'instrucotr_profession'=>'required',
            'instructor_details'=>'required',
            'newinstructor_image'=>'required|mimes:jpg,jpeg,png',
            'newimage'=>'required|mimes:jpg,jpeg,png',
            'category_id'=>'required'
        ]);
        if($this->newimage){
            $this->validateOnly($fields,[
                'newimage'=>'required|mimes:jpg,jpeg,png'
            ]);
        }
    }

    public function updateProduct(){
        $this->validate([
            'name'=>'required',
            'slug'=>'required',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'students'=>'required|numeric',
            'instructor_name'=>'required',
            'instrucotr_profession'=>'required',
            'instructor_details'=>'required',
            'category_id'=>'required'
        ]);
        if($this->newimage){
            $this->validate([
                'newimage'=>'required|mimes:jpg,jpeg,png'
            ]);
        }
        if($this->newinstructor_image){
            $this->validate([
                'newinstructor_image'=>'required|mimes:jpg,jpeg,png'
            ]);
        }

        $product = product::find($this->product_id);
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

        if($this->newinstructor_image){
            unlink('assets/images/instructors'.'/'.$product->instructor_image);
            $instructorimageName = Carbon::now()->timestamp.'.'.$this->newinstructor_image->extension();
            $this->newinstructor_image->storeAs('instructors', $instructorimageName);
            $product->instructor_image = $instructorimageName;
        }

        if($this->newimage){
            unlink('assets/images/products'.'/'.$product->image);
            $imageName = Carbon::now()->timestamp.'.'.$this->newimage->extension();
            $this->newimage->storeAs('products', $imageName);
            $product->image = $imageName;
        }

        if($this->newimages){
            if($product->images){
                $images = explode(",",$product->images);
                foreach($images as $image){
                    if($image){
                        unlink('assets/images/products'.'/'.$image);
                    }
                }
            }
            $imagesname = '';
            foreach($this->newimages as $key=>$image){
                $imageName = Carbon::now()->timestamp . $key . '.' . $image->extension();
                $image->storeAs('products',$imageName);
                $imagesname = $imagesname . ',' . $imageName;
            }
            $product->images = $imagesname;
        }
        $product->category_id = $this->category_id;
        if($this->scategory_id){
            $product->subcategory_id = $this->scategory_id;
        }
        $product->save();

        AttributeValue::where('product_id',$product->id)->delete();
        foreach($this->attribute_values as $key=>$attribute_value){
            $values = explode(",",$attribute_value);
            foreach($values as $value){
                $attr_value = new AttributeValue();
                $attr_value->product_attribute_id = $key;
                $attr_value->value = $value;
                $attr_value->product_id = $product->id;
                $attr_value->save();
            }
        }
        Session()->flash('message','One Product has been Updated Successfully');
    }
    public function changeSubcategory(){
        $this->scategory_id =0;
    }
    public function render()
    {
        $categories = category::all();
        $scategories = subcategory::where('category_id',$this->category_id)->get();
        $pattributes = ProductAttribute::all();
        return view('livewire.admin.admin-edit-product',['categories'=>$categories,'scategories'=>$scategories,'pattributes'=>$pattributes])->layout('layouts.admin');
    }
}
