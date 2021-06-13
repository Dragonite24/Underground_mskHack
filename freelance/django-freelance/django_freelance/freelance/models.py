from django.db import models
from django.contrib.auth.models import User


# физлицо
class Individ(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    FIO = models.CharField(max_length=100)
    photo = models.ImageField(blank=True)
    SNILS = models.CharField(max_length=11, blank=True)
    about = models.CharField(max_length=500, blank=True)
    mobile = models.CharField(max_length=11, blank=True)
    social = models.CharField(max_length=500, blank=True)
    email = models.EmailField()
    comp = models.CharField(max_length=500, blank=True)
    education = models.OneToOneField('Education', on_delete=models.CASCADE, blank=True)
    position = models.OneToOneField('Position', on_delete=models.CASCADE, blank=True)
    team = models.OneToOneField('Team', on_delete=models.CASCADE, blank=True)


# лидер
class ProjectLeader(models.Model):
    individ = models.OneToOneField('Individ', on_delete=models.CASCADE, default='1')
    FIO = models.CharField(max_length=100)
    mobile = models.CharField(max_length=11, blank=True)
    email = models.EmailField(blank=True)
    team = models.OneToOneField('Team', on_delete=models.CASCADE, default='1')


# мероприятия
class Event(models.Model):
    EVENT_TYPE = [
        ('1', 'Exhibition'),
        ('2', 'Forum'),
        ('3', 'Session'),
        ('4', 'Round table'),
        ('5', 'Webinar'),
        ('6', 'Demo day'),
        ('7', 'Lecture'),
        ('8', 'On-line lecture'),
        ('9', 'Strategic session'),
    ]
    poster = models.ImageField(blank=True)
    name = models.CharField(max_length=75)
    short_desc = models.CharField(max_length=160)
    type = models.CharField(choices=EVENT_TYPE, default='1', max_length=1)
    date = models.DateField()
    time = models.TimeField()
    date_end = models.DateField(blank=True)
    time_end = models.TimeField(blank=True)
    full_desc = models.CharField(max_length=850, blank=True)
    address = models.CharField(max_length=160)
    contact_email = models.EmailField(blank=True)
    event_site = models.CharField(max_length=80, blank=True)
    team = models.ManyToManyField('Team', default=1, blank=True)


# Образование
class Education(models.Model):
    EDUCATION_DEGREE = [
        ('1', 'Undergraduate'),
        ('2', 'Masters degree'),
        ('3', 'Specialty'),
    ]
    institution = models.CharField(max_length=100)
    specialization = models.CharField(max_length=30)
    degree = models.CharField(choices=EDUCATION_DEGREE, default='1', max_length=1)


# должность
class Position(models.Model):
    name_company = models.CharField(max_length=30)
    post = models.CharField(max_length=30)
    start_date = models.DateField()
    end_date = models.DateField()
    duty = models.CharField(max_length=30)


# проект
class Project(models.Model):
    PROJECT_BRANCH = [
        ('1', 'Космос'),
        ('2', 'Aviation'),
        ('3', 'Agriculture'),
        ('4', 'Biotech'),
        ('5', 'Yadertech'),
        ('6', 'Building'),
        ('7', 'Fashion'),
        ('8', 'Energy'),
        ('9', 'Finance'),
        ('10', 'Food'),
        ('11', 'Games'),
        ('12', 'Medicine'),
        ('13', 'Jurisprudence'),
        ('14', 'Shipping'),
        ('15', 'Nanotechnology'),
        ('16', 'Oil and gas'),
        ('17', 'Trade'),
        ('18', 'Safety'),
        ('19', 'IT'),
        ('20', 'Education'),
        ('21', 'Ecology'),
        ('22', 'Lifestyle'),
        ('23', 'Mechanical engineering'),
        ('24', 'Microelectronics'),
        ('25', 'Other'),
    ]
    branch = models.CharField(choices=PROJECT_BRANCH, default='1', max_length=2)
    name = models.CharField(max_length=200)
    poster = models.ImageField(blank=True)
    about = models.OneToOneField('About', on_delete=models.CASCADE, default='1')
    team = models.OneToOneField('Team', on_delete=models.CASCADE, default='1')
    product = models.OneToOneField('Product', on_delete=models.CASCADE, default='1')


class Team(models.Model):
    comp = models.CharField(max_length=500, default='none')
    name = models.CharField(max_length=30)
    desc = models.CharField(max_length=500)
    poster = models.ImageField(blank=True)


class Product(models.Model):
    PRODUCT_STAGE = [
        ('1', 'Idea'),
        ('2', 'Demo sample'),
        ('3', 'Product'),
        ('4', 'Scaling'),
    ]
    desc = models.CharField(max_length=500)
    advantage = models.CharField(max_length=500)
    stage = models.CharField(choices=PRODUCT_STAGE, default='1', max_length=1)


class Lounge(models.Model):
    need = models.CharField(max_length=500)
    use = models.CharField(max_length=500)
    capacity = models.CharField(max_length=500)
    competitors = models.CharField(max_length=500)


class About(models.Model):
    date_start = models.DateField()
    exp = models.CharField(max_length=500)
    resources = models.CharField(max_length=500)
    current = models.CharField(max_length=500)
    model = models.CharField(max_length=500)
    plan = models.CharField(max_length=500)
