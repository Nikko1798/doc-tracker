<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\DocumentTypeRepository;
class DocumentTypeController extends Controller
{
    //
    protected $docTypeRepository;
    public function __construct(DocumentTypeRepository $docTypeRepository)
    {
        $this->docTypeRepository=$docTypeRepository;
    }
    public function storeChildDocumentType(Request $request)
    {
        $docType=$this->docTypeRepository->storeChildDocumentType($request);
        return redirect()->back()->with('success', 'The document type has been added successfully.');
    }
}
