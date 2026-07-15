using NUnit.Framework;
using LeapYearCalculatorLib;

namespace LeapYearCalculatorLib.Tests
{
    [TestFixture]
    public class LeapYearCalculatorTests
    {
        private LeapYearCalculator calculator;

        [SetUp]
        public void SetUp()
        {
            calculator = new LeapYearCalculator();
        }

        // Leap Years
        [TestCase(2000, 1)]
        [TestCase(2024, 1)]
        [TestCase(2016, 1)]

        // Non-Leap Years
        [TestCase(2023, 0)]
        [TestCase(1900, 0)]
        [TestCase(2019, 0)]

        // Invalid Years
        [TestCase(1700, -1)]
        [TestCase(10000, -1)]

        public void CheckLeapYear_ReturnsExpectedResult(int year, int expected)
        {
            int actual = calculator.CheckLeapYear(year);

            Assert.That(actual, Is.EqualTo(expected));
        }
    }
}