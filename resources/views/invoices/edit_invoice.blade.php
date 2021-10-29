@extends('layouts.master')
@section('title')
    {{$title}}
@endsection
@section('css')
    <!--- Internal Select2 css-->
    <link href="{{ URL::asset('assets/plugins/select2/css/select2.min.css') }}" rel="stylesheet">
    <!---Internal Fileupload css-->
    <link href="{{ URL::asset('assets/plugins/fileuploads/css/fileupload.css') }}" rel="stylesheet" type="text/css" />
    <!---Internal Fancy uploader css-->
    <link href="{{ URL::asset('assets/plugins/fancyuploder/fancy_fileupload.css') }}" rel="stylesheet" />
    <!--Internal Sumoselect css-->
    <link rel="stylesheet" href="{{ URL::asset('assets/plugins/sumoselect/sumoselect-rtl.css') }}">
    <!--Internal  TelephoneInput css-->
    <link rel="stylesheet" href="{{ URL::asset('assets/plugins/telephoneinput/telephoneinput-rtl.css') }}">
@endsection
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="my-auto">
            <div class="d-flex">
                <h4 class="content-title mb-0 my-auto">الفواتير</h4><span class="text-muted mt-1 tx-13 mr-2 mb-0">/ تعديل الفاتوره</span>
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
                <div class="col-lg-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="main-content-label mg-b-5">
                                <a class="btn btn-primary" href="../"><i class="mdi mdi-keyboard-return"></i> رجوع للفواتير </a>
                            </div>
                            <hr>
                            <form action="{{ url('invoices/'.$invoice->id) }}" method="post" enctype="multipart/form-data">
                                {{method_field('put')}}
                                {{ csrf_field() }}
                                <div class="row">
                                    <div class="col">
                                        <label for="invoice_number" class="control-label">رقم الفاتورة</label>
                                        <input type="text" class="form-control" value="{{$invoice->invoice_number}}" id="invoice_number" name="invoice_number" readonly required>
                                    </div>

                                    <div class="col">
                                        <label for="invoice_date" class="control-label">تاريخ الفاتورة</label>
                                        <input class="form-control fc-datepicker" id="invoice_date" name="invoice_date" value="{{$invoice->invoice_date}}"
                                               placeholder="YYYY-MM-DD" type="date"  required>
                                    </div>

                                    <div class="col">
                                        <label for="due_date" class="control-label">تاريخ الاستحقاق</label>
                                        <input class="form-control fc-datepicker" id="due_date" name="due_date" value="{{$invoice->due_date}}"
                                               placeholder="YYYY-MM-DD" type="date" required>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col">
                                        <label for="section_id" class="control-label">القسم</label>
                                        <select name="section_id" id="section_id" class="form-control SlectBox" onclick="console.log($(this).val())"
                                                onchange="console.log('Change Is Firing')">
                                            <option value="" selected disabled>حدد القسم</option>
{{--                                            <option value="{{$invoice->getSectionName->id }}">{{$invoice->getSectionName->section_name}}</option>--}}
                                            @foreach ($sections as $section)
                                                <option value="{{ $section->id }}" {{($invoice->section_id === $section->id) ? 'selected':''}}> {{ $section->section_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col">
                                        <label for="product_id" class="control-label">المنتج</label>
                                        <select id="product_id" name="product_id" class="form-control">
                                            <option value="{{ $invoice->product_id }}"> {{ $invoice->getProductName->product_name }}</option>
                                        </select>
                                    </div>

                                    <div class="col">
                                        <label for="amount_collect" class="control-label">مبلغ التحصيل</label>
                                        <input type="text" class="form-control" id="amount_collect" name="amount_collect" placeholder="يرجي ادخال مبلغ التحصيل "
                                               value="{{$invoice->amount_collect}}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col">
                                        <label for="commission" class="control-label">مبلغ العمولة</label>
                                        <input type="text" class="form-control" id="commission" name="commission" placeholder="يرجي ادخال مبلغ العمولة "
                                               value="{{$invoice->commission}}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                                    </div>

                                    <div class="col">
                                        <label for="discount" class="control-label">الخصم</label>
                                        <input type="text" class="form-control" id="discount" name="discount" placeholder="يرجي ادخال مبلغ الخصم "
                                               value="{{$invoice->discount}}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                                    </div>

                                    <div class="col">
                                        <label for="rate_vat" class="control-label">نسبة ضريبة القيمة المضافة</label>
                                        <select name="rate_vat" id="rate_vat" class="form-control" onchange="myFunction()">
                                            <option value="" selected disabled>حدد نسبة الضريبة</option>
                                            <option value="0.05" {{($invoice->rate_vat === '0.05') ? 'selected':''}}>5%</option>
                                            <option value="0.10" {{($invoice->rate_vat === '0.10') ? 'selected':''}}>10%</option>
                                            <option value="0.13" {{($invoice->rate_vat === '0.13') ? 'selected':''}}>13%</option>
                                            <option value="0.14" {{($invoice->rate_vat === '0.14') ? 'selected':''}}>14%</option>
                                        </select>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col">
                                        <label for="status" class="control-label">حاله الفاتوره</label>
                                        <select name="status" id="status" class="form-control">
                                            <option value="غير مدفوعه" {{($invoice->status === 'غير مدفوعه') ? 'selected':''}}>غير مدفوعه</option>
                                            <option value="مدفوعه" {{($invoice->status === 'مدفوعه') ? 'selected':''}}>مدفوعه</option>
                                            <option value="مدفوعه جزئيا" {{($invoice->status === 'مدفوعه جزئيا') ? 'selected':''}}>مدفوعه جزئيا</option>
                                            <option value="مؤجله" {{($invoice->status === 'مؤجله') ? 'selected':''}}>مؤجله</option>

                                        </select>
                                    </div>

                                    <div class="col">
                                        <label for="value_vat" class="control-label">قيمة ضريبة القيمة المضافة</label>
                                        <input type="text" class="form-control" id="value_vat" name="value_vat" value="{{$invoice->value_vat}}" readonly>
                                    </div>

                                    <div class="col">
                                        <label for="total" class="control-label">الاجمالي شامل الضريبة</label>
                                        <input type="text" class="form-control" id="total" name="total" value="{{$invoice->total}}" readonly>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col">
                                        <label for="note">ملاحظات</label>
                                        <textarea class="form-control" id="note" name="note" rows="3">{{$invoice->note}}</textarea>
                                    </div>
                                </div>

                                <hr>

                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-success">حفظ البيانات</button>
                                </div>
                            </form>
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
    <!-- Internal Select2 js-->
    <script src="{{ URL::asset('assets/plugins/select2/js/select2.min.js') }}"></script>
    <!--Internal Fileuploads js-->
    <script src="{{ URL::asset('assets/plugins/fileuploads/js/fileupload.js') }}"></script>
    <script src="{{ URL::asset('assets/plugins/fileuploads/js/file-upload.js') }}"></script>
    <!--Internal Fancy uploader js-->
    <script src="{{ URL::asset('assets/plugins/fancyuploder/jquery.ui.widget.js') }}"></script>
    <script src="{{ URL::asset('assets/plugins/fancyuploder/jquery.fileupload.js') }}"></script>
    <script src="{{ URL::asset('assets/plugins/fancyuploder/jquery.iframe-transport.js') }}"></script>
    <script src="{{ URL::asset('assets/plugins/fancyuploder/jquery.fancy-fileupload.js') }}"></script>
    <script src="{{ URL::asset('assets/plugins/fancyuploder/fancy-uploader.js') }}"></script>
    <!--Internal  Form-elements js-->
    <script src="{{ URL::asset('assets/js/advanced-form-elements.js') }}"></script>
    <script src="{{ URL::asset('assets/js/select2.js') }}"></script>
    <!--Internal Sumoselect js-->
    <script src="{{ URL::asset('assets/plugins/sumoselect/jquery.sumoselect.js') }}"></script>
    <!--Internal  jquery.maskedinput js -->
    <script src="{{ URL::asset('assets/plugins/jquery.maskedinput/jquery.maskedinput.js') }}"></script>
    <!--Internal  spectrum-colorpicker js -->
    <script src="{{ URL::asset('assets/plugins/spectrum-colorpicker/spectrum.js') }}"></script>
    <!-- Internal form-elements js -->
    <script src="{{ URL::asset('assets/js/form-elements.js') }}"></script>

    {{-- Start This Ajax Code To Get Product Name And ID --}}
    <script>
        $(document).ready(function() {
            $('select[name="section_id"]').on('change', function() {
                var section_id = $(this).val();
                if (section_id) {
                    $.ajax({
                        url: "{{ URL::to('section') }}/" + section_id,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            $('select[name="product_id"]').empty();
                            $.each(data, function(key, value) {
                                $('select[name="product_id"]').append('<option value="' + key + '">' + value + '</option>');
                            });
                        },
                    });
                } else {
                    console.log('AJAX Load Did Not Work');
                }
            });
        });
    </script>
    {{-- End This Ajax Code To Get Product Name And ID --}}

    {{-- Start This To Get And Calculate commision after discount , value vat and total --}}
    <script>
        function myFunction() {
            var commission = parseFloat(document.getElementById("commission").value);
            var discount   = parseFloat(document.getElementById("discount").value);
            var rate_vat   = parseFloat(document.getElementById("rate_vat").value);

            var amount_commission = commission - discount;

            if (typeof commission === 'undefined' || !commission) {
                alert('يرجي ادخال مبلغ العمولة ');
            } else {
                var Value_vat = amount_commission * rate_vat;
                var Total     = parseFloat(Value_vat + amount_commission);
                sum_commision = parseFloat(Value_vat).toFixed(2);
                sum_total     = parseFloat(Total).toFixed(2);
                document.getElementById("value_vat").value = sum_commision;
                document.getElementById("total").value = sum_total;
            }
        };
    </script>
    {{-- End This To Get And Calculate commision after discount , value vat and total --}}
@endsection
