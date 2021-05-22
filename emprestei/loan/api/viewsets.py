from rest_framework.viewsets import ModelViewSet
from loan.models import Loan
from .serializers import LoanSerializer

class LoanViewSet(ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer