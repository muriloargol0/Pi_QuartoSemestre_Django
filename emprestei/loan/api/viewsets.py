from rest_framework.viewsets import ModelViewSet
from loan.models import Loan
from .serializers import LoanSerializer

class LoanViewSet(ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer
    
    def get_queryset(self):
        print('entrou')
        user = self.request.query_params.get('user', None)
        loan = self.request.query_params.get('loan', None)
        queryset = Loan.objects.all()
        
        if(user):
            queryset = queryset.filter(acc_id = user)    
        
        if(loan):
            queryset = queryset.filter(id = loan)    
                
        return queryset
    
    
        