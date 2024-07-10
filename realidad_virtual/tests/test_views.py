from django.test import TestCase
from django.urls import reverse
from django.http import HttpResponse
from django.shortcuts import render

class IndexViewTests(TestCase):
    def test_index_view(self):
        url = reverse('index')  # Asegúrate de que 'index' sea el nombre correcto de la vista
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        
        # Convertir el contenido de la respuesta a minúsculas para ignorar mayúsculas/minúsculas
        content = response.content.decode().lower()
        
        # Verificar que la frase "hola mundo" está presente en el contenido de la respuesta
        self.assertIn("hola mundo", content)
