<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DocumentDetail extends Model
{
    //
    protected $guarded=[];
    public function document(): BelongsTo{
        return $this->belongsTo(Document::class);
    }
    public function ncca_end_user(): BelongsTo{
        return $this->belongsTo(Employee::class, 'ncca_end_user_id');
    }
    public function office_concerned(): BelongsTo{
        return $this->belongsTo(Office::class, 'office_concerned_id');
    }
    
}
