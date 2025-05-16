from app import main

class TestMain:
    def test_add(self):
        assert main.add(2, 3) == 5

    def test_subtract(self):
        assert main.subtract(5, 2) == 3
