from django.core.exceptions import ValidationError


def validate_png(image):
    name: str = image.name
    if not name.lower().endswith(".png"):
        raise ValidationError("Imagem não está no formato de PNG")
