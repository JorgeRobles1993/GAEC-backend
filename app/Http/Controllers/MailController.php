<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactMail;

class MailController extends Controller
{
    public function sendMail(Request $request)
    {
        // Temporalmente comenta la validación
        // $request->validate([
        //     'to' => 'required|email',
        //     'subject' => 'required|string',
        //     'message' => 'required|string',
        // ]);
    
        Log::info('Received request:', $request->all());
    
        $details = [
            'subject' => $request->subject ?? 'Sin Asunto',
            'message' => $request->message ?? 'Sin Mensaje',
        ];
    
        try {
            Mail::to($request->to ?? 'default@example.com')->send(new ContactMail($details));
            return response()->json(['message' => 'Mail sent successfully!'], 200);
        } catch (\Exception $e) {
            Log::error('Error sending mail: ' . $e->getMessage());
            return response()->json(['message' => 'Error sending mail: ' . $e->getMessage()], 500);
        }
    }
}
