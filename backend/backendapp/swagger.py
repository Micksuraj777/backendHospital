from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Hospital Management API",
        default_version="v1",
        description="API documentation for managing hospital records including patients, doctors, rooms, and medicines.",
        terms_of_service="https://www.example.com/terms/",
        contact=openapi.Contact(email="support@hospitalapi.local"),
        license=openapi.License(name="MIT License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)
