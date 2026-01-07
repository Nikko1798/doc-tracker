<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Validation\Rules\Password;
use Inertia\Inertia;
use Inertia\Response;

use App\Models\DocumentType;
use App\Models\Codetable;
use App\Models\Office;
use App\Models\Employee;
use App\Models\Document;

use App\Repositories\DocumentRepository;
use App\Services\DocumentService;
use App\Http\Requests\DocumentFormRequest;
class DocumentController extends Controller
{
    //
    protected $documentService; 
    protected $documentRepository;
    public function __construct(DocumentService $documentService,DocumentRepository $documentRepository){
        $this->documentRepository=$documentRepository;
        $this->documentService=$documentService;
    }
    public function index(): Response
    {
        $documentTypes=DocumentType::select('id', 'name')
        ->where('isParent', false)->get();
        $complexities=Codetable::where('codename', 'COMPLEXITY')->get();
        $offices=Office::all();
        $employees=Employee::all();
        return Inertia::render('document/index', [
            'documentTypes'=>$documentTypes,
            'complexities' => $complexities,
            'offices'=>$offices,
            'employees'=>$employees,
        ]);
    } 
    public function store(DocumentFormRequest $request){
       return $this->documentService->store($request);
    } 
    public function updateDocument(DocumentFormRequest $request, Document $document)
    {
       return $this->documentService->updateDocument($request, $document);
    }
    public function fetchPublicDocuments(Request $request)
    {
        return $this->documentService->fetchPublicDocuments($request);
    }
    public function fetchAllDocuments(Request $request)
    {
        return $this->documentService->fetchAllDocuments($request);
    }
    public function updateDocumentStatus(Request $request, Document $document)
    {
        return $this->documentRepository->updateDocumentStatus($request, $document);
    }
    public function getDocument(Document $document)
    {
        return $this->documentRepository->getDocument($document);
    }
}
