<?php

namespace App\Repositories;
use Illuminate\Support\Facades\DB;
use App\Models\Document;

class DocumentRepository
{
    public function store($request){
        DB::transaction(function () use($request){
            $document=Document::create([
                'complexity_id'=>$request['complexity'],
                'document_type_id'=>$request['document_type'],
                'date_received'=>$request['date_received'],
                'control_number'=>$request['control_number'],
                'title'=>$request['title'],
            ]);
            self::attachDocumentDetail($document, $request);
        });
        return $request;
    }
    public function attachDocumentDetail($document, $request)
    {
        $document->document_detail()->create([
            'ncca_end_user_id'=> $request['ncca_end_user'],
            'office_concerned_id'=> $request['office_concerned'],
            'other_details'=> $request['other_details'],
            'authority_or_fund_source'=> $request['authority_or_fund_source'],
            'date_time_ready'=> $request['date_ready'],
            'date_time_released'=> $request['date_released'],
            'service_to_ncca'=> $request['service_to_ncca'],
            'concerned_party_or_supplier'=> $request['concerned_party_or_supplier'],
            'total_service_amount'=> $request['total_service_amount'],
        ]);
    }
}
