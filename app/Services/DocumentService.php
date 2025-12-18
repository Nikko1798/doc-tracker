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
        try{
            $document=$this->documentRepository->store($request);
            return redirect()->back()->with('success', 'Saved successfully');
        }
        catch(Exception $e){
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
