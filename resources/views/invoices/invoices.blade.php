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
                <h4 class="content-title mb-0 my-auto">الفواتير</h4><span class="text-muted mt-1 tx-13 mr-2 mb-0">/ قائمه الفواتير</span>
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
                            <a class="btn btn-success" href="{{url('invoices/create')}}"><i class="mdi mdi-plus"></i> اضافه فاتوره </a>
                            <a class="btn btn-secondary"><i class="mdi mdi-archive"></i> نقل الي الارشيف </a>
                            <a class="btn btn-danger"><i class="mdi mdi-delete"></i> حذف </a>
                            <a class="btn btn-primary"><i class="mdi mdi-attachment"></i> تصدير Excel </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table text-md-nowrap" id="example1">
                                    <thead>
                                        <tr>
                                            <th class="wd-5p border-bottom-0">#</th>
                                            <th class="wd-10p border-bottom-0">رقم الفاتوره</th>
                                            <th class="wd-10p border-bottom-0">تاريخ الفاتوره</th>
                                            <th class="wd-10p border-bottom-0">تاريخ الاستحقاق</th>
                                            <th class="wd-10p border-bottom-0">المنتج</th>
                                            <th class="wd-10p border-bottom-0">القسم</th>
                                            <th class="wd-5p border-bottom-0">الخصم</th>
                                            <th class="wd-5p border-bottom-0">نسبه الضريبه</th>
                                            <th class="wd-5p border-bottom-0">قيمه الضريبه</th>
                                            <th class="wd-5p border-bottom-0">الاجمالي</th>
                                            <th class="wd-10p border-bottom-0">الحاله</th>
                                            <th class="wd-30p border-bottom-0">ملاحظات</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $i = 1; ?>
                                    @foreach($all_invoices as $invoice)
                                        <tr>
                                            <td>{{$i++}}</td>
                                            <td>{{$invoice->invoice_number}}</td>
                                            <td>{{$invoice->invoice_date}}</td>
                                            <td>{{$invoice->due_date}}</td>
                                            <td>{{$invoice->getProductName->product_name}}</td>
                                            <td>{{$invoice->getSectionName->section_name}}</td>
                                            <td>{{$invoice->discount}}</td>
                                            <td>{{$invoice->rate_vat}}</td>
                                            <td>{{$invoice->value_vat}}</td>
                                            <td>{{$invoice->total}}</td>
                                            <td>{{$invoice->status}}</td>
                                            <td>{{$invoice->note}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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
@endsection
