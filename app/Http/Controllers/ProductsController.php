<?php

namespace App\Http\Controllers;

use App\Products;
use App\Sections;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'المنتجات';
        $sections = Sections::all();
        $all_products = Products::all();
        return view('products.products',compact('title','sections','all_products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'product_name' => 'required|min:5|unique:Products',
            'section_id' => 'required',
            'description'  => 'required'
        ];
        $validate_msg_ar = [
            'product_name.required' => 'يجب كتابه اسم المنتج',
            'product_name.unique'   => 'اسم المنتج مسجل مسبقا',
            'product_name.min'      => 'اسم المنتج يجب ان يكون من 5 احرف علي الاقل',
            'section_id.required'   => 'يجب اختيار القسم الخاص بالمنتج',
            'description.required'  => 'يجب كتابه وصف للمنتج'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);
        $data['product_name'] = $request->product_name;
        $data['section_id'] = $request->section_id;
        $data['description'] = $request->description;
        Products::create($data);
        session()->flash('success','تم اضافه المنتج بنجاح');
        return redirect('products');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\products  $products
     * @return \Illuminate\Http\Response
     */
    public function show(products $products)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\products  $products
     * @return \Illuminate\Http\Response
     */
    public function edit(products $products)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\products  $products
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, products $products)
    {
        $id = $request->id;
        $rules = [
            'product_name' => 'required|min:5|unique:Products,product_name,'.$id,
            'section_id' => 'required',
            'description'  => 'required'
        ];
        $validate_msg_ar = [
            'product_name.required' => 'يجب كتابه اسم المنتج',
            'product_name.unique'   => 'اسم المنتج مسجل مسبقا',
            'product_name.min'      => 'اسم المنتج يجب ان يكون من 5 احرف علي الاقل',
            'section_id.required'   => 'يجب اختيار القسم الخاص بالمنتج',
            'description.required'  => 'يجب كتابه وصف للمنتج'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $product = Products::find($id);
        $data['product_name'] = $request->product_name;
        $data['section_id'] = $request->section_id;
        $data['description'] = $request->description;
        $product->update($data);
        session()->flash('success','تم تعديل المنتج بنجاح');
        return redirect('products');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\products  $products
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request,products $products)
    {
        $id = $request->id;
        Products::find($id)->delete();
        session()->flash('success','تم حذف المنتج بنجاح');
        return redirect('products');
    }
}
