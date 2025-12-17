<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Office extends Model
{
    //
    public function document_detail(): HasMany{
        return $this->hasMany(DocumentDetail::class, 'office_concerned_id');
    }
}
