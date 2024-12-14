from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet, PatientViewSet, AppointmentViewSet

router = DefaultRouter()
router.register('users', UserViewSet)
router.register('patients', PatientViewSet)
router.register('appointments', AppointmentViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
]
