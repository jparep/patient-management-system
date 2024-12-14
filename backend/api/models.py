from django.db import models
import uuid

class Role(models.Model):
    name = models.CharField(max_length=50, unique=True)

class Gender(models.Model):
    name = models.CharField(max_length=10, unique=True)

class Status(models.Model):
    name = models.CharField(max_length=20, unique=True)

class User(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    role = models.ForeignKey(Role, on_delete=models.CASCADE)

class Patient(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField()
    gender = models.ForeignKey(Gender, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=15, unique=True)
    email = models.EmailField(null=True, blank=True)
    address = models.TextField(null=True, blank=True)

class Appointment(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    doctor = models.ForeignKey(User, on_delete=models.CASCADE)
    appointment_date = models.DateField()
    appointment_time = models.TimeField()
    status = models.ForeignKey(Status, on_delete=models.CASCADE)
