# Generated by Django 3.2 on 2021-05-26 00:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('loan', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='loan',
            name='loan_description',
            field=models.CharField(default='', max_length=200),
        ),
    ]
