<?php

namespace App\Services;
use App\Repositories\DocumentRepository;
use Illuminate\Support\Facades\DB;
use App\Models\Employee;
use App\Models\Office;
use Illuminate\Support\Str;
use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Label\Label;
use Endroid\QrCode\Logo\Logo;
use Endroid\QrCode\RoundBlockSizeMode;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\Writer\ValidationException;
use Barryvdh\DomPDF\Facade\Pdf;

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
                // $qrPath=self::generateQr($document);
                
                return redirect()->back()
                ->with('success', 'Saved successfully')
                ->with('generatedrRoute', route('document.generateQr', $document->id));
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
    public function generateQr($document){
        $writer = new PngWriter();
        $qrCode = new QrCode(
            data: route('document.get-document', $document->id),
            encoding: new Encoding('UTF-8'),
            errorCorrectionLevel: ErrorCorrectionLevel::High,
            size: 300,
            margin: 5,
            roundBlockSizeMode: RoundBlockSizeMode::Margin,
            foregroundColor: new Color(10, 10, 10),
            backgroundColor: new Color(255, 255, 255)
        );

        $logo = new Logo(
            path: public_path('images/logo.png'),
            resizeToWidth: 80,
            punchoutBackground: true
        );

        $label = new Label(
            text: '',
            textColor: new Color(0, 0, 0)
        );

        $result = $writer->write($qrCode, null, $label);
       
        $filename = Str::random(50) . '.png';
        $qrPath = storage_path('app/' . $filename);
        $result->saveToFile($qrPath);
        return self::downloadQrInPdf($qrPath, $document);
    //     ->header('Content-Disposition', 'attachment; filename="'.$filename.'"');
    }
    public function downloadQrInPdf($imagepath, $document){
        $data = [
            'title' => $document->title,
            'date_received' => $document->date_received,
            'control_number' => $document->control_number,
            'image' => $imagepath
        ];

        $pdf = Pdf::loadView('pdf.generatedQr', $data)
            ->setPaper('A4', 'portrait');

        $filename = $document->title . '_' . Str::random(10) . '.pdf';
        return $pdf->download($filename);
    }
}
