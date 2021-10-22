<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $table = 'products';

    protected $fillable = [
        'id',
        'product_name',
        'description',
        'section_id'
    ];

    public function getSectionName(){
        return $this->hasOne(Sections::class,'id','section_id');
    }
}
