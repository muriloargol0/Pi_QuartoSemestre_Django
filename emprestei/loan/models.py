from django.db import models
from account.models import Acc

class Loan(models.Model):
    acc_id = models.ForeignKey(Acc, on_delete=models.RESTRICT)
    loan_to_name = models.CharField(blank=False, max_length = 200)
    loan_description = models.CharField(max_length=200, default='')
    loan_date = models.DateField(blank=False)
    loan_observation = models.CharField(blank = False, max_length = 200)
    loan_return_date = models.DateField(blank=False)
    loan_estimated_value = models.DecimalField(max_digits=6, decimal_places=2)
	
    class Meta:
        verbose_name = "Loan"
        verbose_name_plural = "Loan"
        
    def __str__(self):
        return self.loan_to_name


