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
            <!-- row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header pb-0">
                            <button type="button" class="btn btn-success"><i class="mdi mdi-plus"></i> اضافه فاتوره </button>
                            <button type="button" class="btn btn-secondary"><i class="mdi mdi-archive"></i> نقل الي الارشيف </button>
                            <button type="button" class="btn btn-danger"><i class="mdi mdi-delete"></i> حذف </button>
                            <button type="button" class="btn btn-primary"><i class="mdi mdi-attachment"></i> تصدير Excel </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table text-md-nowrap" id="example1">
                                    <thead>
                                        <tr>
                                            <th class="wd-5p border-bottom-0">#</th>
                                            <th class="wd-15p border-bottom-0">رقم الفاتوره</th>
                                            <th class="wd-20p border-bottom-0">تاريخ الفاتوره</th>
                                            <th class="wd-15p border-bottom-0">تاريخ الاستحقاق</th>
                                            <th class="wd-25p border-bottom-0">المنتج</th>
                                            <th class="wd-15p border-bottom-0">القسم</th>
                                            <th class="wd-15p border-bottom-0">الخصم</th>
                                            <th class="wd-15p border-bottom-0">نسبه الضريبه</th>
                                            <th class="wd-15p border-bottom-0">قيمه الضريبه</th>
                                            <th class="wd-15p border-bottom-0">الاجمالي</th>
                                            <th class="wd-25p border-bottom-0">الحاله</th>
                                            <th class="wd-25p border-bottom-0">ملاحظات</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>121564545</td>
                                            <td>15/01/2021</td>
                                            <td>18/05/2021</td>
                                            <td>لعب اطفال (سياره)</td>
                                            <td>العاب</td>
                                            <td>500$</td>
                                            <td>10%</td>
                                            <td>1000$</td>
                                            <td>3500$</td>
                                            <td>غير مدفوعه</td>
                                            <td>لم يتم سداد الفاتوره</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>87656456</td>
                                            <td>22/07/2021</td>
                                            <td>18/09/2021</td>
                                            <td>لعب اطفال (سياره)</td>
                                            <td>العاب</td>
                                            <td>200$</td>
                                            <td>15%</td>
                                            <td>500$</td>
                                            <td>3000$</td>
                                            <td>مدفوعه</td>
                                            <td></td>
                                        </tr>

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
