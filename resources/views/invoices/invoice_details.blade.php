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
                <h4 class="content-title mb-0 my-auto">الفواتير</h4><span class="text-muted mt-1 tx-13 mr-2 mb-0">/ تفاصيل الفاتوره</span>
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
            <div class="row row-sm">
                <div class="col-xl-12">
                    <!-- div -->
                    <div class="card mg-b-20" id="tabs-style2">
                        <div class="card-body">
                            <div class="main-content-label mg-b-5">
                                <a class="btn btn-primary" href="../invoices/"><i class="mdi mdi-keyboard-return"></i> رجوع للفواتير </a>
                            </div>
                            <div class="text-wrap">
                                <div class="example">
                                    <div class="panel panel-primary tabs-style-2">
                                        <div class=" tab-menu-heading">
                                            <div class="tabs-menu1">
                                                <!-- Tabs -->
                                                <ul class="nav panel-tabs main-nav-line">
                                                    <li><a href="#tab4" class="nav-link active" data-toggle="tab">بيانات الفاتوره</a></li>
                                                    <li><a href="#tab5" class="nav-link" data-toggle="tab">حالات الدفع</a></li>
                                                    <li><a href="#tab6" class="nav-link" data-toggle="tab">مرفقات الفاتوره</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="panel-body tabs-menu-body main-content-body-right border">
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab4">
                                                    <div class="main-contact-info-body p-4">
                                                        <div class="media-list pb-0">
                                                            <div class="media">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label>رقم الفاتوره</label> <span class="tx-medium text-danger">{{$invoice->invoice_number}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>تاريخ الاصدار</label> <span class="tx-medium text-info">{{$invoice->invoice_date}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>تاريخ الاستحقاق</label> <span class="tx-medium text-warning">{{$invoice->due_date}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label>القسم</label> <span class="tx-medium text-primary">{{$invoice->getSectionName->section_name}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>المنتج</label> <span class="tx-medium text-primary">{{$invoice->getProductName->product_name}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label>مبلغ التحصيل</label> <span class="tx-medium text-danger">{{$invoice->amount_collect}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>مبلغ العموله</label> <span class="tx-medium text-info">{{$invoice->commission}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>الخصم</label> <span class="tx-medium text-warning">{{$invoice->discount}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label>نسبه الضريبه</label> <span class="tx-medium text-primary">{{$invoice->rate_vat}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>قيمه الضريبه</label> <span class="tx-medium text-primary">{{$invoice->value_vat}}</span>
                                                                    </div>
                                                                    <div>
                                                                        <label>الاجمالي شامل الضريبه</label> <span class="tx-medium text-primary">{{$invoice->total}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="media">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label> حاله الفاتوره الحاليه</label>
                                                                        @if($invoice->value_status == 1)
                                                                         <span class="badge badge-pill badge-danger" style="width: 25%">{{$invoice->status}}</span>
                                                                        @elseif($invoice->value_status == 2)
                                                                            <span class="badge badge-pill badge-success" style="width: 25%">{{$invoice->status}}</span>
                                                                        @elseif($invoice->value_status == 3)
                                                                            <span class="badge badge-pill badge-warning" style="width: 25%">{{$invoice->status}}</span>
                                                                        @elseif($invoice->value_status == 4)
                                                                            <span class="badge badge-pill badge-info" style="width: 25%">{{$invoice->status}}</span>
                                                                        @endif
                                                                    </div>
                                                                    <div>
                                                                        <label>المستخدم</label> <span class="tx-medium text-dark">{{$invoice->getUser->user}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="media mb-0">
                                                                <div class="media-body">
                                                                    <div>
                                                                        <label>ملاحظات</label> <span class="tx-medium text-dark">{{$invoice->note}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane" id="tab5">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table text-md-nowrap" id="example1">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="wd-5p border-bottom-0">#</th>
                                                                        <th class="wd-10p border-bottom-0">رقم الفاتوره</th>
                                                                        <th class="wd-10p border-bottom-0">القسم</th>
                                                                        <th class="wd-10p border-bottom-0">المنتج</th>
                                                                        <th class="wd-10p border-bottom-0">حاله الدفع</th>
                                                                        <th class="wd-10p border-bottom-0">تاريخ الدفع</th>
                                                                        <th class="wd-10p border-bottom-0">تاريخ الاضافه</th>
                                                                        <th class="wd-15p border-bottom-0">المستخدم</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                <?php $i = 1; ?>
                                                                @foreach($invoice_details as $details)
                                                                    <tr>
                                                                        <td>{{$i++}}</td>
                                                                        <td>{{$details->invoice_number}}</td>
                                                                        <td>{{$details->getSectionName->section_name}}</td>
                                                                        <td>{{$details->getProductName->product_name}}</td>
                                                                        <td>
                                                                            @if($details->value_status == 1)
                                                                                <span class="badge badge-pill badge-danger">{{$details->status}}</span>
                                                                            @elseif($details->value_status == 2)
                                                                                <span class="badge badge-pill badge-success">{{$details->status}}</span>
                                                                            @elseif($details->value_status == 3)
                                                                                <span class="badge badge-pill badge-warning">{{$details->status}}</span>
                                                                            @elseif($details->value_status == 4)
                                                                                <span class="badge badge-pill badge-info">{{$details->status}}</span>
                                                                            @endif
                                                                        </td>
                                                                        <td>{{$details->payment_date}}</td>
                                                                        <td>{{$details->created_at}}</td>
                                                                        <td>{{$details->user}}</td>
                                                                    </tr>
                                                                @endforeach
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane" id="tab6">

                                                @can('اضافه مرفق')
                                                    <!-- Add New Attachment -->
                                                    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="main-content-label mg-b-5">
                                                                    اضافه مرفق جديد
                                                                </div>
                                                                <p class="text-danger" style="margin-top: 5px">* صيغة المرفق : ( PDF, JPEG , JPG , PNG ) </p>
                                                                <form action="{{url('invoices_attachments')}}" method="post" enctype="multipart/form-data">
                                                                    {{ csrf_field() }}
                                                                    <div class="row row-sm">
                                                                        <div class="col-md-12">
                                                                            <div class="custom-file">
                                                                                <input class="custom-file-input" name="file" id="file" type="file" accept=".pdf,.jpg, .png, image/jpeg, image/png" data-height="70" required>
                                                                                <label class="custom-file-label" for="customFile">اختيار الملف</label>
                                                                                <input type="hidden" name="invoice_number" id="invoice_number" value="{{$invoice->invoice_number}}">
                                                                                <input type="hidden" name="invoice_id" id="invoice_id" value="{{$invoice->id}}">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="card-footer">
                                                                        <button type="submit" class="btn btn-primary">تاكيد</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Add New Attachment -->
                                                @endcan

                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <table class="table text-md-nowrap" id="example1">
                                                                <thead>
                                                                <tr>
                                                                    <th class="wd-5p border-bottom-0">#</th>
                                                                    <th class="wd-25p border-bottom-0">اسم الملف</th>
                                                                    <th class="wd-15p border-bottom-0">تاريخ الاضافه</th>
                                                                    <th class="wd-15p border-bottom-0">المستخدم</th>
                                                                    <th class="wd-30p border-bottom-0">العمليات</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <?php $i = 1; ?>
                                                                    @foreach($invoice_attach as $attach)
                                                                        <tr>
                                                                            <td>{{$i++}}</td>
                                                                            <td>{{$attach->file_name}}</td>
                                                                            <td>{{$attach->created_at}}</td>
                                                                            <td>{{$attach->user}}</td>
                                                                            <td>
                                                                                <a class="btn btn-sm btn-success" target="_blank"
                                                                                   href="{{url('viewFile/'.$attach->invoice_number.'/'.$attach->file_name)}}">
                                                                                    <i class="mdi mdi-eye"></i> عرض </a>
                                                                                <a class="btn btn-sm btn-info" href="{{url('download/'.$attach->invoice_number.'/'.$attach->file_name)}}">
                                                                                    <i class="mdi mdi-download"></i> تحميل </a>
                                                                                @can('حذف مرفق')
                                                                                    <a class="modal-effect btn btn-sm btn-danger" data-effect="effect-scale" data-toggle="modal" data-target="#delete_file"
                                                                                       data-file_name="{{$attach->file_name}}" data-invoice_number="{{$attach->invoice_number}}" data-file_id="{{$attach->id}}">
                                                                                        <i class="mdi mdi-delete"></i> حذف </a>
                                                                                @endcan
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /div -->

                <!-- delete Attachment -->
                <div class="modal fade" id="delete_file">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content modal-content-demo">
                            <div class="modal-header">
                                <h6 class="modal-title">حذف المرفق</h6>
                                <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <form action="{{route('delete_file')}}" method="post">
                                {{ csrf_field() }}
                                <div class="modal-body">
                                    <p>هل انت متاكد من عملية الحذف ؟</p><br>
                                    <input type="hidden" name="file_id" id="file_id" value="">
                                    <input type="hidden" name="file_name" id="file_name" value="">
                                    <input type="hidden" name="invoice_number" id="invoice_number" value="">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                                    <button type="submit" class="btn btn-danger">تاكيد</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- delete Attachment -->

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
    <!-- Internal Modal js-->
    <script src="{{URL::asset('assets/js/modal.js')}}"></script>

    <!-- This For Delete File -->
    <script>
        $('#delete_file').on('show.bs.modal',function (event){
            var button         = $(event.relatedTarget);
            var file_id        = button.data('file_id');
            var file_name      = button.data('file_name');
            var invoice_number = button.data('invoice_number');
            var modal = $(this);

            modal.find('.modal-body #file_id').val(file_id);
            modal.find('.modal-body #file_name').val(file_name);
            modal.find('.modal-body #invoice_number').val(invoice_number);
        })
    </script>
    <!-- This For Delete File -->
@endsection
