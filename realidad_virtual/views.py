from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def github_webhook(request):
    if request.method == 'POST':
        # Maneja la solicitud del webhook aquí
        return JsonResponse({'status': 'success'})
    else:
        return JsonResponse({'status': 'failed'}, status=400)