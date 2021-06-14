from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', ]


class CreateIndiVidSerializer(serializers.ModelSerializer):
    class Meta:
        model = Individ
        fields = '__all__'


class EducationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Event
        fields = '__all__'


class PositionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class TeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class IndividSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    education = EducationSerializer()
    position = PositionSerializer();
    team = TeamSerializer();

    class Meta:
        model = Individ
        fields = '__all__'


class CreateEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class EventSerializer(serializers.ModelSerializer):
    team = TeamSerializer();

    class Meta:
        model = Event
        fields = '__all__'


class CreateEducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = '__all__'


class AboutSerializer(serializers.ModelSerializer):
    class Meta:
        model = About
        fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class ProjectSerializer(serializers.ModelSerializer):
    about = AboutSerializer();
    team = TeamSerializer();
    product = ProductSerializer();

    class Meta:
        model = Project
        fields = '__all__'


class CreateProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class LoungeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lounge
        fields = '__all__'




