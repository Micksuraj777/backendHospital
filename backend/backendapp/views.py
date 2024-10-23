from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import connection
from django.http import JsonResponse


class HomeAPI(APIView):
    def get(self, request):
        return HttpResponse("Server is alive")


class PatientAPI(APIView):
    # GET method to fetch all patients or a specific patient by ID
    def get(self, request, patient_id=None):
        cursor = connection.cursor()
        if patient_id:
            cursor.execute("SELECT * FROM patient WHERE patient_id = %s", [patient_id])
            patient = cursor.fetchone()
            if patient:
                data = {
                    "patient_id": patient[0],
                    "name": patient[1],
                    "phone_no": patient[2],
                    "address": patient[3],
                    "blood_group": patient[4],
                    "gender": patient[5],
                    "room": patient[6],
                    "status": patient[7],
                    "refer_doc": patient[8],
                    "date_of_join": patient[9],
                    "date_of_birth": patient[10],
                    "age": patient[11],
                }
                return JsonResponse(data)
            else:
                return Response(
                    {"error": "Patient not found"}, status=status.HTTP_404_NOT_FOUND
                )
        else:
            cursor.execute("SELECT * FROM patient")
            patients = cursor.fetchall()
            data = []
            for patient in patients:
                data.append(
                    {
                        "patient_id": patient[0],
                        "name": patient[1],
                        "phone_no": patient[2],
                        "address": patient[3],
                        "blood_group": patient[4],
                        "gender": patient[5],
                        "room": patient[6],
                        "status": patient[7],
                        "refer_doc": patient[8],
                        "date_of_join": patient[9],
                        "date_of_birth": patient[10],
                        "age": patient[11],
                    }
                )
            return JsonResponse(data, safe=False)

    # POST method to add a new patient
    def post(self, request):
        data = request.data
        cursor = connection.cursor()
        cursor.execute(
            """
            INSERT INTO patient (name, phone_no, address, blood_group, gender, room, status, refer_doc, date_of_birth, age)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """,
            [
                data["name"],
                data["phone_no"],
                data["address"],
                data["blood_group"],
                data["gender"],
                data["room"],
                data["status"],
                data["refer_doc"],
                data["date_of_birth"],
                data["age"],
            ],
        )
        return Response(
            {"message": "Patient created successfully"}, status=status.HTTP_201_CREATED
        )

    # PATCH method to update patient details
    def patch(self, request, patient_id):
        data = request.data
        cursor = connection.cursor()

        # Constructing dynamic SQL query based on fields provided in the request
        fields = []
        values = []
        if "name" in data:
            fields.append("name = %s")
            values.append(data["name"])
        if "phone_no" in data:
            fields.append("phone_no = %s")
            values.append(data["phone_no"])
        if "address" in data:
            fields.append("address = %s")
            values.append(data["address"])
        if "blood_group" in data:
            fields.append("blood_group = %s")
            values.append(data["blood_group"])
        if "gender" in data:
            fields.append("gender = %s")
            values.append(data["gender"])
        if "room" in data:
            fields.append("room = %s")
            values.append(data["room"])
        if "status" in data:
            fields.append("status = %s")
            values.append(data["status"])
        if "refer_doc" in data:
            fields.append("refer_doc = %s")
            values.append(data["refer_doc"])
        if "date_of_birth" in data:
            fields.append("date_of_birth = %s")
            values.append(data["date_of_birth"])
        if "age" in data:
            fields.append("age = %s")
            values.append(data["age"])

        if fields:
            values.append(patient_id)
            query = f"UPDATE patient SET {', '.join(fields)} WHERE patient_id = %s"
            cursor.execute(query, values)
            return Response(
                {"message": "Patient updated successfully"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"error": "No fields to update"}, status=status.HTTP_400_BAD_REQUEST
            )


class MedicineAPI(APIView):
    # GET method to fetch all medicines or a specific medicine by medicine ID
    def get(self, request, medicine_id=None):
        cursor = connection.cursor()
        if medicine_id:
            cursor.execute(
                "SELECT * FROM medicine WHERE medicine_id = %s", [medicine_id]
            )
            medicine = cursor.fetchone()
            if medicine:
                data = {
                    "medicine_id": medicine[0],
                    "name": medicine[1],
                    "dosage": medicine[2],
                    "manufacturer": medicine[3],
                    "price": medicine[4],
                    "status": medicine[5],
                }
                return JsonResponse(data)
            else:
                return Response(
                    {"error": "Medicine not found"}, status=status.HTTP_404_NOT_FOUND
                )
        else:
            cursor.execute("SELECT * FROM medicine")
            medicines = cursor.fetchall()
            data = []
            for medicine in medicines:
                data.append(
                    {
                        "medicine_id": medicine[0],
                        "name": medicine[1],
                        "dosage": medicine[2],
                        "manufacturer": medicine[3],
                        "price": medicine[4],
                        "status": medicine[5],
                    }
                )
            return JsonResponse(data, safe=False)


class DoctorAPI(APIView):
    # GET method to fetch all doctors or a specific doctor by doctor ID
    def get(self, request, doctor_id=None):
        cursor = connection.cursor()
        if doctor_id:
            cursor.execute("SELECT * FROM doctor WHERE doctor_id = %s", [doctor_id])
            doctor = cursor.fetchone()
            if doctor:
                data = {
                    "doctor_id": doctor[0],
                    "name": doctor[1],
                    "department": doctor[2],
                    "phone_no": doctor[3],
                    "status": doctor[4],
                }
                return JsonResponse(data)
            else:
                return Response(
                    {"error": "Doctor not found"}, status=status.HTTP_404_NOT_FOUND
                )
        else:
            cursor.execute("SELECT * FROM doctor")
            doctors = cursor.fetchall()
            data = []
            for doctor in doctors:
                data.append(
                    {
                        "doctor_id": doctor[0],
                        "name": doctor[1],
                        "department": doctor[2],
                        "phone_no": doctor[3],
                        "status": doctor[4],
                    }
                )
            return JsonResponse(data, safe=False)


class RoomAPI(APIView):
    # GET method to fetch all rooms or a specific room by room number
    def get(self, request, room_no=None):
        cursor = connection.cursor()
        if room_no:
            cursor.execute("SELECT * FROM room WHERE room_no = %s", [room_no])
            room = cursor.fetchone()
            if room:
                data = {
                    "room_no": room[0],
                    "patient_id": room[1],
                    "type": room[2],
                    "status": room[3],
                }
                return JsonResponse(data)
            else:
                return Response(
                    {"error": "Room not found"}, status=status.HTTP_404_NOT_FOUND
                )
        else:
            cursor.execute("SELECT * FROM room")
            rooms = cursor.fetchall()
            data = []
            for room in rooms:
                data.append(
                    {
                        "room_no": room[0],
                        "patient_id": room[1],
                        "type": room[2],
                        "status": room[3],
                    }
                )
            return JsonResponse(data, safe=False)
