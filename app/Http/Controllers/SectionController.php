<?php

namespace App\Http\Controllers;

use App\Sections;
use Illuminate\Http\Request;

class SectionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'الاقسام';
        $all_sections = Sections::all();
        return view('sections.sections',compact('title','all_sections'));
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
//        $rules = [
//            'section_name' => 'required|min:5',
//            'description'  => 'required'
//        ];
//        $niceName = [
//            'section_name' => 'Section Name',
//            'description' => 'Description'
//        ];
//        $data = $this->validate($request,$rules,[],$niceName);
//
//        $input_exists = Sections::where('section_name','=',$request['section_name'])->exists();
//        if ($input_exists){
//            session()->flash('exist','عفوا هذا القسم مضاف مسبقا !');
//            return redirect('sections');
//        }else{
//            $data['section_name'] = $request->section_name;
//            $data['description']  = $request->description;
//            $data['created_by']   = auth()->user()->name;
//            Sections::create($data);
//            session()->flash('success','تم اضافه القسم بنجاح');
//            return redirect('sections');
//        }

        $rules = ['section_name' => 'required|min:5|unique:Sections','description'  => 'required'];
        $validate_msg_ar = [
            'section_name.required' => 'يجب كتابه اسم القسم',
            'section_name.unique'   => 'اسم القسم مسجل مسبقا',
            'section_name.min'      => 'اسم القسم يجب ان يكون من 5 احرف علي الاقل',
            'description.required'  => 'يجب كتابه وصف للقسم'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $data['section_name'] = $request->section_name;
        $data['description']  = $request->description;
        $data['created_by']   = auth()->user()->name;
        Sections::create($data);
        session()->flash('success','تم اضافه القسم بنجاح');
        return redirect('sections');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Sections  $section
     * @return \Illuminate\Http\Response
     */
    public function show(Sections $section)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Sections  $section
     * @return \Illuminate\Http\Response
     */
    public function edit(Sections $section)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Sections  $section
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $rules = ['section_name' => 'required|min:5','description'  => 'required'];
        $validate_msg_ar = [
            'section_name.required' => 'يجب كتابه اسم القسم',
            'section_name.min'      => 'اسم القسم يجب ان يكون من 5 احرف علي الاقل',
            'description.required'  => 'يجب كتابه وصف للقسم'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);
        $id = $request->id;
        $section = Sections::find($id);
        $data['section_name'] = $request->section_name;
        $data['description']  = $request->description;
        $data['created_by']   = auth()->user()->name;
        $section->update($data);
        session()->flash('success','تم تجديث بيانات القسم بنجاح');
        return redirect('sections');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Sections  $section
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        Sections::find($id)->delete();
        session()->flash('success','تم حذف القسم بنجاح');
        return redirect('sections');
    }
}
