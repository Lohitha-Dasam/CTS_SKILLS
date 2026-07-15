using NUnit.Framework;
using Moq;
using ConverterLib;

namespace ConverterLib.Tests
{
    [TestFixture]
    public class ConverterTests
    {
        private Mock<IDollarToEuroExchangeRateFeed> exchangeRateMock;
        private Converter converter;

        [SetUp]
        public void SetUp()
        {
            exchangeRateMock = new Mock<IDollarToEuroExchangeRateFeed>();

            exchangeRateMock
                .Setup(x => x.GetDollarToEuroExchangeRate())
                .Returns(0.85);

            converter = new Converter(exchangeRateMock.Object);
        }

        [TestCase(100, 85)]
        [TestCase(200, 170)]
        [TestCase(50, 42.5)]
        public void USDToEuro_ValidAmount_ReturnsConvertedValue(double usd, double expected)
        {
            double actual = converter.USDToEuro(usd);

            Assert.That(actual, Is.EqualTo(expected));
        }

        [Test]
        public void USDToEuro_ExchangeRateService_CalledOnce()
        {
            converter.USDToEuro(100);

            exchangeRateMock.Verify(
                x => x.GetDollarToEuroExchangeRate(),
                Times.Once);
        }
    }
}