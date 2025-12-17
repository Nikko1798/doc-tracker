<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DocumentDetails extends Model
{
    //
    public function document(): BelongsTo{
        $this->belongsTo(Document::class);
    }
    public function ncca_end_user(): BelongsTo{
        $this->belongsTo(Employee::class, 'ncca_end_user_id');
    }
    public function office_concerned(): BelongsTo{
        $this->belongsTo(Office::class, 'office_concerned_id');
    }
    
}
