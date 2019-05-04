import logging
import os

from django.core.management.base import BaseCommand

from app.models import User

log = logging.getLogger(__name__)


class Command(BaseCommand):

    def handle(self, *args, **options):
        password = os.environ['APP_ADMIN_PASSWORD']
        admin, _ = User.objects.update_or_create(
            username='admin',
            email='admin@example.org',
        )
        assert isinstance(admin, User)
        admin.is_superuser = True
        admin.is_staff = True
        admin.set_password(password)
        admin.save()
