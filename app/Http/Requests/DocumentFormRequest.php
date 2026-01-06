<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DocumentFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'document_type'=>['integer', 'required'],
            'date_received'=>['date', 'nullable'],
            'title'=>['string', 'nullable'],
            'control_number'=>['string', 'nullable'],
            'complexity'=>['integer', 'nullable'],
            'other_details'=>['string', 'nullable'],
            'person_claiming_or_remarks'=>['string', 'nullable'],
            'authority_or_fund_source'=>['string', 'nullable'],
            'ncca_end_user'=>['integer', 'nullable'],
            'office_concerned'=>['integer', 'nullable'],
            'date_ready'=>['date', 'nullable'],
            'date_released'=>['date', 'nullable'],
            'service_to_ncca'=>['string', 'nullable'],
            'concerned_party_or_supplier'=>['string', 'nullable'],
            'total_service_amount'=>['numeric', 'nullable'],
        ];
    }
}
