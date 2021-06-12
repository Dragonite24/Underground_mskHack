from django.urls import path, include
# from rest_framework.authtoken.views import obtain_auth_token
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import *

urlpatterns = [
    path('auth/', include('djoser.urls')),
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    path('individ/<int:pk>', IndividRetrieveView.as_view()),
    path('individ/update/<int:pk>', IndividUpdateView.as_view()),
    path('individ/all', IndividListView.as_view()),
    path('individ/new', IndividCreateView.as_view()),

    path('event/<int:pk>', EventRetrieveView.as_view()),
    path('event/update/<int:pk>', EventUpdateView.as_view()),
    path('event/all', EventListView.as_view()),
    path('event/new', EventCreateView.as_view()),

    path('education/<int:pk>', EducationRetrieveView.as_view()),
    path('education/update/<int:pk>', EducationUpdateView.as_view()),
    path('education/all', EducationListView.as_view()),
    path('education/new', EducationCreateView.as_view()),

    path('about/<int:pk>', AboutRetrieveView.as_view()),
    path('about/update/<int:pk>', AboutUpdateView.as_view()),
    path('about/all', AboutListView.as_view()),
    path('about/new', AboutCreateView.as_view()),

    path('project/<int:pk>', ProjectRetrieveView.as_view()),
    path('project/update/<int:pk>', ProjectUpdateView.as_view()),
    path('project/all', ProjectListView.as_view()),
    path('project/new', ProjectCreateView.as_view()),

    path('position/<int:pk>', PositionRetrieveView.as_view()),
    path('position/update/<int:pk>', PositionUpdateView.as_view()),
    path('position/all', PositionListView.as_view()),
    path('position/new', PositionCreateView.as_view()),

    path('team/<int:pk>', TeamRetrieveView.as_view()),
    path('team/update/<int:pk>', TeamUpdateView.as_view()),
    path('team/all', TeamListView.as_view()),
    path('team/new', TeamCreateView.as_view()),

    path('product/<int:pk>', ProductRetrieveView.as_view()),
    path('product/update/<int:pk>', ProductUpdateView.as_view()),
    path('product/all', ProductListView.as_view()),
    path('product/new', ProductCreateView.as_view()),

    path('lounge/<int:pk>', LoungeRetrieveView.as_view()),
    path('lounge/update/<int:pk>', LoungeUpdateView.as_view()),
    path('lounge/all', LoungeListView.as_view()),
    path('lounge/new', LoungeCreateView.as_view()),
]
