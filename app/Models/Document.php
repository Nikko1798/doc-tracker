<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    //
    protected $guarded=[];
    public function document_detail(): HasOne
    {
        $this->hasOne(DocumentDetail::class);
    }

    public function complexity(): BelongsTo{
        $this->belongsTo(Codetable::class, 'complexity_id');
    }
    public function document_type(): BelongsTo{
        $this->belongsTo(DocumentType::class, 'document_type_id');
    }
}
