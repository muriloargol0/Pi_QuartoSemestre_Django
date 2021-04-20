from rest_framework.viewsets import ModelViewSet
from account.models import Acc
from .serializers import AccSerializer

class AccViewSet(ModelViewSet):
    queryset = Acc.objects.all()
    serializer_class = AccSerializer