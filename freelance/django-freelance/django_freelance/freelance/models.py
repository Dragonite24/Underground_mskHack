from django.db import models
from django.contrib.auth.models import User


# физлицо
class Individ(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    FIO = models.CharField(max_length=100)
    photo = models.ImageField()
    SNILS = models.CharField(max_length=11)
    about = models.CharField(max_length=500)
    mobile = models.CharField(max_length=11)
    social = models.CharField(max_length=500)
    email = models.EmailField()
    is_capitan = models.BooleanField(default=0)
    compititions = models.CharField(max_length=500)
    education = models.OneToOneField('Education', on_delete=models.CASCADE, default='1')
    position = models.OneToOneField('Position', on_delete=models.CASCADE, default='1')
    team = models.OneToOneField('Team', on_delete=models.CASCADE, default='1')


# мероприятия
class Event(models.Model):
    EVENT_TYPE = [
        ('1', 'Выставка'),
        ('2', 'Форум'),
        ('3', 'Сессия'),
        ('4', 'Круглый стол'),
        ('5', 'Вебинар'),
        ('6', 'Демо-день'),
        ('7', 'Лекция'),
        ('8', 'On-line лекция'),
        ('9', 'Стратегическая сессия'),
    ]
    poster = models.ImageField()
    name = models.CharField(max_length=75)
    short_desc = models.CharField(max_length=160)
    type = models.CharField(choices=EVENT_TYPE, default='1', max_length=1)
    date = models.DateField()
    time = models.TimeField()
    full_desc = models.CharField(max_length=850)
    adress = models.CharField(max_length=160)
    contact_email = models.EmailField()
    event_site = models.CharField(max_length=80)
    team = models.OneToOneField('Team', on_delete=models.CASCADE, default='1')


# Образование
class Education(models.Model):
    EDUCATION_DEGREE = [
        ('1', 'Бакалавриат'),
        ('2', 'Магистратура'),
        ('3', 'Специалитет'),
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
        ('2', 'Авиация'),
        ('3', 'Сельское хозяйства'),
        ('4', 'Биотех'),
        ('5', 'Ядертех'),
        ('6', 'Строительство'),
        ('7', 'Мода'),
        ('8', 'Энергетика'),
        ('9', 'Финансы'),
        ('10', 'Питание'),
        ('11', 'Игры'),
        ('12', 'Медицина'),
        ('13', 'Юриспруденция'),
        ('14', 'Судоходство'),
        ('15', 'Нанотехнологии'),
        ('16', 'Нефть и газ'),
        ('17', 'Торговля'),
        ('18', 'Безопасность'),
        ('19', 'IT'),
        ('20', 'Образование'),
        ('21', 'Экология'),
        ('22', 'Образ жизни'),
        ('23', 'Машиностроение'),
        ('24', 'Микроэлектроника'),
        ('25', 'Другое'),
    ]
    branch = models.CharField(choices=PROJECT_BRANCH, default='1', max_length=2)
    name = models.CharField(max_length=200)
    poster = models.ImageField()
    about = models.OneToOneField('About', on_delete=models.CASCADE, default='1')
    team = models.OneToOneField('Team', on_delete=models.CASCADE, default='1')
    product = models.OneToOneField('Product', on_delete=models.CASCADE, default='1')


class Team(models.Model):
    name = models.CharField(max_length=30)
    desc = models.CharField(max_length=500)


class Product(models.Model):
    PRODUCT_STAGE = [
        ('1', 'Идея'),
        ('2', 'Демонстрационный образец'),
        ('3', 'Продукт'),
        ('4', 'Масштабирование'),
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
