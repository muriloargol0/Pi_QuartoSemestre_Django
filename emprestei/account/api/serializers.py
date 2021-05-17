from rest_framework.serializers import ModelSerializer
from account.models import Acc

class AccSerializer(ModelSerializer):
    class Meta:
        model = Acc
        fields = ('id', 'acc_name', 'acc_dt_birthday', 'acc_username', 'acc_password', 'acc_email', 'acc_password_was_reset', 'stts_id')
	