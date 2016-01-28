# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-01-28 00:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import shop.models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0017_auto_20160127_2225'),
    ]

    operations = [
        migrations.CreateModel(
            name='CategoryImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to=shop.models.convert_file_name, verbose_name='Изображение')),
                ('ordering', models.PositiveSmallIntegerField(default=0, verbose_name='Сортировка')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.Category')),
            ],
            options={
                'verbose_name': 'Изображение категории',
                'verbose_name_plural': 'Изображения категорий',
                'ordering': ('ordering',),
            },
        ),
    ]
