<?php

namespace App\Repositories;
use Illuminate\Support\Facades\DB;
use App\Models\Document;

class DocumentRepository
{
    public function store($request){
        // DB::transaction(function () use($request){
           
        // });
        $document=Document::create([
            'complexity_id'=>$request['complexity'],
            'document_type_id'=>$request['document_type'],
            'date_received'=>$request['date_received'],
            'time_received'=>$request['time_received'],
            'control_number'=>$request['control_number'],
            'title'=>$request['title'],
        ]);
        return $document;
    }
    public function updateDocument($request, $document)
    {
        $doc=$document->update([
            'complexity_id'=>$request['complexity'],
            'document_type_id'=>$request['document_type'],
            'date_received'=>$request['date_received'],
            'control_number'=>$request['control_number'],
            'title'=>$request['title'],
        ]);
        return $doc;
    }
    public function attachDocumentDetail($document, $request)
    {
        $documentDetail=$document->document_detail()->updateOrCreate(
            [],
            [
            // 'ncca_end_user_id'=> $request['ncca_end_user'],
            // 'office_concerned_id'=> $request['office_concerned'],
            'other_details'=> $request['other_details'],
            'remarks'=> $request['person_claiming_or_remarks'],
            'authority_or_fund_source'=> $request['authority_or_fund_source'],
            'date_ready'=> $request['date_ready'],
            'date_released'=> $request['date_released'],
            'time_released'=> $request['time_released'],
            'service_to_ncca'=> $request['service_to_ncca'],
            'concerned_party_or_supplier'=> $request['concerned_party_or_supplier'],
            'total_service_amount'=> $request['total_service_amount'],
            'project_or_program'=>$request['title'],
        ]);
        return $documentDetail;
    }
    public function attachToEmployee($employee, $documentDetail)
    {
        $employee->document_details()->save($documentDetail);
    }
    public function attachToOffice($office, $documentDetail)
    {
        $office->document_details()->save($documentDetail);
    }
    public function fetchPublicDocuments($request){
        $perPage = $request->input('perPage', 10); // Default to 10 per page
        $page = $request->input('page', 1); // Default page 1
        $doc= Document::select('documents.id', 'documents.document_type_id', 'documents.complexity_id',
                'documents.date_received',
                'documents.time_received',
                'documents.title',
                'documents.control_number',
                'document_details.document_id',
                'document_details.ncca_end_user_id',
                'document_details.office_concerned_id',
                'document_details.concerned_party_or_supplier',
                'document_details.service_to_ncca',
                'document_details.other_details',
                'document_details.project_or_program',
                'document_details.authority_or_fund_source',
                'document_details.date_ready',
                'document_details.date_released',
                'document_details.time_released',
                'document_details.remarks', 'employees.name as ncca_end_user' , 
                'offices.name as office_concerned','codetables.codevalue as complexity',
                 'document_types.name as document_type', 'document_status.codevalue as document_status')
            ->leftJoin('document_details', 'document_details.document_id', 'documents.id')
            ->leftJoin('employees', 'employees.id', 'document_details.ncca_end_user_id')
            ->leftJoin('offices', 'offices.id', 'document_details.office_concerned_id')
            ->leftJoin('document_types', 'document_types.id', 'documents.document_type_id')
            ->leftJoin('codetables', 'codetables.id', 'documents.complexity_id')
            ->leftJoin('codetables as document_status', 'document_status.id', 'documents.document_status_id')
            ->where(function ($query) use ($request){
                $query->where('documents.document_type_id', $request->document_type)
                ->orWhere('document_types.document_type_id', $request->document_type);
            })
            ->where(function ($query) use ($request){
                $query->where('documents.title', 'like', '%' . $request->name . '%')
                ->orWhere('documents.control_number', 'like', '%' . $request->name . '%')
                ->orWhere('documents.control_number', 'like', '%' . $request->name . '%')
                ->orWhere('document_details.other_details', 'like', '%' . $request->name . '%')
                ->orWhere('offices.name', 'like', '%' . $request->name . '%')
                ->orWhere('document_types.name', 'like', '%' . $request->name . '%')
                ->orWhere('document_details.remarks', 'like', '%' . $request->name . '%')
                ->orWhere('employees.name', 'like', '%' . $request->name . '%');
            });
    
            if(isset($request->sortBy))
            {
                $doc->orderBy($request->sortBy, $request->sortOrder);
            }
            return  $doc->paginate($perPage, ['*'], 'page', $page);
    }
    public function fetchAllDocuments($request){
        $perPage = $request->input('perPage', 10); // Default to 10 per page
        $page = $request->input('page', 1); // Default page 1
        $doc= Document::select('documents.id', 'documents.document_type_id', 'documents.complexity_id',
                'documents.date_received',
                'documents.time_received',
                'documents.title','documents.document_status_id',
                'documents.control_number',
                'document_details.document_id',
                'document_details.ncca_end_user_id',
                'document_details.office_concerned_id',
                'document_details.other_details',
                'document_details.project_or_program',
                'document_details.authority_or_fund_source', 'document_details.date_ready',
                'document_details.date_released',
                'document_details.time_released',
                'document_details.remarks',
                'document_details.service_to_ncca',
                'document_details.concerned_party_or_supplier',
                'document_details.total_service_amount', 'employees.name as ncca_end_user' , 'offices.name as office_concerned','codetables.codename as complexity', 'document_types.name as document_type')
            ->leftJoin('document_details', 'document_details.document_id', 'documents.id')
            ->leftJoin('employees', 'employees.id', 'document_details.ncca_end_user_id')
            ->leftJoin('offices', 'offices.id', 'document_details.office_concerned_id')
            ->leftJoin('document_types', 'document_types.id', 'documents.document_type_id')
            ->leftJoin('codetables', 'codetables.id', 'documents.complexity_id')
            ->where(function ($query) use ($request){
                $query->where('documents.document_type_id', $request->document_type)
                ->orWhere('document_types.document_type_id', $request->document_type);
            })
            ->where(function ($query) use ($request){
                $query->where('documents.title', 'like', '%' . $request->name . '%')
                ->orWhere('documents.control_number', 'like', '%' . $request->name . '%')
                ->orWhere('documents.control_number', 'like', '%' . $request->name . '%')
                ->orWhere('document_details.other_details', 'like', '%' . $request->name . '%')
                ->orWhere('offices.name', 'like', '%' . $request->name . '%')
                ->orWhere('document_types.name', 'like', '%' . $request->name . '%')
                ->orWhere('document_details.remarks', 'like', '%' . $request->name . '%')
                ->orWhere('employees.name', 'like', '%' . $request->name . '%');
            });
    
            if(isset($request->sortBy))
            {
                $doc->orderBy($request->sortBy, $request->sortOrder);
            }
            return  $doc->paginate($perPage, ['*'], 'page', $page);
    }
    public function updateDocumentStatus($request, $document)
    {
        $doc=$document->update([
            'document_status_id'=> empty($request['doc_status']) ? null : $request['doc_status']
        ]);
        return $doc;
    }
    public function getDocument($document)
    {
        return $document;
    }
}
