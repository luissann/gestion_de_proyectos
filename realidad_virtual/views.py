from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return HttpResponse("¡Hola Mundo con DevOpss!")