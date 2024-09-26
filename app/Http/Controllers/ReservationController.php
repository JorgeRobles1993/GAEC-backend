<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    // Mostrar todas las reservaciones
    public function index()
    {
        $reservations = Reservation::with('user')->get(); // Asumiendo que tienes una relación con el modelo User
        return response()->json($reservations);
    }

    // Crear una nueva reservación
    public function store(Request $request)
    {
        // Validar la solicitud
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
        ]);

        // Verificar si ya existe una reserva en el mismo rango de tiempo
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

        // Si existe una reserva en el mismo rango de tiempo, devolver un error
        if ($existingReservation) {
            return response()->json(['error' => 'El horario solicitado ya está reservado. Por favor, elija otro rango de tiempo.'], 409);
        }

        // Crear la nueva reserva
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

    // Actualizar una reservación
    public function update(Request $request, $id)
    {
        $reservation = Reservation::find($id);

        if (!$reservation) {
            return response()->json(['error' => 'Reserva no encontrada'], 404);
        }

        // Validar la solicitud
        $request->validate([
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
        ]);

        // Verificar si ya existe una reserva en el mismo rango de tiempo (excepto la actual)
        $existingReservation = Reservation::where('reservation_date', $request->reservation_date)
            ->where('id', '!=', $reservation->id)  // Excluir la reserva actual de la verificación
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_time', [$request->start_time, $request->end_time])
                      ->orWhereBetween('end_time', [$request->start_time, $request->end_time])
                      ->orWhere(function ($query) use ($request) {
                          $query->where('start_time', '<', $request->start_time)
                                ->where('end_time', '>', $request->end_time);
                      });
            })
            ->exists();

        // Si existe una reserva en el mismo rango de tiempo, devolver un error
        if ($existingReservation) {
            return response()->json(['error' => 'El horario solicitado ya está reservado. Por favor, elija otro rango de tiempo.'], 409);
        }

        // Actualizar la reserva
        $reservation->update([
            'reservation_date' => $request->reservation_date,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
        ]);

        return response()->json($reservation, 200);
    }



    // Eliminar una reservación
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