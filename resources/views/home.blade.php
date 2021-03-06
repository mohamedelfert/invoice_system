@extends('layouts.master')
@section('title')
    {{$title}}
@endsection
@section('css')
    <!--  Owl-carousel css-->
    <link href="{{URL::asset('assets/plugins/owl-carousel/owl.carousel.css')}}" rel="stylesheet" />
    <!-- Maps css -->
    <link href="{{URL::asset('assets/plugins/jqvmap/jqvmap.min.css')}}" rel="stylesheet">
@endsection
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="col-xl-4 col-lg-6 col-md-6 col-xm-12 main-dashboard-header-right" style="margin-right: 30%;">
            <div class="card overflow-hidden sales-card bg-info-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">اجمالي الفواتير</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    {{ number_format(\App\Invoices::sum('total') , 2) }} $
                                </h4>
                                <p class="mb-0 tx-12 text-white op-7">
                                    عدد الفواتير : <span>{{ \App\Invoices::count() }}</span>
                                </p>
                            </div>
                            <span class="float-right my-auto mr-auto">
                                <i class="fas fa-arrow-circle-up text-white"></i>
                                <span class="text-white op-7">{{ round(\App\Invoices::count() / \App\Invoices::count() * 100) }} %</span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
@endsection
@section('content')
    <!-- row -->
    <div class="row row-sm">

        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-success-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير المدفوعه</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    {{ number_format(\App\Invoices::where('value_status',2)->sum('total') , 2) }} $
                                </h4>
                                <p class="mb-0 tx-12 text-white op-7">
                                    عدد الفواتير : <span>{{ \App\Invoices::where('value_status',2)->count() }}</span>
                                </p>
                            </div>
                            <span class="float-right my-auto mr-auto">
                                <i class="fas fa-arrow-circle-up text-white"></i>
                                <span class="text-white op-7">{{ round(\App\Invoices::where('value_status',2)->count() / \App\Invoices::count() * 100) }} %</span>
                            </span>
                        </div>
                    </div>
                </div>
                <span id="compositeline" class="pt-1">5,9,5,6,4,12,18,14,10,15,12,5,8,5,12,5,12,10,16,12</span>
            </div>
        </div>

        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-danger-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير الغير مدفوعه</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    {{ number_format(\App\Invoices::where('value_status',1)->sum('total') , 2) }} $
                                </h4>
                                <p class="mb-0 tx-12 text-white op-7">
                                    عدد الفواتير : <span>{{ \App\Invoices::where('value_status',1)->count() }}</span>
                                </p>
                            </div>
                            <span class="float-right my-auto mr-auto">
                                <i class="fas fa-arrow-circle-down text-white"></i>
                                <span class="text-white op-7">{{ round(\App\Invoices::where('value_status',1)->count() / \App\Invoices::count() * 100) }} %</span>
                            </span>
                        </div>
                    </div>
                </div>
                <span id="compositeline2" class="pt-1">3,2,4,6,12,14,8,7,14,16,12,7,8,4,3,2,2,5,6,7</span>
            </div>
        </div>

        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-primary-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير المدفوعه جزئيا</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    {{ number_format(\App\Invoices::where('value_status',3)->sum('total') , 2) }} $
                                </h4>
                                <p class="mb-0 tx-12 text-white op-7">
                                    عدد الفواتير : <span>{{ \App\Invoices::where('value_status',3)->count() }}</span>
                                </p>
                            </div>
                            <span class="float-right my-auto mr-auto">
                                <i class="fas fa-arrow-circle-up text-white"></i>
                                 <span class="text-white op-7">{{ round(\App\Invoices::where('value_status',3)->count() / \App\Invoices::count() * 100) }} %</span>
                            </span>
                        </div>
                    </div>
                </div>
                <span id="compositeline3" class="pt-1">5,10,5,20,22,12,15,18,20,15,8,12,22,5,10,12,22,15,16,10</span>
            </div>
        </div>

        <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
            <div class="card overflow-hidden sales-card bg-warning-gradient">
                <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                    <div class="">
                        <h6 class="mb-3 tx-12 text-white">الفواتير المؤجله</h6>
                    </div>
                    <div class="pb-0 mt-0">
                        <div class="d-flex">
                            <div class="">
                                <h4 class="tx-20 font-weight-bold mb-1 text-white">
                                    {{ number_format(\App\Invoices::where('value_status',4)->sum('total') , 2) }} $
                                </h4>
                                <p class="mb-0 tx-12 text-white op-7">
                                    عدد الفواتير : <span>{{ \App\Invoices::where('value_status',4)->count() }}</span>
                                </p>
                            </div>
                            <span class="float-right my-auto mr-auto">
                                <i class="fas fa-arrow-circle-down text-white"></i>
                                <span class="text-white op-7">{{ round(\App\Invoices::where('value_status',4)->count() / \App\Invoices::count() * 100) }} %</span>
                            </span>
                        </div>
                    </div>
                </div>
                <span id="compositeline4" class="pt-1">5,9,5,6,4,12,18,14,10,15,12,5,8,5,12,5,12,10,16,12</span>
            </div>
        </div>

    </div>
    <!-- row closed -->

    <!-- row opened -->
    <div class="row row-sm">

        <div class="col-md-12 col-lg-12 col-xl-7">
            <div class="card">
                <div class="card-header bg-transparent pd-b-0 pd-t-20 bd-b-0">
                    <div class="d-flex justify-content-between">
                        <h4 class="card-title mb-0">نسبه احصائيه الفواتير</h4>
                    </div>
                </div>
                <div class="card-body" style="width:100%;">
                    {!! $chartjs->render() !!}
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-xl-5">
            <div class="card card-dashboard-map-one">
                <label class="main-content-label">نسبه احصائيه الفواتير</label>
                <div class="card-body" style="width:100%;">
                    {!! $chartjs2->render() !!}
                </div>
            </div>
        </div>

    </div>
    <!-- row closed -->

