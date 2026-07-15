using NUnit.Framework;
using CalcLibrary;
using System;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorAdvancedTests
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

        // -----------------------------
        // Test Subtraction
        // -----------------------------

        [TestCase(20, 10, 10)]
        [TestCase(10, 20, -10)]
        [TestCase(-10, -5, -5)]
        [TestCase(15.5, 5.5, 10)]
        public void TestSubtraction(double num1, double num2, double expected)
        {
            double actual = calculator.Subtraction(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Test Multiplication
        // -----------------------------

        [TestCase(10, 5, 50)]
        [TestCase(-2, 5, -10)]
        [TestCase(2.5, 4, 10)]
        [TestCase(0, 100, 0)]
        public void TestMultiplication(double num1, double num2, double expected)
        {
            double actual = calculator.Multiplication(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Test Division
        // -----------------------------

        [TestCase(20, 5, 4)]
        [TestCase(100, 10, 10)]
        [TestCase(10, 2, 5)]
        public void TestDivision(double num1, double num2, double expected)
        {
            double actual = calculator.Division(num1, num2);

            Assert.AreEqual(expected, actual);
        }

        // -----------------------------
        // Division By Zero
        // -----------------------------

        [Test]
        public void TestDivisionByZero()
        {
            try
            {
                calculator.Division(10, 0);

                Assert.Fail("Division by zero");
            }
            catch (ArgumentException ex)
            {
                Assert.AreEqual("Second Parameter Can't Be Zero", ex.Message);
            }
        }

        // -----------------------------
        // Test Void Method
        // -----------------------------

        [Test]
        public void TestAddAndClear()
        {
            calculator.Addition(10, 20);

            Assert.AreEqual(30, calculator.GetResult);

            calculator.AllClear();

            Assert.AreEqual(0, calculator.GetResult);
        }
    }
}