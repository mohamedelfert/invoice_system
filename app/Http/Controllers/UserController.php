<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
        $this->middleware('permission:حذف صلاحيه|تعديل صلاحيه|اضافه صلاحيه|عرض صلاحيه', ['only' => ['index','store']]);
        $this->middleware('permission:اضافه مستخدم', ['only' => ['create','store']]);
        $this->middleware('permission:تعديل مستخدم', ['only' => ['edit','update']]);
        $this->middleware('permission:حذف مستخدم', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $title = 'برنامج فواتيري - المستخدمين';
        $users = User::orderBy('id','DESC')->paginate(10);
        return view('users.index',compact('title','users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'برنامج فواتيري - اضافه مستخدم جديد';
        $roles = Role::pluck('name','name')->all();
        return view('users.create',compact('roles','title'));
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
            'name'        => 'required|min:5|unique:users,name',
            'email'       => 'required|email|unique:users,email',
            'password'    => 'required|same:confirm-password',
            'status'      => 'required',
            'role_name'   => 'required'
        ];
        $validate_msg_ar = [
            'name.required'      => 'يجب كتابه اسم المستخدم',
            'name.unique'        => 'اسم المستخدم مسجل مسبقا',
            'name.min'           => 'يجب ان لايقل اسم المستخدم عن 5 أحرف',
            'email.required'     => 'يجب كتابه بريد الكتروني',
            'email.unique'       => 'البريد الالكتروني مسجل مسبقا',
            'password.required'  => 'يجب كتابه باسوورد',
            'password.same'      => 'كلمه المرور لا تساوي تاكيد كلمه المرور',
            'status.required'    => 'يجب اختيار حاله المستخدم',
            'role_name.required' => 'يجب اختيار صلاحيه للمستخدم'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $data = $request->all();
        $data['password'] = Hash::make($data['password']);

        $user = User::create($data);
        $user->assignRole($request->input('role_name'));

        return redirect()->route('users.index')->with('success','تم اضافه المستخدم بنجاح');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
//        $user = User::find($id);
//        return view('users.show',compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $title = 'برنامج فواتيري - تحديث بيانات مستخدم';
        $user  = User::find($id);
        $roles = Role::pluck('name','name')->all();
        $userRole = $user->roles->pluck('name','name')->all();

        return view('users.edit',compact('user','roles','userRole','title'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rules = [
            'name'        => 'required|min:5|unique:users,name,'.$id,
            'email'       => 'required|email|unique:users,email,'.$id,
            'password'    => 'required|same:confirm-password',
            'status'      => 'required',
            'role_name'   => 'required'
        ];
        $validate_msg_ar = [
            'name.required'      => 'يجب كتابه اسم المستخدم',
            'name.unique'        => 'اسم المستخدم مسجل مسبقا',
            'name.min'           => 'يجب ان لايقل اسم المستخدم عن 5 أحرف',
            'email.required'     => 'يجب كتابه بريد الكتروني',
            'email.unique'       => 'البريد الالكتروني مسجل مسبقا',
            'password.required'  => 'يجب كتابه باسوورد',
            'password.same'      => 'كلمه المرور لا تساوي تاكيد كلمه المرور',
            'status.required'    => 'يجب اختيار حاله المستخدم',
            'role_name.required' => 'يجب اختيار صلاحيه للمستخدم'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $data = $request->all();
        if(!empty($data['password'])){
            $data['password'] = Hash::make($data['password']);
        }else{
            $data = Arr::except($data,array('password'));
        }

        $user = User::find($id);
        $user->update($data);
        DB::table('model_has_roles')->where('model_id',$id)->delete();

        $user->assignRole($request->input('role_name'));

        return redirect()->route('users.index')->with('success','تم التحديث بنجاح');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request->id;
        User::find($id)->delete();
        return redirect()->route('users.index')->with('success','تم حذف المستخدم بنجاح');
    }

    /**
     * show user profile
     */
    public function user_profile($id)
    {
        $title = 'فواتيري _ بيانات العضو';
        $user = User::find($id);
        return view('users.show',compact('title','user'));
    }
}
