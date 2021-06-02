from rest_framework.viewsets import ModelViewSet
from account.models import Acc
from .serializers import AuthenticateSerializer
from rest_framework.response import Response
from rest_framework_jwt.settings import api_settings

class AuthenticateViewSet(ModelViewSet):
    serializer_class = AuthenticateSerializer
    queryset = Acc.objects.all()
    
    def create(self, request, *args, **kwargs):
        username = request.data['username']
        password = request.data['password']
        
        queryset = Acc.objects.all()
        users = queryset.filter(acc_username=username, acc_password=password)
        
        jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
        jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

        if(users.count() > 0):
            payload = jwt_payload_handler(username)
            token = jwt_encode_handler(payload)
            return Response({'username': username, 'password': password, 'token': token})
        else:
            return Response({'error: Usuário e senha inválidos!'})