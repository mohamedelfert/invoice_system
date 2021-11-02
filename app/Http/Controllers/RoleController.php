<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
        $this->middleware('permission:حذف صلاحيه|تعديل صلاحيه|اضافه صلاحيه|عرض صلاحيه', ['only' => ['index','store']]);
        $this->middleware('permission:اضافه صلاحيه', ['only' => ['create','store']]);
        $this->middleware('permission:تعديل صلاحيه', ['only' => ['edit','update']]);
        $this->middleware('permission:حذف صلاحيه', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $title = 'فواتيري - صلاحيات المستخدمين';
        $roles = Role::orderBy('id','DESC')->paginate(10);
        return view('roles.index',compact('roles','title'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'فواتيري - اضافه صلاحيه جديده';
        $permissions = Permission::get();
        return view('roles.create',compact('permissions','title'));
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
            'name'       => 'required|unique:roles,name',
            'permission' => 'required'
        ];
        $validate_msg_ar = [
            'name.required'         => 'يجب كتابه اسم الصلاحيه',
            'name.unique'           => 'اسم الصلاحيه مسجل مسبقا',
            'permission.required'   => 'يجب اختيار صلاحيه واحده علي الاقل'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $data = Role::create(['name' => $request->input('name')]);
        $data->syncPermissions($request->input('permission'));

        return redirect()->route('roles.index')->with('add','تم اضافه السلاحيه بنجاح');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $title = 'فواتيري - عرض الصلاحيات';
        $role = Role::find($id);
        $rolePermissions = Permission::join("role_has_permissions","role_has_permissions.permission_id","=","permissions.id")
            ->where("role_has_permissions.role_id",$id)
            ->get();

        return view('roles.show',compact('role','rolePermissions','title'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $title = 'فواتيري - تعديل الصلاحيات';
        $role = Role::find($id);
        $permissions = Permission::get();
        $rolePermissions = DB::table("role_has_permissions")->where("role_has_permissions.role_id",$id)
            ->pluck('role_has_permissions.permission_id','role_has_permissions.permission_id')
            ->all();

        return view('roles.edit',compact('role','permissions','rolePermissions','title'));
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
            'name'       => 'required|unique:roles,name,'.$id,
            'permission' => 'required'
        ];
        $validate_msg_ar = [
            'name.required'         => 'يجب كتابه اسم الصلاحيه',
            'name.unique'           => 'اسم الصلاحيه مسجل مسبقا',
            'permission.required'   => 'يجب اختيار صلاحيه واحده علي الاقل'
        ];
        $data = $this->validate($request,$rules,$validate_msg_ar);

        $role = Role::find($id);
        $role->name = $request->input('name');
        $role->save();

        $role->syncPermissions($request->input('permission'));

        return redirect()->route('roles.index')->with('edit','تم تحديث الصلاحيه بنجاح');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table("roles")->where('id',$id)->delete();
        return redirect()->route('roles.index')->with('delete','تم حذف الصلاحيه بنجاح');
    }
}
