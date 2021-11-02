<?php

namespace Database\Seeders;

use App\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name'       => 'Mohamed Ibrahiem',
            'email'      => 'mohamed@yahoo.com',
            'password'   => bcrypt('123456'),
            'role_name'  => 'superAdmin',
            'status'     => 'مفعل',
        ]);

        $role = Role::create(['name' => 'superAdmin']);

        $permissions = Permission::pluck('id','id')->all();

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);
    }
}
