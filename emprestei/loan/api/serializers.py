from rest_framework.serializers import ModelSerializer
from loan.models import Loan

class LoanSerializer(ModelSerializer):
    class Meta:
        model = Loan
        fields = ('id', 'acc_id', 'loan_to_name', 'loan_description', 'loan_date', 'loan_observation', 'loan_return_date', 'loan_estimated_value')
	