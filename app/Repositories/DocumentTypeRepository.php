<?php

namespace App\Repositories;
use App\Models\DocumentType;

class DocumentTypeRepository
{
    public function storeChildDocumentType($request){
        $documentType=DocumentType::create([
            'name'=>$request['name'],
            'document_type_id'=>$request['parentId'],
            'isParent'=>false,
        ]);
        return $documentType;
    }
}
