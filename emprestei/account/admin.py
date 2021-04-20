from django.contrib import admin
from .models import Acc, SecurityQuestion, Stts

# Register your models here.

admin.site.register(Stts)
admin.site.register(SecurityQuestion)
admin.site.register(Acc)