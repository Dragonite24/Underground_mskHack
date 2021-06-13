from django.shortcuts import render
from rest_framework.generics import get_object_or_404
from rest_framework.mixins import CreateModelMixin
from rest_framework.response import Response
from rest_framework import generics, permissions, status, mixins
from rest_framework.views import APIView
from rest_framework.exceptions import PermissionDenied
from rest_framework.renderers import JSONRenderer

from .models import *
from .serializers import *
from .recomm import getRecomms
import json


class UserListView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class Logout(APIView):

    def get(self, request, format=None):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_200_OK)


class IndividRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Individ.objects.all()
    serializer_class = IndividSerializer


class IndividUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Individ.objects.all()
    serializer_class = CreateIndiVidSerializer


class IndividListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Individ.objects.all()
    serializer_class = IndividSerializer


class IndividCreateView(generics.ListCreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Individ.objects.all()
    serializer_class = CreateIndiVidSerializer
    permission_classes = (permissions.IsAuthenticated,)


class EventRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Event.objects.all()
    serializer_class = EventSerializer


class EventUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Event.objects.all()
    serializer_class = CreateEventSerializer


class EventListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Event.objects.all()
    serializer_class = ListEventSerializer


class EventCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Individ.objects.all()
    serializer_class = CreateEventSerializer


class EducationRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Education.objects.all()
    serializer_class = EducationSerializer


class EducationUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Education.objects.all()
    serializer_class = CreateEducationSerializer


class EducationListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Education.objects.all()
    serializer_class = EducationSerializer


class EducationCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Education.objects.all()
    serializer_class = CreateEducationSerializer


class AboutRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = About.objects.all()
    serializer_class = AboutSerializer


class AboutCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    serializer_class = AboutSerializer


class ProjectRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Project.objects.all()
    serializer_class = CreateProjectSerializer


class ProjectListView(generics.ListAPIView):
    renderer_classes = (JSONRenderer,)
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Project.objects.all()
    serializer_class = CreateProjectSerializer


class PositionRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class PositionCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Position.objects.all()
    serializer_class = PositionSerializer


class TeamRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class TeamCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Team.objects.all()
    serializer_class = TeamSerializer


class ProductRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class ProductCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class LoungeRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class LoungeCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = Lounge.objects.all()
    serializer_class = LoungeSerializer


class ProjectLeaderRetrieveView(generics.RetrieveAPIView):
    renderer_classes = [JSONRenderer]
    queryset = ProjectLeader.objects.all()
    serializer_class = ProjectLeader


class ProjectLeaderUpdateView(generics.UpdateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = ProjectLeader.objects.all()
    serializer_class = CreateProjectLeaderSerializer


class ProjectLeaderListView(generics.ListAPIView):
    renderer_classes = [JSONRenderer]
    queryset = ProjectLeader.objects.all()
    serializer_class = ProjectLeaderSerializer


class ProjectLeaderCreateView(generics.CreateAPIView):
    renderer_classes = [JSONRenderer]
    queryset = ProjectLeader.objects.all()
    serializer_class = CreateProjectLeaderSerializer


def recommend_team(request, user_id):
    data = [
        [0, 1, 2, 2],
        [2, 1, 1, 1],
        [0, 2, 1, 1],
        [2, 2, 1, 0],
    ]
    return json.dumps(
        getRecomms(
            data,
            user_id
        )
    )
