<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Employee extends Model
{
    //
       public function document_details(): HasMany{
        $this->belongsTo(Employee::class, 'ncca_end_user_id');
    }
}
