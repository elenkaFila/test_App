import allure
from app import main

@allure.epic("Калькулятор")
@allure.feature("Арифметические операции")
class TestMain:

    @allure.story("Сложение чисел")
    @allure.severity(allure.severity_level.CRITICAL)
    def test_add(self):
        with allure.step("Выполнить сложение 2 + 3"):
            result = main.add(2, 3)
        with allure.step("Проверить, что результат равен 5"):
            assert result == 5

    @allure.story("Вычитание чисел")
    @allure.severity(allure.severity_level.NORMAL)
    def test_subtract(self):
        with allure.step("Выполнить вычитание 5 - 2"):
            result = main.subtract(5, 2)
        with allure.step("Проверить, что результат равен 3"):
            assert result == 3
