<?php

namespace App\Services;
use App\Repositories\DocumentRepository;
class DocumentService
{
    protected $documentRepository;
    public function __construct(DocumentRepository $documentRepository){
        $this->documentRepository=$documentRepository;
    }
    public function store($request)
    {
        return $this->documentRepository->store($request);
    }
}
