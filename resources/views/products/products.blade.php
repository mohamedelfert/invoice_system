@extends('layouts.master')
@section('title')
    {{$title}}
@endsection
@section('css')
    <!-- Internal Data table css -->
    <link href="{{URL::asset('assets/plugins/datatable/css/dataTables.bootstrap4.min.css')}}" rel="stylesheet" />
    <link href="{{URL::asset('assets/plugins/datatable/css/buttons.bootstrap4.min.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/plugins/datatable/css/responsive.bootstrap4.min.css')}}" rel="stylesheet" />
    <link href="{{URL::asset('assets/plugins/datatable/css/jquery.dataTables.min.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/plugins/datatable/css/responsive.dataTables.min.css')}}" rel="stylesheet">
    <link href="{{URL::asset('assets/plugins/select2/css/select2.min.css')}}" rel="stylesheet">
@endsection
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="my-auto">
            <div class="d-flex">
                <h4 class="content-title mb-0 my-auto">الاعدادات</h4><span class="text-muted mt-1 tx-13 mr-2 mb-0">/ المنتجات</span>
            </div>
        </div>
    </div>
    <!-- breadcrumb -->
@endsection
@section('content')

    @if(session()->has('errors'))
        <div class="alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{$error}}</li>
                @endforeach
            </ul>
        </div>
    @endif

