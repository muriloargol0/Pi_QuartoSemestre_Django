from django.db import models

class Stts(models.Model):
    stts_description = models.CharField(max_length=200, blank=False)
    
    class Meta:
        verbose_name = "Stts"
        verbose_name_plural = "Stts"
        
    def __str__(self):
        return self.stts_description

class Acc(models.Model):
    acc_name = models.CharField(blank=False, max_length=200)
    acc_dt_birthday = models.DateField(blank=False)
    acc_username = models.CharField(blank=False, max_length=30)
    acc_password = models.CharField(blank=False, max_length=20)
    acc_email = models.CharField(blank=False, max_length=200)
    acc_password_was_reset = models.BooleanField(default=False)
    stts_id = models.ForeignKey(Stts, on_delete=models.RESTRICT)
	
    class Meta:
        verbose_name = "Acc"
        verbose_name_plural = "Acc"
        
    def __str__(self):
        return self.acc_name