{{--    <!-- row opened -->--}}
{{--    <div class="row row-sm">--}}

{{--        <div class="col-md-12 col-lg-4 col-xl-4">--}}
{{--                <div class="card card-dashboard-eight pb-2">--}}
{{--                    <h6 class="card-title">Your Top Countries</h6><span class="d-block mg-b-10 text-muted tx-12">Sales performance revenue based by country</span>--}}
{{--                    <div class="list-group">--}}
{{--                        <div class="list-group-item border-top-0">--}}
{{--                            <i class="flag-icon flag-icon-us flag-icon-squared"></i>--}}
{{--                            <p>United States</p><span>$1,671.10</span>--}}
{{--                        </div>--}}
{{--                        <div class="list-group-item">--}}
{{--                            <i class="flag-icon flag-icon-nl flag-icon-squared"></i>--}}
{{--                            <p>Netherlands</p><span>$1,064.75</span>--}}
{{--                        </div>--}}
{{--                        <div class="list-group-item">--}}
{{--                            <i class="flag-icon flag-icon-gb flag-icon-squared"></i>--}}
{{--                            <p>United Kingdom</p><span>$1,055.98</span>--}}
{{--                        </div>--}}
{{--                        <div class="list-group-item">--}}
{{--                            <i class="flag-icon flag-icon-ca flag-icon-squared"></i>--}}
{{--                            <p>Canada</p><span>$1,045.49</span>--}}
{{--                        </div>--}}
{{--                        <div class="list-group-item">--}}
{{--                            <i class="flag-icon flag-icon-in flag-icon-squared"></i>--}}
{{--                            <p>India</p><span>$1,930.12</span>--}}
{{--                        </div>--}}
{{--                        <div class="list-group-item border-bottom-0 mb-0">--}}
{{--                            <i class="flag-icon flag-icon-au flag-icon-squared"></i>--}}
{{--                            <p>Australia</p><span>$1,042.00</span>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}

{{--        <div class="col-md-12 col-lg-8 col-xl-8">--}}
{{--            <div class="card card-table-two">--}}
{{--                <div class="d-flex justify-content-between">--}}
{{--                    <h4 class="card-title mb-1">Your Most Recent Earnings</h4>--}}
{{--                    <i class="mdi mdi-dots-horizontal text-gray"></i>--}}
{{--                </div>--}}
{{--                <span class="tx-12 tx-muted mb-3 ">This is your most recent earnings for today's date.</span>--}}
{{--                <div class="table-responsive country-table">--}}
{{--                    <table class="table table-striped table-bordered mb-0 text-sm-nowrap text-lg-nowrap text-xl-nowrap">--}}
{{--                        <thead>--}}
{{--                        <tr>--}}
{{--                            <th class="wd-lg-25p">Date</th>--}}
{{--                            <th class="wd-lg-25p tx-right">Sales Count</th>--}}
{{--                            <th class="wd-lg-25p tx-right">Earnings</th>--}}
{{--                            <th class="wd-lg-25p tx-right">Tax Witheld</th>--}}
{{--                        </tr>--}}
{{--                        </thead>--}}
{{--                        <tbody>--}}
{{--                        <tr>--}}
{{--                            <td>05 Dec 2019</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">34</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">$658.20</td>--}}
{{--                            <td class="tx-right tx-medium tx-danger">-$45.10</td>--}}
{{--                        </tr>--}}
{{--                        <tr>--}}
{{--                            <td>06 Dec 2019</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">26</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">$453.25</td>--}}
{{--                            <td class="tx-right tx-medium tx-danger">-$15.02</td>--}}
{{--                        </tr>--}}
{{--                        <tr>--}}
{{--                            <td>07 Dec 2019</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">34</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">$653.12</td>--}}
{{--                            <td class="tx-right tx-medium tx-danger">-$13.45</td>--}}
{{--                        </tr>--}}
{{--                        <tr>--}}
{{--                            <td>08 Dec 2019</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">45</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">$546.47</td>--}}
{{--                            <td class="tx-right tx-medium tx-danger">-$24.22</td>--}}
{{--                        </tr>--}}
{{--                        <tr>--}}
{{--                            <td>09 Dec 2019</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">31</td>--}}
{{--                            <td class="tx-right tx-medium tx-inverse">$425.72</td>--}}
{{--                            <td class="tx-right tx-medium tx-danger">-$25.01</td>--}}
{{--                        </tr>--}}
{{--                        </tbody>--}}
{{--                    </table>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}

{{--    </div>--}}
{{--    <!-- row close -->--}}

{{--    <!-- row opened -->--}}
{{--    <div class="row row-sm row-deck">--}}

{{--        <div class="col-md-12 col-lg-4 col-xl-4">--}}
{{--            <div class="card card-dashboard-eight pb-2">--}}
{{--                <h6 class="card-title">Your Top Countries</h6><span class="d-block mg-b-10 text-muted tx-12">Sales performance revenue based by country</span>--}}
{{--                <div class="list-group">--}}
{{--                    <div class="list-group-item border-top-0">--}}
{{--                        <i class="flag-icon flag-icon-us flag-icon-squared"></i>--}}
{{--                        <p>United States</p><span>$1,671.10</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-nl flag-icon-squared"></i>--}}
{{--                        <p>Netherlands</p><span>$1,064.75</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-gb flag-icon-squared"></i>--}}
{{--                        <p>United Kingdom</p><span>$1,055.98</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-ca flag-icon-squared"></i>--}}
{{--                        <p>Canada</p><span>$1,045.49</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-in flag-icon-squared"></i>--}}
{{--                        <p>India</p><span>$1,930.12</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item border-bottom-0 mb-0">--}}
{{--                        <i class="flag-icon flag-icon-au flag-icon-squared"></i>--}}
{{--                        <p>Australia</p><span>$1,042.00</span>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}

{{--        <div class="col-xl-4 col-md-12 col-lg-6">--}}
{{--            <div class="card">--}}
{{--                <div class="card-header pb-0">--}}
{{--                    <h3 class="card-title mb-2">Recent Orders</h3>--}}
{{--                    <p class="tx-12 mb-0 text-muted">An order is an investor's instructions to a broker or brokerage firm to purchase or sell</p>--}}
{{--                </div>--}}
{{--                <div class="card-body sales-info ot-0 pt-0 pb-0">--}}

{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}

{{--        <div class="col-md-12 col-lg-4 col-xl-4">--}}
{{--            <div class="card card-dashboard-eight pb-2">--}}
{{--                <h6 class="card-title">Your Top Countries</h6><span class="d-block mg-b-10 text-muted tx-12">Sales performance revenue based by country</span>--}}
{{--                <div class="list-group">--}}
{{--                    <div class="list-group-item border-top-0">--}}
{{--                        <i class="flag-icon flag-icon-us flag-icon-squared"></i>--}}
{{--                        <p>United States</p><span>$1,671.10</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-nl flag-icon-squared"></i>--}}
{{--                        <p>Netherlands</p><span>$1,064.75</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-gb flag-icon-squared"></i>--}}
{{--                        <p>United Kingdom</p><span>$1,055.98</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-ca flag-icon-squared"></i>--}}
{{--                        <p>Canada</p><span>$1,045.49</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item">--}}
{{--                        <i class="flag-icon flag-icon-in flag-icon-squared"></i>--}}
{{--                        <p>India</p><span>$1,930.12</span>--}}
{{--                    </div>--}}
{{--                    <div class="list-group-item border-bottom-0 mb-0">--}}
{{--                        <i class="flag-icon flag-icon-au flag-icon-squared"></i>--}}
{{--                        <p>Australia</p><span>$1,042.00</span>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}

{{--    </div>--}}
{{--    <!-- /row -->--}}
    </div>
    </div>
    <!-- Container closed -->
@endsection
@section('js')
    <!--Internal  Chart.bundle js -->
    <script src="{{URL::asset('assets/plugins/chart.js/Chart.bundle.min.js')}}"></script>
    <!-- Moment js -->
    <script src="{{URL::asset('assets/plugins/raphael/raphael.min.js')}}"></script>
    <!--Internal  Flot js-->
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.pie.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.resize.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jquery.flot/jquery.flot.categories.js')}}"></script>
    <script src="{{URL::asset('assets/js/dashboard.sampledata.js')}}"></script>
    <script src="{{URL::asset('assets/js/chart.flot.sampledata.js')}}"></script>
    <!--Internal Apexchart js-->
    <script src="{{URL::asset('assets/js/apexcharts.js')}}"></script>
    <!-- Internal Map -->
    <script src="{{URL::asset('assets/plugins/jqvmap/jquery.vmap.min.js')}}"></script>
    <script src="{{URL::asset('assets/plugins/jqvmap/maps/jquery.vmap.usa.js')}}"></script>
    <script src="{{URL::asset('assets/js/modal-popup.js')}}"></script>
    <!--Internal  index js -->
    <script src="{{URL::asset('assets/js/index.js')}}"></script>
    <script src="{{URL::asset('assets/js/jquery.vmap.sampledata.js')}}"></script>
@endsection
