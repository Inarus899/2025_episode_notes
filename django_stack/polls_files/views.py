from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello <b>world</b>. You're at the polls index.")


# Create your views here.
