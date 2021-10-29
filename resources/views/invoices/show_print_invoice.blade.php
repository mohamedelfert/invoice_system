@extends('layouts.master')
@section('title')
    {{$title}}
@endsection
@section('css')
    <style>
        @media print {
            #invoice_print{ display: none; }
            #send_invoice{ display: none; }
        }
    </style>
@endsection
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="my-auto">
            <div class="d-flex">
                <h4 class="content-title mb-0 my-auto">الفواتير</h4><span class="text-muted mt-1 tx-13 mr-2 mb-0">/ معاينه الفاتوره للطباعه</span>
            </div>
        </div>
        <div>
            <a class="btn btn-primary" href="{{url('../invoices')}}"><i class="mdi mdi-keyboard-return"></i> رجوع للفواتير </a>
        </div>
    </div>
    <!-- breadcrumb -->
@endsection
@section('content')
				<!-- row -->
				<div class="row row-sm">
					<div class="col-md-12 col-xl-12">
						<div class=" main-content-body-invoice" id="print">
							<div class="card card-invoice">
								<div class="card-body">
									<div class="invoice-header">
                                        <img src="{{URL::asset('assets/img/brand/invoice_3.png')}}" class="invoice-title sign-favicon ht-100" alt="logo">
										<div class="billed-from">
											<h6>My Invoices System</h6>
											<p>201 Something St., Something Town, YT 242, Country 6546<br>
											Tel No: 324 445-4544<br>
											Email: info@myinvoices.com</p>
										</div><!-- billed-from -->
									</div><!-- invoice-header -->

                                    <hr style="border: 1px solid #d9dbe0">

									<div class="row mg-t-20">
										<div class="col-md">
											<label class="tx-gray-600">فاتوره الي :</label>
											<div class="billed-to">
												<h6>احمد السيد علي جميل</h6>
												<p>5 شارع الحريه , مصر الجديده , القاهره</p>
												<p>الهاتف : <span> 02 010-6627-9845 </span></p>
                                                <p>البريد الالكتروني : <span> ahmed_ali2010@yahoo.com </span></p>
                                                <p>تاريخ اليوم : <span> {{ date('Y-m-d') }} </span></p>
											</div>
										</div>

										<div class="col-md">
											<label class="tx-gray-600">تفاصيل الفاتوره</label>
											<p class="invoice-info-row"><span>رقم الفاتوره :</span> <span>{{ $invoice_show->invoice_number }}</span></p>
											<p class="invoice-info-row"><span>تاريخ الاصدار :</span> <span>{{ $invoice_show->invoice_date }}</span></p>
											<p class="invoice-info-row"><span>تاريخ الاستحقاق :</span> <span>{{ $invoice_show->due_date }}</span></p>
											<p class="invoice-info-row"><span>القسم :</span> <span>{{ $invoice_show->getSectionName->section_name }}</span></p>
										</div>
									</div>
									<div class="table-responsive mg-t-40">
										<table class="table table-invoice border text-md-nowrap mb-0">
											<thead>
												<tr>
													<th class="wd-20p">#</th>
													<th class="wd-40p">المنتج</th>
													<th class="tx-center">مبلغ التحصيل</th>
													<th class="tx-right">مبلغ العموله</th>
													<th class="tx-right">الاجمالي</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td class="tx-12">{{ $invoice_show->getProductName->product_name }}</td>
													<td class="tx-center">${{ number_format($invoice_show->amount_collect , 2) }}</td>
													<td class="tx-right">${{ number_format($invoice_show->commission , 2) }}</td>
													<td class="tx-right">${{ number_format($invoice_show->amount_collect + $invoice_show->commission , 2) }}</td>
												</tr>
												<tr>
													<td class="valign-middle" colspan="2" rowspan="4">
														<div class="invoice-notes">
															<label class="main-content-label tx-13"></label>
														</div><!-- invoice-notes -->
													</td>
													<td class="tx-right">الاجمالي</td>
													<td class="tx-right" colspan="2">${{ number_format($invoice_show->amount_collect + $invoice_show->commission , 2) }}</td>
												</tr>
												<tr>
													<td class="tx-right">قيمه الضريبه (5%)</td>
													<td class="tx-right" colspan="2">${{$invoice_show->value_vat}}</td>
												</tr>
												<tr>
													<td class="tx-right">قيمه الخصم</td>
													<td class="tx-right" colspan="2">${{$invoice_show->discount}}</td>
												</tr>
												<tr>
													<td class="tx-right tx-uppercase tx-bold tx-inverse">الاجمالي شامل الضريبه</td>
													<td class="tx-right" colspan="2">
														<h4 class="tx-primary tx-bold">${{number_format($invoice_show->total , 2)}}</h4>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<hr class="mg-b-40">
									<a href="#" class="btn btn-primary float-left mt-3 mr-2" id="invoice_print" onclick="printInvoice()">
										<i class="mdi mdi-printer ml-1"></i>طباعه الفاتوره
									</a>
									<a href="#" class="btn btn-success float-left mt-3" id="send_invoice">
										<i class="mdi mdi-telegram ml-1"></i>ارسال بالايميل
									</a>
								</div>
							</div>
						</div>
					</div><!-- COL-END -->
				</div>
				<!-- row closed -->
			</div>
			<!-- Container closed -->
		</div>
		<!-- main-content closed -->
@endsection
@section('js')
    <!--Internal  Chart.bundle js -->
    <script src="{{ URL::asset('assets/plugins/chart.js/Chart.bundle.min.js') }}"></script>

    <!-- This For Print Invoice -->
    <script>
        function printInvoice(){
            var content = document.getElementById('print').innerHTML;
            document.body.innerHTML = content;
            window.print();
            location.reload();
        }
    </script>
@endsection
