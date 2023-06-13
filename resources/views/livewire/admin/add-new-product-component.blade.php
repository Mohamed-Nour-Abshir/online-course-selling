<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8 grid-margin stretch-card">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Add New Course</p>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.products')}}" class="btn btn-success pull-right">All Courses</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="addProduct" class="forms-sample" enctype="multipart/form-data">
                          <div class="form-group">
                              <label>Course Name</label>
                                <input type="text" class="form-control input-md" placeholder="Product Name" wire:model="name" wire:keyup="generateSlug">
                                @error('name')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                              <label>Course Slug</label>
                                <input type="text" class="form-control input-md" placeholder="Product Slug" wire:model="slug">
                                @error('slug')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                              <label>Short Description</label>
                              <div wire:ignore>
                                <textarea type="text" id="short_description" class="form-control input-md" rows="5" placeholder="Short Description" wire:model="short_description"></textarea>
                                @error('short_description')<span class="text-danger">{{$message}}</span> @enderror <br>
                              </div>
                          </div>
                          <div class="form-group">
                              <label>Course Details</label>
                              <div wire:ignore>
                                <textarea type="text" id="description" class="form-control input-md" rows="5" placeholder="Description" wire:model="description"></textarea>
                                @error('description')<span class="text-danger">{{$message}}</span> @enderror <br>
                              </div>
                          </div>
                          <div class="form-group">
                            <label>Course Regular Price</label>
                              <input type="text" class="form-control input-md" placeholder="Regular Price" wire:model="regular_price">
                              @error('regular_price')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                          <div class="form-group">
                            <label>Course Sale Price</label>
                              <input type="text" class="form-control input-md" placeholder="Sale Price" wire:model="sale_price">
                              @error('sale_price')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Students for this course</label>
                              <input type="text" class="form-control input-md" placeholder="Students Number" wire:model="students">
                              @error('students')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                        <div class="form-group">
                            <label>Instructor Name</label>
                              <input type="text" class="form-control input-md" placeholder="Name of the Instructor of this course" wire:model="instructor_name">
                              @error('instructor_name')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                          <div class="form-group">
                            <label>Instrucotr Profession</label>
                              <input type="text" class="form-control input-md" placeholder="Profession of the instructor of this course" wire:model="instrucotr_profession">
                              @error('instrucotr_profession')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                        <div class="form-group">
                          <label>Instuctor Details</label>
                          <div wire:ignore>
                            <textarea type="text" id="instructor_details" class="form-control input-md" rows="5" placeholder="Instuctor Details" wire:model="instructor_details"></textarea>
                            @error('instructor_details')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                        </div>
                          <div class="form-group">
                            <label>Instructor Image</label>
                              <input type="file" class="form-control input-file" wire:model="instructor_image">
                                @if ($instructor_image)
                                    <img src="{{ $instructor_image->temporaryUrl() }}" width="120">
                                @endif
                                @error('instructor_image')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>Course Image</label>
                              <input type="file" class="form-control input-file" wire:model="image">
                                @if ($image)
                                    <img src="{{ $image->temporaryUrl() }}" width="120">
                                @endif
                                @error('image')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>Upload Gallery</label>
                              <input type="file" class="form-control input-file" wire:model="images" multiple>
                                @if ($images)
                                    @foreach ($images as $image)
                                        <img src="{{ $image->temporaryUrl() }}" width="120">
                                    @endforeach
                                @endif
                                @error('images')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>Course Category</label>
                              <select name="" id="" class="form-control" wire:model="category_id" wire:change="changeSubcategory">
                                  <option value="">Select Category</option>
                                  @foreach ($categories as $category)
                                    <option value="{{$category->id}}">{{$category->name}}</option>
                                  @endforeach
                              </select>
                              @error('category_id')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>Course SubCategory</label>
                              <select name="" id="" class="form-control" wire:model="scategory_id">
                                  <option value="0">Select SubCategory</option>
                                  @foreach ($scategories as $scategory)
                                    <option value="{{$scategory->id}}">{{$scategory->name}}</option>
                                  @endforeach
                              </select>
                              @error('scategory_id')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>


                          <div class="form-group">
                            <label>Course Requirements</label>
                              <select name="" id="" class="form-control" wire:model="attr">
                                  <option value="0">Select Attribute</option>
                                  @foreach ($pattributes as $pattribute)
                                    <option value="{{$pattribute->id}}">{{$pattribute->name}}</option>
                                  @endforeach
                              </select>
                            <div class="col-md-1 mt-2">
                                <button type="button" class="btn btn-info btn-sm" wire:click.prevent="add">Add</button>
                            </div>
                          </div>

                          @foreach ($inputs as $key => $value)
                            <div class="form-group">
                                <label>{{$pattributes->where('id',$attribute_arr[$key])->first()->name}}</label>
                                <input type="text" class="form-control input-md" placeholder="{{$pattributes->where('id',$attribute_arr[$key])->first()->name}}" wire:model="attribute_values.{{$value}}">
                                <div class="col-md-1 mt-2">
                                    <button type="button" class="btn btn-danger btn-sm" wire:click.prevent="remove({{$key}})">Remove</button>
                                </div>
                            </div>
                          @endforeach

                          <div class="form-group text-center">
                             <button type="submit" class="btn btn-primary text-center">Submit</button>
                            </div>
                          </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
    $(function(){
        tinymce.init({
            selector:'#short_description',
            setup:function(editor) {
                editor.on('change',function(e){
                    tinyMCE.triggerSave();
                    var sd_data = $('#short_description').val();
                    @this.set('short_description', sd_data);
                });
            }
        });

        tinymce.init({
            selector:'#description',
            setup:function(editor) {
                editor.on('change',function(e){
                    tinyMCE.triggerSave();
                    var d_data = $('#description').val();
                    @this.set('description', d_data);
                });
            }
        });

        tinymce.init({
            selector:'#instructor_details',
            setup:function(editor) {
                editor.on('change',function(e){
                    tinyMCE.triggerSave();
                    var d_data = $('#instructor_details').val();
                    @this.set('instructor_details', d_data);
                });
            }
        })
    });
</script>
@endpush




