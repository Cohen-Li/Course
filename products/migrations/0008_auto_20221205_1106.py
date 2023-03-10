# Generated by Django 3.2.4 on 2022-12-05 04:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0007_auto_20221204_1227'),
    ]

    operations = [
        migrations.AddField(
            model_name='variation',
            name='discount_price',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='variation',
            name='discount_percentage',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='variation',
            name='sale_price',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
    ]
