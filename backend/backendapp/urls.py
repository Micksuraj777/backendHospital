from django.urls import path
from .views import PatientAPI, RoomAPI, DoctorAPI, MedicineAPI, HomeAPI
from .swagger import schema_view

urlpatterns = [
    path("", HomeAPI.as_view(), name="server_alive"),
    path(
        "swagger/",
        schema_view.with_ui("swagger", cache_timeout=0),
        name="schema-swagger-ui",
    ),
    path("patient/", PatientAPI.as_view(), name="patient_list"),
    path("patient/<int:patient_id>/", PatientAPI.as_view(), name="patient_detail"),
    path("room/", RoomAPI.as_view(), name="room_list"),
    path("room/<int:room_no>/", RoomAPI.as_view(), name="room_detail"),
    path("doctor/", DoctorAPI.as_view(), name="doctor_list"),
    path("doctor/<int:doctor_id>/", DoctorAPI.as_view(), name="doctor_detail"),
    path("medicine/", MedicineAPI.as_view(), name="medicine_list"),
    path("medicine/<int:medicine_id>/", MedicineAPI.as_view(), name="medicine_detail"),
]
