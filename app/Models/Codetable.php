<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Codetable extends Model
{
    //
    public function documents(): HasMany{
        $this->hasMany(Document::class, 'complexity_id');
    }
}
