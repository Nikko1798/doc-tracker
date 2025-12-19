<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Employee extends Model
{
    //
    protected $guarded=[];
    public function document_details(): HasMany{
        return $this->hasMany(DocumentDetail::class, 'ncca_end_user_id');
    }
}