{{--    @if (session()->has('exist'))--}}
{{--        <div class="alert alert-danger">--}}
{{--            {{session('exist')}}--}}
{{--            {{session()->forget('exist')}}--}}
{{--            <button type="button" class="close" data-dismiss="alert" aria-label="Close">--}}
{{--                <span aria-hidden="true">&times;</span>--}}
{{--            </button>--}}
{{--        </div>--}}
{{--    @endif--}}

    @if(session()->has('success'))
        <div class="alert alert-success">
            {{session()->get('success')}}
            {{session()->forget('success')}}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

            <!-- row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header pb-0">

                            @can('اضافه منتج')
                                <a class="modal-effect btn btn-success" data-effect="effect-scale" data-toggle="modal" href="#modaldemo8"><i class="mdi mdi-plus"></i> اضافة منتج </a>
                            @endcan

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table text-md-nowrap" id="example1">
                                    <thead class="text-center">
                                        <tr>
                                            <th class="wd-5p border-bottom-0">#</th>
                                            <th class="wd-20p border-bottom-0">اسم المنتج</th>
                                            <th class="wd-35p border-bottom-0">الوصف</th>
                                            <th class="wd-20p border-bottom-0">القسم</th>
                                            <th class="wd-20p border-bottom-0">العمليات</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $i = 1; ?>
                                    @foreach($all_products as $product)
                                        <tr>
                                            <td class="text-center">{{$i++}}</td>
                                            <td>{{$product->product_name}}</td>
                                            <td>{{$product->description}}</td>
                                            <td>{{$product->getSectionName->section_name}}</td>
                                            <td class="text-center">

                                                @can('تعديل منتج')
                                                    <a class="modal-effect btn btn-sm btn-info" data-effect="effect-scale"
                                                       data-id="{{ $product->id }}" data-product_name="{{ $product->product_name }}"
                                                       data-description="{{ $product->description }}" data-section_id="{{ $product->section_id }}"
                                                       data-toggle="modal" href="#exampleModal2" title="تعديل"><i class="las la-pen"></i>
                                                    </a>
                                                @endcan
                                                @can('حذف منتج')
                                                    <a class="modal-effect btn btn-sm btn-danger" data-effect="effect-scale"
                                                       data-id="{{ $product->id }}" data-product_name="{{ $product->product_name }}"
                                                       data-toggle="modal" href="#modaldemo9" title="حذف"><i class="las la-trash"></i>
                                                    </a>
                                                @endcan
                                                {{--{!! Form::open(['url'=>'products/'.$product->id,'method'=>'delete','style'=>'display:inline']) !!}--}}
                                                {{--{!! Form::text('id',$product->id,['hidden']) !!}--}}
                                                {{--{!! Form::submit('Delete',['class'=>'btn btn-danger small']) !!}--}}
                                                {{--{!! Form::close() !!}--}}
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- This Is For Add New Product -->
                <div class="modal" id="modaldemo8">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content modal-content-demo">
                            <div class="modal-header">
                                <h6 class="modal-title">اضافة منتج</h6>
                                <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <form action="{{ route('products.store') }}" method="post">
                                    {{ csrf_field() }}

                                    <div class="form-group">
                                        <label for="product_name">اسم المنتج</label>
                                        <input type="text" class="form-control" id="product_name" name="product_name" value="{{old('product_name')}}" placeholder="Product Name Here!">
                                    </div>

                                    <div class="form-group">
                                        <label for="section_id">القسم</label>
                                        <select class="form-control select2 " name="section_id" id="section_id" >
                                            <option value="" selected disabled>اختر القسم</option>
                                            @foreach($sections as $section)
                                                <option value="{{$section->id}}">{{$section->section_name}}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="description">الوصف</label>
                                        <textarea class="form-control" name="description" id="description" rows="3">{{old('description')}}</textarea>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success">تاكيد</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- This Is For Add New Section -->

                <!-- edit Product -->
                <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">تعديل المنتج</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="products/update" method="post">
                                {{ method_field('patch') }}
                                {{ csrf_field() }}
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input type="hidden" name="id" id="id" value="">
                                        <label for="recipient-name" class="col-form-label">اسم المنتج:</label>
                                        <input class="form-control" name="product_name" id="product_name" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label for="section_id">القسم:</label>
                                        <select class="form-control select2 " name="section_id" id="section_id" >
                                            <option value="" selected disabled>اختر القسم</option>
                                            @foreach($sections as $section)
                                                <option value="{{$section->id}}">{{$section->section_name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">الوصف:</label>
                                        <textarea class="form-control" id="description" name="description"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">تاكيد</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- edit Product -->

                <!-- delete Product -->
                <div class="modal fade" id="modaldemo9">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content modal-content-demo">
                            <div class="modal-header">
                                <h6 class="modal-title">حذف المنتج</h6>
                                <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <form action="products/destroy" method="post">
                                {{ method_field('delete') }}
                                {{ csrf_field() }}
                                <div class="modal-body">
                                    <p>هل انت متاكد من عملية الحذف ؟</p><br>
                                    <input type="hidden" name="id" id="id" value="">
                                    <input class="form-control" name="product_name" id="product_name" type="text" readonly>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                                    <button type="submit" class="btn btn-danger">تاكيد</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- delete Product -->

            </div>
            <!-- row closed -->
        </div>
        <!-- Container closed -->
    </div>
    <!-- main-content closed -->
@endsection
@section('js')
    <!-- Internal Data tables -->
    <script src="{{URL::asset('assets/plugins/datatable/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/dataTables.dataTables.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/responsive.dataTables.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/jquery.dataTables.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/dataTables.bootstrap4.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/buttons.bootstrap4.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/jszip.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/pdfmake.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/vfs_fonts.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/buttons.html5.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/buttons.print.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/buttons.colVis.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/datatable/js/responsive.bootstrap4.min.js')}}"></script>
    <!--Internal  Datatable js -->
    <script src="{{URL::asset('assets/js/table-data.js')}}"></script>
    <!-- Internal Modal js-->
    <script src="{{URL::asset('assets/js/modal.js')}}"></script>

    <!-- This For Update Form -->
    <script>
        $('#exampleModal2').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget)
            var id = button.data('id')
            var product_name = button.data('product_name')
            var section_id = button.data('section_id')
            var description = button.data('description')
            var modal = $(this)
            modal.find('.modal-body #id').val(id);
            modal.find('.modal-body #product_name').val(product_name);
            modal.find('.modal-body #section_id').val(section_id);
            modal.find('.modal-body #description').val(description);
        })
    </script>
    <!-- This For Update Form -->
    <!-- This For Delete Form -->
    <script>
        $('#modaldemo9').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget)
            var id = button.data('id')
            var product_name = button.data('product_name')
            var modal = $(this)
            modal.find('.modal-body #id').val(id);
            modal.find('.modal-body #product_name').val(product_name);
        })
    </script>
    <!-- This For Delete Form -->
@endsection
