# Generated by Django 4.1.3 on 2022-12-03 06:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("products", "0002_course_price"),
    ]

    operations = [
        migrations.AlterField(
            model_name="course",
            name="price",
            field=models.IntegerField(default=0),
        ),
    ]
