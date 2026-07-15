using NUnit.Framework;
using CalcLibrary;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorTests
    {
        private SimpleCalculator calculator;

        [SetUp]
        public void SetUp()
        {
            calculator = new SimpleCalculator();
        }

        [TearDown]
        public void TearDown()
        {
            calculator.AllClear();
        }

        [TestCase(10, 20, 30)]
        [TestCase(5, 5, 10)]
        [TestCase(-5, 5, 0)]
        [TestCase(2.5, 2.5, 5)]
        public void Addition_ReturnsExpectedResult(double num1, double num2, double expected)
        {
            double actual = calculator.Addition(num1, num2);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}