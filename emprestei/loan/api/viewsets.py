from rest_framework.viewsets import ModelViewSet
from loan.models import Loan
from .serializers import LoanSerializer

class LoanViewSet(ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer
    
    def get_queryset(self):
        print('entrou')
        user = self.request.query_params.get('user', None)
        
        queryset = Loan.objects.all()
        
        if(id):
            queryset = queryset.filter(acc_id = user)            
            
        return queryset
        