<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Validation\Rules\Password;
use Inertia\Inertia;
use Inertia\Response;

use App\Models\DocumentType;
use App\Models\Codetable;

use App\Services\DocumentService;
class DocumentController extends Controller
{
    //
    protected $documentService;
    public function __construct(DocumentService $documentService){
        $this->documentService=$documentService;
    }
    public function index(): Response
    {
        $documentTypes=DocumentType::select('id', 'name')->where('isParent', false)->get();
        $complexities=Codetable::where('codename', 'COMPLEXITY')->get();
        return Inertia::render('document/index', [
            'documentTypes'=>$documentTypes,
            'complexities' => $complexities
        ]);
    } 
    public function store(Request $request){
       return $this->documentService->store($request);
    } 
}
