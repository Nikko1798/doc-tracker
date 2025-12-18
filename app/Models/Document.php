<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


class Document extends Model
{
    //
    protected $guarded=[];
    public function document_detail(): HasOne
    {
        return $this->hasOne(DocumentDetail::class);
    }

    public function complexity(): BelongsTo{
        return $this->belongsTo(Codetable::class, 'complexity_id');
    }
    public function document_type(): BelongsTo{
        return $this->belongsTo(DocumentType::class, 'document_type_id');
    }
}
