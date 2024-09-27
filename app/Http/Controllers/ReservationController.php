<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    
    public function index()
    {
        $reservations = Reservation::with('user')->get(); 
        return response()->json($reservations);
    }

    
    public function store(Request $request)
    {
       
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
        ]);

        
        $existingReservation = Reservation::where('reservation_date', $request->reservation_date)
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_time', [$request->start_time, $request->end_time])
                      ->orWhereBetween('end_time', [$request->start_time, $request->end_time])
                      ->orWhere(function ($query) use ($request) {
                          $query->where('start_time', '<', $request->start_time)
                                ->where('end_time', '>', $request->end_time);
                      });
            })
            ->exists();

       
        if ($existingReservation) {
            return response()->json(['error' => 'El horario solicitado ya está reservado. Por favor, elija otro rango de tiempo.'], 409);
        }

        
        $reservation = Reservation::create([
            'user_id' => $request->user_id,
            'reservation_date' => $request->reservation_date,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
        ]);

        return response()->json($reservation, 201);
    }

    public function show($id)
    {
        $reservation = Reservation::find($id);

        if (!$reservation) {
            return response()->json(['message' => 'Reservation not found'], 404);
        }

        return response()->json($reservation);
    }

    
    public function update(Request $request, $id)
    {
        $reservation = Reservation::find($id);

        if (!$reservation) {
            return response()->json(['error' => 'Reserva no encontrada'], 404);
        }

        
        $request->validate([
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
        ]);

       
        $existingReservation = Reservation::where('reservation_date', $request->reservation_date)
            ->where('id', '!=', $reservation->id)  
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_time', [$request->start_time, $request->end_time])
                      ->orWhereBetween('end_time', [$request->start_time, $request->end_time])
                      ->orWhere(function ($query) use ($request) {
                          $query->where('start_time', '<', $request->start_time)
                                ->where('end_time', '>', $request->end_time);
                      });
            })
            ->exists();

        
        if ($existingReservation) {
            return response()->json(['error' => 'El horario solicitado ya está reservado. Por favor, elija otro rango de tiempo.'], 409);
        }

    
        $reservation->update([
            'reservation_date' => $request->reservation_date,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
        ]);

        return response()->json($reservation, 200);
    }



   
    public function destroy($id)
    {
        $reservation = Reservation::find($id);
    
        if (!$reservation) {
            return response()->json(['message' => 'Reservación no encontrada'], 404);
        }
    
        $reservation->delete();
    
        return response()->json(['message' => 'Reservación eliminada correctamente'], 200);
    }
}