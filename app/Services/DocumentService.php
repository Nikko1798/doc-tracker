<?php

namespace App\Services;
use App\Repositories\DocumentRepository;
use Illuminate\Support\Facades\DB;
use App\Models\Employee;
use App\Models\Office;

use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Label\Label;
use Endroid\QrCode\Logo\Logo;
use Endroid\QrCode\RoundBlockSizeMode;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\Writer\ValidationException;

class DocumentService
{
    protected $documentRepository;
    public function __construct(DocumentRepository $documentRepository){
        $this->documentRepository=$documentRepository;
    }
    public function store($request)
    {
        try{
            return DB::transaction(function () use($request){
                $document=$this->documentRepository->store($request);
                $documentDetail=$this->documentRepository->attachDocumentDetail($document, $request);
                self::attachOfficeToDocumentDetail($request, $documentDetail);
                self::attachEmployeeToDocumentDetail($request, $documentDetail);
                return redirect()->back()->with('success', 'Saved successfully');
            });
        }
        catch(Exception $e){
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
    public function updateDocument($request, $document)
    {
        try{
            return DB::transaction(function () use($request, $document){
                $doc=$this->documentRepository->updateDocument($request, $document);
                $documentDetail=$this->documentRepository->attachDocumentDetail($document, $request);
                self::attachOfficeToDocumentDetail($request, $documentDetail);
                self::attachEmployeeToDocumentDetail($request, $documentDetail);
                return redirect()->back()->with('success', 'Updated successfully');
            });
        }
        catch(Exception $e)
        {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
    public function attachOfficeToDocumentDetail($request, $documentDetail)
    {
        if(empty($request['office_concerned']))
        {
            if(!empty($request['NewOfficeName']))
            {
                $office=Office::create([
                    'name'=>$request['NewOfficeName']
                ]);
                
                $office->document_details()->save($documentDetail);
            }
        }
        else {
            $office=Office::findOrFail($request['office_concerned']);
            $office->document_details()->save($documentDetail);
            
        }
    }
    public function attachEmployeeToDocumentDetail($request, $documentDetail)
    {
        if(empty($request['ncca_end_user']))
        {
            if(!empty($request['NewEmployeeName']))
            {
                $employee=Employee::create([
                    'name'=>$request['NewEmployeeName']
                ]);
                
                $employee->document_details()->save($documentDetail);
            }
        }
        else {
            $employee=Employee::findOrFail($request['ncca_end_user']);
            $employee->document_details()->save($documentDetail);
            
        }
    }
    public function fetchPublicDocuments($request)
    {
        $document=$this->documentRepository->fetchPublicDocuments($request);
        return $document;
    }
    public function fetchAllDocuments($request){
        $document=$this->documentRepository->fetchAllDocuments($request);
        return $document;
    }
    public function generateQr(){
        $writer = new PngWriter();
        $qrCode = new QrCode(
            data: 'google.com',
            encoding: new Encoding('UTF-8'),
            errorCorrectionLevel: ErrorCorrectionLevel::High,
            size: 300,
            margin: 5,
            roundBlockSizeMode: RoundBlockSizeMode::Margin,
            foregroundColor: new Color(66, 135, 245),
            backgroundColor: new Color(255, 255, 255)
        );

        $logo = new Logo(
            path: public_path('images/logo.png'),
            resizeToWidth: 80,
            punchoutBackground: false
        );

        $label = new Label(
            text: 'Scan Me',
            textColor: new Color(0, 0, 0)
        );

        $result = $writer->write($qrCode, $logo, $label);

        // Optional validation
        // $writer->validateResult($result, 'google.com');

        return response($result->getString())
            ->header('Content-Type', $result->getMimeType());
    }
}
