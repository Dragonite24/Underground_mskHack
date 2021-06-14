from django.shortcuts import render
from rest_framework.response import Response
from rest_framework import generics, permissions, status
from rest_framework.views import APIView
from rest_framework.exceptions import PermissionDenied

from .models import *
from .serializers import *


class UserListView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class Logout(APIView):

    def get(self, request, format=None):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_200_OK)


class IndividRetrieveView(generics.RetrieveAPIView):
    queryset = Individ.objects.all()
    serializer_class = IndividSerializer


class IndividUpdateView(generics.UpdateAPIView):
    queryset = Individ.objects.all()
    serializer_class = CreateIndiVidSerializer


class IndividListView(generics.ListAPIView):
    queryset = Individ.objects.all()
    serializer_class = IndividSerializer


class IndividCreateView(generics.CreateAPIView):
    queryset = Individ.objects.all()
    serializer_class = CreateIndiVidSerializer


class EventRetrieveView(generics.RetrieveAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class EventUpdateView(generics.UpdateAPIView):
    queryset = Event.objects.all()
    serializer_class = CreateEventSerializer


class EventListView(generics.ListAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class EventCreateView(generics.CreateAPIView):
    queryset = Individ.objects.all()
    serializer_class = CreateEventSerializer


class EducationRetrieveView(generics.RetrieveAPIView):
    queryset = Education.objects.all()
    serializer_class = EducationSerializer


class EducationUpdateView(generics.UpdateAPIView):
    queryset = Education.objects.all()
    serializer_class = CreateEducationSerializer


class EducationListView(generics.ListAPIView):
    queryset = Education.objects.all()
    serializer_class = EducationSerializer


class EducationCreateView(generics.CreateAPIView):
    queryset = Education.objects.all()
    serializer_class = CreateEducationSerializer


class AboutRetrieveView(generics.RetrieveAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutUpdateView(generics.UpdateAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutListView(generics.ListAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutCreateView(generics.CreateAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class ProjectRetrieveView(generics.RetrieveAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectUpdateView(generics.UpdateAPIView):
    queryset = Project.objects.all()
    serializer_class = CreateProjectSerializer


class ProjectListView(generics.ListAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectCreateView(generics.CreateAPIView):
    queryset = Project.objects.all()
    serializer_class = CreateProjectSerializer


class PositionRetrieveView(generics.RetrieveAPIView):
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionUpdateView(generics.UpdateAPIView):
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionListView(generics.ListAPIView):
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionCreateView(generics.CreateAPIView):
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class TeamRetrieveView(generics.RetrieveAPIView):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamUpdateView(generics.UpdateAPIView):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamListView(generics.ListAPIView):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamCreateView(generics.CreateAPIView):
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class ProductRetrieveView(generics.RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductUpdateView(generics.UpdateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductListView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductCreateView(generics.CreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class LoungeRetrieveView(generics.RetrieveAPIView):
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeUpdateView(generics.UpdateAPIView):
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeListView(generics.ListAPIView):
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeCreateView(generics.CreateAPIView):
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer

