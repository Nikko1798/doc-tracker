<?php

namespace App\Repositories;
use Illuminate\Support\Facades\DB;
use App\Models\Document;

class DocumentRepository
{
    public function store($request){
        DB::transaction(function () use($request){
            Document::create([
                'complexity_id'=>$request['complexity'],
                'document_type_id'=>$request['document_type'],
                'date_received'=>$request['date_received'],
                'control_number'=>$request['control_number'],
                'title'=>$request['title'],
            ]);
        });
        return $request;
    }
}
